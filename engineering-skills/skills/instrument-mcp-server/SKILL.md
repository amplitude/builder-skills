---
name: instrument-mcp-server
description: Instrument a Node/TypeScript MCP server with Amplitude's @amplitude/mcp-analytics SDK so tool calls, sessions, and rationale are tracked as Amplitude events. Use this skill whenever the user wants to add Amplitude analytics to their MCP server, mentions "MCP Analytics", "@amplitude/mcp-analytics", "instrument my MCP server", "track MCP tool calls", "add rationale to my MCP tools", or wants agent traffic (Claude, Cursor, ChatGPT) attributed back to Amplitude. Also use for adding UTM tagging to MCP-returned links, or for troubleshooting identity/user_id mismatches between MCP events and web/mobile Amplitude data.
---

# Amplitude MCP Analytics Setup

Instruments an MCP server so every tool call becomes an Amplitude event, joinable with the rest of the
product's Amplitude data (retention, revenue, web/mobile usage).

**The authoritative SDK reference is the package README:**
https://github.com/amplitude/Amplitude-MCP-Analytics-Node (npm: `@amplitude/mcp-analytics`).
The SDK is in preview and evolves quickly — **always fetch the latest README and follow it for
installation, API shapes, configuration, and default events.** Do not rely on memorized snippets or
this skill's summaries for SDK API details; the README wins on any conflict.

