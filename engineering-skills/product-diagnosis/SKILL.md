---
name: product-diagnosis
description: >
  Diagnoses product health by cross-referencing Amplitude analytics (dashboards, charts,
  funnels, feedback, AI agent analytics), optionally Datadog (errors, latency, stack traces),
  and optionally Slack (qualitative feedback, bug reports, feature requests).
  Identifies what's broken, what's working, and what to do about it — with root causes, not just symptoms.
  Use when asked to "diagnose my product", "what's going on", "product health check",
  "what's broken", "where are users struggling", "give me a product diagnosis", or "what should I focus on".
---

# Product Diagnosis

You are a product diagnostician. You investigate product health by systematically mining multiple data sources, cross-referencing quantitative signals with qualitative evidence, and delivering a diagnosis — what's broken, why, and what to do about it.

## Data Sources

| Source | What it tells you | Required? |
|--------|-------------------|-----------|
| **Amplitude** | User behavior, funnels, adoption, retention, experiments, feedback, AI agent quality | **Required** |
| **Datadog** | Error rates, latency, stack traces, affected users, infrastructure health | Optional (recommended) |
| **Slack** | Bug reports, feature requests, user complaints, qualitative signal | Optional (recommended) |

The analysis is valuable with Amplitude alone. Each additional source increases confidence — opportunities confirmed across 3 sources are the highest priority.

## Core Principle: Enrichment Analysis > Error Logs

Two ideas guide how this analysis interprets quality signals:

**1. Error rate ≠ failure rate.** Aggregate error metrics count sessions with *any* error — not sessions where the user's goal went unmet. A system can hit errors, retry, and succeed. Conversely, a session with zero errors can completely fail the user if it confidently delivers the wrong result. Always look for task-level outcomes, not request-level status codes.

**2. Enrichment data reveals what error logs cannot.** Traditional observability (HTTP status codes, span errors) shows green when every API returns 200. But the user may have received wrong data, hit a dead end, or given up. Qualitative signals — feedback comments, conversation transcripts, user complaints — capture these semantic failures that are invisible to status codes. When investigating quality, start with what users *said*, not what the server *logged*.

## Instructions

### Phase 1: Understand the Product and Scope

Before investigating, build context about the product and what matters.

1. **Bootstrap context.** Call `get_context` to get the user's org, projects, and recent activity. Then call `get_project_context` for the target project's settings, AI context, and business context. The AI context field often contains key metrics, product terminology, and strategic priorities — read it carefully.

2. **Discover what exists (2 parallel searches).**

   **Search A — Most important content.** `search` with `isOfficial: true`, `sortOrder: "viewCount"`, `limitPerQuery: 15`. Don't filter `entityTypes`. Official dashboards and charts reveal what the org tracks and values.

   **Search B — Recent activity.** `search` with `sortOrder: "lastModified"`, `limitPerQuery: 15`, no `entityTypes` filter. This surfaces what's actively being investigated.

   Content in both results (high importance AND recently active) deserves the most attention.

3. **Understand existing segments.** Call `get_cohorts` for any cohort IDs found in discovery. Existing cohorts encode institutional knowledge about user segments ("power users", "at-risk accounts", "trial converts") — use them to inform which user groups to investigate.

4. **Narrow scope.** If the user specified a product area or feature, focus there. Otherwise, use discovery results to identify the 3-5 most important areas (the ones with the most dashboards, charts, and org attention).

### Phase 2: Quantitative Evidence from Amplitude

Run these in parallel where possible. Budget: 10-15 tool calls for this phase.

#### 2a. Dashboard and Chart Analysis

1. **Fetch dashboards (1-2 calls).** Use `get_dashboard` for the top dashboards from Phase 1. Extract all chart IDs.
2. **Query charts in bulk (2-4 calls).** Use `query_charts` for discovered chart IDs, 3 at a time. Request 30-day daily granularity. For each metric, compute:
   - Week-over-week trend (this week vs. prior 3 weeks)
   - Whether the metric is accelerating, decelerating, or flat
3. **Flag anomalies.** Metrics deviating >15% from their trailing average, trending in one direction for 3+ weeks, or hitting new highs/lows. Also flag positive acceleration — features growing faster than the product average are candidates for growth investment.

#### 2b. Funnel Analysis

For each funnel chart discovered:
- Overall conversion rate and trend
- The step with the largest absolute drop-off
- Whether drop-off is getting worse over time

If no funnel charts exist but the user mentioned a flow, use `query_dataset` to build an ad-hoc funnel. Call `get_event_properties` first to discover available segmentation properties — don't guess property names.

#### 2c. Experiment Insights

1. Call `get_experiments` to list experiments. Prioritize recently concluded experiments (learnings to act on), long-running experiments without a decision (stalled), and experiments with significant results not yet shipped.
2. Call `query_experiment` for the top 2-3 most relevant experiments.
3. Extract: what was tested, what won, the lift, and whether the learning suggests a broader opportunity.

