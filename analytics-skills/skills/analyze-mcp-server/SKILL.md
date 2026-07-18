---
name: analyze-mcp-server
description: >-
  Analyze MCP server usage instrumented with Amplitude's MCP Analytics SDK: break
  usage and errors down by tool, read the rationales within each tool to see what
  callers are trying to do, and produce a prioritized write-up of actionable fixes.
  Use this skill whenever the user asks to understand how their MCP server is being
  used, what agents/users are trying to do with it, why tool calls are failing, what
  to fix or improve in their MCP server, or asks for an "MCP usage report", "tool
  error analysis", "intent analysis", "rationale clustering", or "MCP insights". Also
  trigger when the user mentions [MCP]-prefixed events, tool rationale, tool call
  errors, or just finished instrumenting their MCP server and wants to see what the
  data says. Requires the Amplitude MCP connector.
---

# Analyze MCP Server — Intent & Error Analysis

Produce a report that answers three questions about an MCP server instrumented with
Amplitude's MCP Analytics SDK:

1. **Which tools are used, and which ones fail?** (per-tool volume + error rate)
2. **What are callers trying to do with each tool, and where does each intent break?**
   (rationales *within* a tool × error message)
3. **What should the team fix first?** (fixes grounded in error evidence, not vibes)

The core move that makes this analysis valuable: **tool locates the fix; rationale explains
the intent behind it.** An overall error rate says "4.5% of calls fail." Broken down by tool
it says "`query_chart` fails 22% of the time" — now you know what to open. Adding the
rationales *within that tool* says "the failures are dashboard-refresh agents hitting the
batch-size limit" — now you know why, and the fix writes itself. Rationale is largely
tool-scoped (each tool has its own reason-for-calling), so **tool is the primary axis and
rationale is the second cut inside it** — clustering rationales globally just re-derives the
tool boundaries while mixing incomparable intents.

## Prerequisites

- Amplitude MCP connector active. If it isn't, stop and ask the user to add the Amplitude
  connector in their tools/connector settings — there is no fallback data source.
- A project containing the SDK's events. The SDK emits **SDK-owned default events**, all
  prefixed `[MCP]`, and — critically — **every default property they carry is also `[MCP]`-prefixed**, they might have custom properties.

  Events:
  - `[MCP] Tool Call Response` — the workhorse: one event per tool invocation that reached a
    tool callback (success or error).
  - `[MCP] Tool Call Rejected` — a `tools/call` that failed *before* any tool ran (unknown/
    disabled tool, input-schema validation). This is where hallucinated/typo'd tool names
    land, carried on `[MCP] Attempted Tool Name` (kept off the reserved `[MCP] Tool Name`).
  - `[MCP] Session Initialized`, `[MCP] Session Ended`, `[MCP] Tools Listed`.

  Key properties on `[MCP] Tool Call Response`: `[MCP] Tool Name`, `[MCP] Client Name`,
  `[MCP] Client Version`, `[MCP] Session ID`, `[MCP] Auth Type`, `[MCP] Rationale`,
  `[MCP] Is Error`, `[MCP] Error Message`, `[MCP] Error Type` (`returned_error` vs
  `thrown_exception` — separates a tool that reported failure from one that crashed),
  `[MCP] Response Duration`, `[MCP] Response Size`, `[MCP] Request Size`.
- Event/property names can still drift between SDK versions. Never assume — verify with the
  taxonomy tools in Phase 0. The canonical names above come from the SDK's `constants.ts`
  (`EVENT_PROPERTY_KEYS`); if the project's data disagrees, trust the project and adapt.

## Phase 0 — Locate and validate the data

1. Call the Amplitude context tool (no projectId) to list projects. If more than one
   plausible project exists and the user hasn't specified, ask.
2. Confirm the `[MCP]` events exist in the chosen project (search for events or list events;
   `get_events` filters by exact name only, so use search for the `[MCP]` prefix discovery).
3. Pull event properties for `[MCP] Tool Call Response` (and `[MCP] Tool Call Rejected`) to
   confirm the exact property names — remember they are `[MCP]`-prefixed and Title Cased
   (e.g. `[MCP] Rationale`, not `tool rationale`). Bind whatever you find to the names used
   in the queries below.