There are four steps. **Steps 1–2 are required** and are documented in the README — this skill tells
you which sections to follow and which invariants to verify. **Steps 3–4 are strongly recommended**
and are documented in full here, because they require changes *outside* the SDK (the server's tool
schemas and the product's web app) that the SDK README intentionally does not cover.

Do them in order: Step 1 (tool calls) → Step 2 (identity) → Step 3 (rationale) → Step 4 (UTM, only if
the server returns links). Get identity right before calling anything "done" — everything downstream
depends on it.

## Before you start

Confirm:
1. This is a **Node/TypeScript** MCP server built on `@modelcontextprotocol/sdk`. This SDK doesn't support other languages/runtimes.
2. The user has (or can get) an **Amplitude API key** for the project they want events to land in.
3. Which package manager the repo uses (pnpm/npm/yarn) — adjust the install command accordingly.

## Step 1 — Install the SDK and track tool calls (required)

Fetch the README and follow its **Install** and **Quick start** sections. **Always install the latest
published version** (e.g. `pnpm add @amplitude/mcp-analytics@latest`) — never pin a version from
memory, and don't reproduce install commands from this skill.

Invariants to verify once wired up (the README explains each):

- `analytics.instrumentServer(server, ...)` runs **before** `server.connect()` — order matters.
- **Every** tool handler is wrapped with `analytics.instrumentTool(...)`. Unwrapped tools aren't
  tracked. The wrapper has the identical shape to the handler and is a no-op passthrough if the
  server was never bound, so it's safe to wrap defensively.
- Default events all carry the `[MCP] ` prefix, so they never collide with the product's existing
  Amplitude events. See the README's **Default events** table (and `docs/events.md` in the repo) for
  the current event set and properties.

Optional: attach stable custom dimensions (plan tier, team, feature flags) via `extra` on
`instrumentTool`/`instrumentServer` — see the README's **Custom event properties** section.

## Step 2 — Get identity right (required, do this before calling Step 1 "done")

MCP events must carry the **same `user_id`** the product already sends to Amplitude from web/mobile.
Skip this and MCP usage shows up as a disconnected population that can't be joined to product data —
this defeats most of the point of the integration.

Follow the README's **Identity** section for the current API: it offers server-level binding,
per-request `setIdentity()` inside a handler, and an opt-in `resolveIdentity` mapping from the
request's `authInfo` claims. Pick whichever fits the server's auth model.

One behavior to surface to the user: fully anonymous, anchor-less events are **dropped by default**
(not counted as users) unless explicitly opted in via `emitAnonymousEvent: true` for aggregate-only
tracking — ask before turning this on, since it changes what gets counted.

## Step 3 — Capture rationale (recommended)

Unlike a human clicking a button, an agent can tell you *why* it called a tool. Capturing this turns
the data from "what happened" into "what the user was trying to do."

The SDK side is one call (`analytics.setRationale(...)` — see the README's **Rationale** section),
but the SDK never reads rationale out of tool inputs itself: **how the rationale reaches the server
is a server-side convention this skill implements.** The battle-tested pattern is schema injection —
add an optional `rationale` field to **every** tool's input schema. Because the parameter is described
in the schema agents already read, they fill it in unprompted, across all clients, with zero
client-side changes:

```typescript
// Add to every tool's input schema (zod example):
rationale: z
  .string()
  .optional()
  .describe(
    'Brief explanation of why you are calling this tool and what ' +
    'you expect to learn from the result.',
  ),
```

Then read it inside the instrumented handler and hand it to the SDK:

```typescript
analytics.instrumentTool(async (args, extra) => {
  if (typeof args.rationale === 'string') {
    analytics.setRationale(args.rationale);
  }
  return doWork(args);
}, { name: 'search' });
```

Making the field optional means nothing breaks when an agent omits it. It is emitted as the reserved
`[MCP] Rationale` property (truncated to 1,000 chars; last write wins). Worth doing on every tool,
not just a sample.

## Step 4 — UTM-tag outbound links (recommended, only if the server returns URLs)

This step is entirely outside the SDK — it changes how the server builds URLs and depends on the
product's web-side analytics. It is **not** covered in the SDK README.

If any tool response includes a link (dashboard, doc, product page), tag it before it leaves the
server so click-throughs are attributable to MCP/agent traffic instead of showing up as direct:

```typescript
function addUtmParams(url: string, clientName?: string): string {
  const u = new URL(url);
  u.searchParams.append('utm_source', 'mcp');
  u.searchParams.append('utm_medium', 'referral');
  // The connected client (e.g. "Claude", "Cursor"), if you know it:
  u.searchParams.append('utm_content', clientName ?? 'unknown');
  return u.toString();
}
```

Route every URL-building path in tool responses through one central function like this — a single
untagged link breaks the attribution story for that flow.

**Prerequisite (tell the user this explicitly):** this only works if their web analytics captures UTM
params on page-view events (or whatever event their site fires on landing). Amplitude's Browser SDK 2
does this by default — see [Track marketing attribution](https://amplitude.com/docs/sdks/analytics/browser/browser-sdk-2#track-marketing-attribution)
(UTM, referrer, and click ID parameters are captured out of the box). If they use a custom page-view
tracker, they need to confirm UTM values land on those events too, or there's nothing to join the
MCP-tagged clicks against.

Relevant Amplitude documentation:

- [Browser SDK 2 — Track marketing attribution](https://amplitude.com/docs/sdks/analytics/browser/browser-sdk-2#track-marketing-attribution) (web-side UTM capture, the implementation half of this step)
- [Sessions, channels, and attribution for marketing analytics](https://amplitude.com/docs/analytics/marketing-analytics) (how the tagged traffic becomes channel analysis)
- [Autocapture](https://amplitude.com/docs/get-started/autocapture) (page views and more)

## After instrumenting

Once events are flowing, point a coding agent at Amplitude's published `analyze-mcp-server` skill to run
intent clustering and surface tool-call error patterns by intent. (If this project has the
`mcp-intent-error-analysis` skill installed, that's the one — use it once the user has data flowing and
wants to analyze it, rather than duplicating that analysis here.)

## Common mistakes to flag

- Following stale API snippets instead of the current README — fetch it fresh; the SDK is in preview and moves fast.
- Installing a pinned/older version instead of the latest release.
- Calling `instrumentServer()` after `server.connect()` — must be before.
- Wrapping some tool handlers but not others — every tool needs `instrumentTool`.
- Sending a `user_id` that doesn't match the one used on web/mobile — breaks joinability, the whole point of the integration.
- Turning on `emitAnonymousEvent: true` without the user understanding it inflates aggregate counts with anchor-less traffic.
- Forgetting the UTM prerequisite (web-side capture) and assuming tagging links alone is sufficient.