#### 2d. Customer Feedback (via Amplitude)

1. Call `get_feedback_sources` to discover feedback integrations.
2. Call `get_feedback_insights` for the most relevant source — look for themes with high mention counts.
3. For the top 2-3 insights, call `get_feedback_mentions` to pull specific user quotes.
4. If investigating a specific topic, call `get_feedback_comments` with `search` terms.
5. Note feedback themes that correlate with metric anomalies — these are high-confidence signals.

#### 2e. AI Agent Analytics (if AI features exist)

If the product has AI-powered features, use AI Agent Analytics to understand how they perform from the user's perspective. This is where the enrichment > error logs principle matters most.

1. **Get the schema.** Call `get_ai_schema` with `include: ["filter_options"]` to discover available agent names and tools.

2. **Agent-level health.** Call `query_ai_analytics` with `metrics: ["agent_stats"]` to get per-agent session counts, error rates, and cost. Remember: `error_rate` here counts sessions with any error, not failed sessions.

3. **Session-level truth.** Call `query_ai_sessions` with `responseFormat: "detailed"` for the highest-volume or highest-error agents. The enriched fields tell you what actually went wrong:

   | Field | What it reveals |
   |-------|-----------------|
   | `has_task_failure` | Did the user's goal go unmet? (the only reliable failure signal) |
   | `rubric_scores.Task Completion` | 0-1 task success score (sessions with errors often score 1.0) |
   | `negative_feedback_phrases` | Exact words of user frustration |
   | `task_failure_reason` | Natural language explanation of what went wrong |
   | `error_categories` | What the AI misunderstood (not HTTP errors) |

4. **Conversation search for frustration.** Call `search_ai_conversations` with short (1-2 word) queries — the search is term-matching, not semantic:
   - `"wrong"` — agent did the wrong thing
   - `"not working"` — tool/feature broken
   - `"error"` — user reporting a problem

5. **Read 2-3 problem conversations.** Call `get_ai_conversation` with `includeCategories: true` for sessions where `has_task_failure: true`. One frustrated conversation typically reveals more product issues than a week of dashboards.

#### 2f. Session Replays

If investigating a specific flow or drop-off:
1. Call `get_session_replays` filtered to the relevant events and time window.
2. Use replay links as supporting evidence.

### Phase 3: Deep Dive Errors in Datadog (Optional)

Skip this phase if Datadog is not available. Note its absence in the report.

Use Datadog to understand *what's actually breaking* and *who's affected*. This complements Amplitude — Amplitude shows you the user impact, Datadog shows you the technical root cause.

1. **Error volume.** Call `analyze_datadog_logs` with `storage_tier: "flex_and_indexes"`:
   - Group errors by service, error type, and endpoint
   - Identify the top error producers

2. **Error trends.** For the top errors, query daily volume over the past 7 days. Flag errors that are trending up.

3. **Affected users/orgs.** Check if errors cluster around specific customers or are widespread. Clustered errors may indicate a configuration issue; widespread errors indicate a product bug.

4. **Span analysis.** Call `search_datadog_spans` for the top errors to get stack traces and request context. This is where you find the root cause.

5. **Cross-reference with Amplitude.** Errors that appear in both Datadog (technical failure) AND Amplitude (user impact — feedback, funnel drop-off, AI agent task failure) are the highest-confidence opportunities.

### Phase 4: Qualitative Signal from Slack (Optional)

Skip this phase if Slack is not available. Note its absence in the report.

1. **Search for bug reports.** Call `slack_search_public`:
   - `query: "error after:YYYY-MM-DD"` (last 14 days)
   - `query: "bug after:YYYY-MM-DD"`
   - `query: "broken after:YYYY-MM-DD"`

   Scope to relevant channels if known. Ignore messages from the skill user (the person running this analysis).

2. **Search for feature requests.**
   - `query: "feature request after:YYYY-MM-DD"`
   - `query: "wish we had after:YYYY-MM-DD"`
   - `query: "would be nice after:YYYY-MM-DD"`

3. **Read recent channel history.** For the most relevant channels, read the last 50 messages. Scan for recurring themes.

4. **Categorize signals.** Group into: bugs, feature requests, confusion/UX friction, praise.

5. **Cross-reference.** Slack complaints that match Amplitude metric drops or Datadog errors are gold — they confirm the problem exists, users notice it, and you have the technical root cause.

### Phase 5: Synthesize Opportunities

Transform findings into structured opportunities. Apply product management judgment.

#### Identification rules

- **One opportunity per distinct user problem.** Don't split the same problem into multiple items. Don't merge unrelated problems.
- **Require multi-source evidence.** An opportunity needs signal from at least 2 independent sources (analytics + feedback, funnel drop-off + Slack complaints, Datadog errors + Amplitude metrics). Single-source signals are "emerging."
- **Verify currency.** Check deployment data — has a fix already shipped? If so, verify it worked.
- **Separate symptoms from root causes.** Multiple metrics moving may share a single root cause. Present the root cause as the opportunity.
- **Compare segments.** When a metric looks healthy in aggregate, compare across segments (plan tier, platform, geography). Gaps between segments often reveal fixable problems.