4. Run one volume/recency query: totals of `[MCP] Tool Call Response`, `[MCP] Session Initialized`
   over the last 60 days, weekly interval. This tells you the usable date window and whether
   there's enough data. Under ~5k tool calls total, warn the user that per-tool breakdowns
   will be thin and percentages unstable — still proceed, but say so in the report.

Record: project ID, date window, total call volume. Every later query uses the same range so
numbers stay comparable.

## Phase 1 — Break down by tool (the spine)

This is the primary map; everything else drills into it.

- **Volume by tool:** totals of `[MCP] Tool Call Response`, grouped by `[MCP] Tool Name`,
  groupByLimit ~100.
- **Errors by tool:** same, plus filter `[MCP] Is Error is "true"`.
- **Rejected calls by attempted name:** totals of `[MCP] Tool Call Rejected` grouped by
  `[MCP] Attempted Tool Name`. These never reach a callback, so they are invisible to the two
  queries above — but a high-volume attempted name that isn't a real tool is one of the most
  actionable findings there is (a rename or hallucination agents keep guessing).

Compute per-tool **call volume, error count, and error rate**, and rank tools two ways: by
call volume (what's load-bearing) and by *error volume* (what's costing the most failures).
Pick the **top 3–5 tools** for deep-dive — bias toward high error volume, not just high
traffic, and honor the user's choice if they named specific tools. A low-traffic tool with a
90% error rate can outrank a busy healthy one.

## Phase 2 — Rationales within each top tool (the "why")

For each top tool, sample its rationales — totals of `[MCP] Tool Call Response` grouped by
`[MCP] Rationale`, **filtered to that one tool** (`[MCP] Tool Name is "<tool>"`), groupByLimit
~150. Then read them and group by *what the caller is trying to accomplish with this tool*,
not by wording. Guidance:

