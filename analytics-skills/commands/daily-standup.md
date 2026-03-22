---
name: daily-standup
description: Run a full daily standup — combines daily brief, experiment monitoring, and feedback scanning into one workflow.
---

# Daily Standup

Run a complete daily standup by orchestrating multiple analytics skills into a single briefing.

## Workflow

1. **Daily Brief** — Run the `daily-brief` skill to surface anomalies, trends, and wins from the last 1-2 days.
2. **Experiment Check** — Run the `monitor-experiments` skill to check on any active or recently decided experiments. Summarize status and flag anything that needs attention.
3. **Feedback Scan** — Run the `analyze-feedback` skill scoped to the last 2 days to catch emerging themes, new bugs, or urgent pain points.
4. **Synthesize** — Combine findings into a single standup summary:
   - **Top 3 things to know today** — The most important signals across all sources.
   - **Action items** — Concrete next steps with owners where possible.
   - **Watch list** — Things that aren't urgent yet but could become urgent.

## Output Format

Keep the standup under 500 words. Use short paragraphs, not bullet-point walls. Lead with the most important finding. End with a single follow-on prompt the user can run to dig deeper.

## When to Use

- Morning kickoff to get up to speed
- Before standups or syncs to prep talking points
- After a deploy to check for regressions