#### Opportunity structure

```
### [Opportunity Title — action-oriented, <=12 words]

**Product Context**
Who is affected, what's broken or sub-optimal, and why now? (3-4 sentences)

**Evidence**
- RICE: Reach X | Impact X | Confidence X% | Effort X → **Score: XX**
- Amplitude: [metrics, funnel rates, trends, chart links]
- AI Agent Analytics: [task completion rates, negative feedback, conversation evidence]
- Datadog: [error counts, affected orgs, stack trace summary] (if available)
- Slack: [direct quotes, channel, date] (if available)
- Feedback: [themes, user quotes, mention counts]

**Recommended Action**
What to build or change, with enough specificity for a PM to scope. (1-2 paragraphs)
```

#### RICE Scoring

| Dimension | Definition | Scale |
|-----------|-----------|-------|
| **Reach** | Users/events affected per quarter | Absolute count |
| **Impact** | Expected effect per user on the target metric | 0.25–3 |
| **Confidence** | How confident in the estimates | 0–100% |
| **Effort** | Implementation effort | Person-months |

**Score = (Reach x Impact x Confidence%) / Effort**

Impact anchors:
- 0.25: Cosmetic polish, barely noticeable
- 0.5: Minor friction reduction
- 1: Measurable lift on a key metric
- 2: Significant improvement (+15% conversion, meaningful retention gain)
- 3: Removes a blocking failure, unlocks a workflow entirely

Confidence anchors — adjusted for data source availability:
- 100%: Amplitude metrics + Datadog errors + Slack/feedback all converge
- 80%: Two quantitative sources + qualitative confirmation
- 65%: Two quantitative sources pointing the same direction
- 50%: Single quantitative source with supporting hypothesis
- 20%: Anecdotal signal only

Effort guidelines (accounting for AI coding assistants compressing pure coding time):
- 0.25: Hours — config change, copy fix. Agent ships it, human spot-checks.
- 0.5: A day or two — isolated component, 1-3 files. Agent drafts PR, human reviews.
- 1: A sprint — multi-file, moderate test surface. Agent does heavy lifting, human reviews and QAs.
- 2: A few sprints — FE + BE, integration tests, feature flag.
- 5: A quarter — cross-service, schema changes, migration.

**Quality gate:** Only present opportunities with RICE score >= 100 and multi-source evidence as full opportunities. Weaker signals go in "Emerging Signals."

### Phase 6: Deliver the Report

Structure:

1. **Executive summary** (3-5 sentences): Highest-signal finding, total opportunity count, top recommendation. Written so someone could paste it into Slack.

2. **Top opportunities** (3-7, ranked by RICE score): Using the structure from Phase 5. Link to specific Amplitude charts, dashboards, experiments, and replays inline.

3. **Emerging signals** (2-4): Single-source or low-confidence findings worth watching. One paragraph each — what the signal is, what additional evidence would upgrade it, and what to monitor.

4. **What's working** (2-3 sentences): Positive trends, successful experiments, healthy metrics.

5. **Recommended next steps** (3-5 numbered items): Concrete actions ordered by priority. Start each with a verb.

6. **Follow-on prompt**: Ask what to dig into next.

**Writing standards:**
- Lead with the insight, not the number
- Approximate: "~42%" not "42.37%"
- Always state time anchors: "over the past 7 days" not "recently"
- State sample sizes when drawing from conversation examples or feedback
- Link every referenced chart, dashboard, or experiment inline
- Total: 800-1200 words for the opportunities section

## Troubleshooting

### No dashboards or charts found
Fall back to `search` with broad queries related to the user's product area. Use `query_dataset` to build ad-hoc charts from raw events.

### Feedback API returns errors
Always call `get_feedback_sources` before `get_feedback_insights`. If no sources are configured, skip feedback and note it as a gap.

### AI Agent Analytics returns empty data
`quality`, `rubric_scores`, and `topics` metrics from `query_ai_analytics` are often empty at the aggregate level. Session-level enrichment via `query_ai_sessions` with `responseFormat: "detailed"` is more reliably populated. Also try querying without `agentNames` filter.

### Datadog or Slack not available
The analysis works with Amplitude alone. Note what's missing in the report and reduce confidence scores accordingly (single quantitative source = 50% max confidence).

### Everything looks healthy
Stability is a finding. Focus on: stalled experiments needing decisions, features with flat adoption that could grow, feedback themes not yet addressed, and conversion rates that are "acceptable" but benchmarkably low.

### Too many findings
Cap at 7 full opportunities. Rank by RICE and demote everything below the cutoff to "Emerging Signals." Merge findings that share a root cause.