- Within a single tool you'll usually find **2–5 intent groups**, not nine — the tool already
  narrows the purpose. Name them by intent (e.g. for a `query_chart` tool: "live dashboard
  refresh", "ad-hoc exploration", "scheduled report generation").
- Weight by call volume (each rationale value carries its total), not by distinct strings.
- **Watch for a junk group**: "placeholder", "ignore", "noop", "test", "dummy", single letters.
  Its size is a rationale-hygiene finding, and junk must not contaminate real intents.
- Rationales like "Retry after rate limit" / "Retrying X" signal retry loops — note them.
- Non-English rationales are normal; group them by meaning.
- Compute **rationale coverage per tool** (share of the tool's calls with a non-empty
  rationale). If it's low (<50%), the intents describe only a slice — say so, and
  "improve rationale coverage at instrumentation time" becomes a recommendation itself.
- Compute **top-intent share per tool** (the largest intent group as a % of the tool's
  rationale-covered calls). This is the concentration signal: ~90% means the tool serves one
  job and you can optimize hard for it (tighten the schema/description around that path); a
  flat spread (top intent ~30%) means the tool is overloaded and may deserve splitting, or its
  errors will be spread across unrelated intents. Report the number and, when the top intent is
  dominant, name it next to the tool.

**Cross-tool workflows (secondary):** some rationales describe a multi-tool goal
("resolve chart id before refreshing the dashboard"). Where a single intent clearly spans
tools (e.g. `search_events` → `create_chart` → `create_dashboard`), call it out as a workflow
in the cross-cutting section — it's the one thing a pure tool-by-tool view misses.

## Phase 3 — Error drill-down per tool

For each top tool, run (filtered to that tool + `[MCP] Is Error is "true"`):

- grouped by `[MCP] Error Message` → why it fails
- optionally split by `[MCP] Error Type` (`returned_error` vs `thrown_exception`) when a
  message is ambiguous — a crash and a well-formed refusal both raise `[MCP] Is Error`, but
  only one is a bug in the tool.

Where a tool has a dominant intent group from Phase 2, qualify the errors by rationale
(add the rationale-`contains` filter) to get the "this intent breaks this way" sentence.

Classify each significant error message into an archetype — the archetype determines the fix:

| Archetype | Signature | Fix pattern |
|---|---|---|
| Stale/hallucinated tool name | `[MCP] Tool Call Rejected` with `[MCP] Attempted Tool Name` = a renamed or plausible-sounding tool | Server-side aliases for renamed tools; rejection responses that name the closest real tool so agents self-correct in one shot |
| Missing required param | validation error, "Required", path names a param | Loosen the schema (accept single value or array, add defaults), or make the tool description state requirements so agents get it right pre-flight |
| Schema shape mismatch | "Expected object, received string" etc. | Add coercion server-side, or an inline example in the tool description |
| Hard limit collision | "Maximum of N …", "too_big" | Raise the limit, auto-chunk server-side, or state the limit in the parameter description — agents currently only learn limits by failing |
| Range/retention violation | "time range too large", "does not retain data before …" | Auto-coerce (e.g. downgrade granularity) instead of erroring; advertise retention/range limits in the context payload |
| Chicken-and-egg param | a context/discovery tool requires the very ID it exists to provide | Make discovery tools work with zero required args, defaulting from the auth token |
| Permission denied | role/permission language | Distinct error class so "not allowed" is separable from "broken"; often also a docs/onboarding gap |
| Recurring scheduled error | same message repeating daily on the same tool | Fix the job's caller if internal; for the product, flag as silently-degrading automation — nobody is watching a chat window |
| Transient/upstream | 5xx, timeouts, rate limits | Retry-after hints in the error body; check whether retries actually happen (see loop funnel) |

The best error messages state the fix ("re-run with start >= …"). Hold every high-volume error
message to that standard — "make this error as actionable as your best one" is often a
legitimate recommendation.

## Phase 4 — Optional context metrics

Add if time permits; they sharpen the story:

- **Repeat-error loop:** 3-step funnel, each step `[MCP] Tool Call Response` with
  `[MCP] Is Error is "true"`, holding `[MCP] Tool Name` constant, ~1h conversion window.
  Shows what share of erroring users spiral into loops on the same tool. (Steps need not be
  consecutive events — say "3+ errors on the same tool within an hour", not "3 consecutive".)
- **Error → recovery:** 2-step funnel, error then success, holding tool name constant.
  High recovery + high loop rate together mean the cost is wasted tokens/latency, not
  abandonment — a materially different conclusion.
- **Client mix:** uniques grouped by `[MCP] Client Name`. Large "unknown" share or
  near-duplicate client names (casing, plugin-prefixed variants) are instrumentation
  findings worth reporting.

## Phase 5 — Verify, then write

Before writing, re-verify at least one headline number a second way (e.g. overall error rate
via a separate two-event totals query). Recompute every percentage you quote from raw totals.
If a number can't be verified, cut it or label it an estimate.

### Report structure

Use this template — organized tool-first:

```
# MCP Server Analysis — <server/project name>

Data: <project>, <date window>, <N> tool calls, overall error rate <X>%.
Method note: tool breakdowns are exact query results; within-tool intents are model-derived
from rationales (directional). Rejected-call names come from [MCP] Tool Call Rejected.

## Tools at a glance
<table: tool | calls | errors | error rate | top intent (share %) | rationale coverage>
<one line on rejected/attempted tool names if material; call out junk rationales if material>

## Deep dive: top 3–5 tools (ranked by error volume)
For each tool:
**Tool: <name> — <calls>, <error rate> — what it's for: <one-sentence>**
- Intents (rationales within this tool): <group : share>, …
- 1–4 numbered recommendations. Each states the evidence (error message + count),
  the archetype, and the concrete fix. Lead with the fix that removes the most error volume.

## Cross-cutting findings
<cross-tool workflows, loop/recovery rates, client-name hygiene, rationale hygiene, internal test traffic, …>

## The one-sentence takeaway
<the single change that removes the most failure volume, with its number>
```

Style: numbers next to every claim; name the error messages verbatim (truncated) so
engineers can grep for them; recommendations phrased as actions ("Ship alias for
query_chart → query_charts"), not observations ("tool naming could be improved").

### Charts in the output

Render supporting Amplitude charts where the client supports it, using the ad-hoc chart
query + render tools (build an `eventsSegmentation`/`funnels` definition, then render it).
Be deliberate about **what can and cannot be a chart**:

- **Chartable — anything query-backed.** These are real Amplitude segmentation/funnel
  results, so render them: calls and errors by tool (grouped by `[MCP] Tool Name`), error
  rate over time, rejected calls by `[MCP] Attempted Tool Name`, the per-tool repeat-error
  loop and recovery funnels, and client mix by `[MCP] Client Name`. The tool breakdown is the
  natural hero chart.
- **Not chartable — the within-tool intent groups.** Grouping rationales into intents happens
  *in this model*; those groupings don't exist as an Amplitude property, so there's no saved
  chart for "calls by intent." Present intents as a table built from the rationale totals, and
  say plainly that intent figures are model-derived (directional) while the charts you render
  are exact query results. Don't imply a rendered chart backs the intent grouping.

## Query Cookbook

All queries are `eventsSegmentation` or `funnels` definitions against the project ID from
Phase 0. Adjust event/property names to whatever Phase 0 verified. Shapes that are known
to work:

**Tools breakdown (Phase 1):**
```json
{"type":"eventsSegmentation","app":"<PROJECT_ID>","name":"[MCP] Calls by Tool",
 "params":{"range":"Last 30 Days",
  "events":[{"event_type":"[MCP] Tool Call Response",
    "group_by":[{"type":"event","value":"[MCP] Tool Name"}]}],
  "metric":"totals","countGroup":"User","groupBy":[],"interval":30,"segments":[{"conditions":[]}]}}
```
Errors-by-tool: add `{"subprop_type":"event","subprop_key":"[MCP] Is Error","subprop_op":"is","subprop_value":["true"]}`
to `filters`. groupByLimit ~100.

**Rejected calls (Phase 1):** totals of `[MCP] Tool Call Rejected` grouped by
`[MCP] Attempted Tool Name` — catches hallucinated/renamed tool names that never fire an error
on `[MCP] Tool Call Response`.

**Rationales within a tool (Phase 2):**
```json
{"type":"eventsSegmentation","app":"<PROJECT_ID>","name":"[MCP] Rationales for <tool>",
 "params":{"range":"Last 30 Days",
  "events":[{"event_type":"[MCP] Tool Call Response",
    "filters":[
      {"subprop_type":"event","subprop_key":"[MCP] Tool Name","subprop_op":"is","subprop_value":["<tool>"]},
      {"subprop_type":"event","subprop_key":"[MCP] Rationale","subprop_op":"is not","subprop_value":["(none)"]}],
    "group_by":[{"type":"event","value":"[MCP] Rationale"}]}],
  "metric":"totals","countGroup":"User","groupBy":[],"interval":30,"segments":[{"conditions":[]}]}}
```
Use groupByLimit ~150. Set the time-series limit to 0 or low — only totals matter. Drop the
`is not (none)` filter once to measure that tool's rationale coverage.

**Per-tool errors (Phase 3):** same shape, ONE event, `[MCP] Tool Name is "<tool>"` +
`{"subprop_key":"[MCP] Is Error","subprop_op":"is","subprop_value":["true"]}`, group_by
`[MCP] Error Message` (or `[MCP] Error Type`). Add a `[MCP] Rationale contains [...]` filter to
qualify errors by intent.

**Loop funnel (Phase 4):**
```json
{"type":"funnels","app":"<PROJECT_ID>","name":"[MCP] Repeated Error Loop",
 "params":{"range":"Last 30 Days",
  "events":[<error-filtered Tool Call Response> x3],
  "cs":3600,
  "holdingConstant":[{"type":"event","value":"[MCP] Tool Name"}],
  "countGroup":"User","segments":[{"conditions":[]}]}}
```
Recovery funnel: 2 steps, second step filter `[MCP] Is Error` `is not` `true`. Read the
"Total" row of funnel output; daily rows are often zero-filled and misleading.

**Known pitfalls:**
- Every SDK property is `[MCP]`-prefixed and Title Cased — `[MCP] Tool Name`, `[MCP] Rationale`,
  `[MCP] Is Error`, `[MCP] Error Message`, `[MCP] Response Duration`, `[MCP] Response Size`.
  Bare names won't match.
- Group-by values only render when a single event in the definition carries the group_by.
  Put only ONE grouped event per query; volume/error-count totals (no group-by) can share one.
- `propavg` is not a valid metric; property aggregations use `sums`/`value_avg` with the
  property in the event group_by. Skip property aggregations if they fight back — they are
  not core to this analysis.
- High-cardinality group-bys (`[MCP] Session ID`) will not work; don't try.
- Free-text properties (`[MCP] Rationale`, `[MCP] Error Message`) can be long — keep
  groupByLimits modest and let volume ranking do the work.
