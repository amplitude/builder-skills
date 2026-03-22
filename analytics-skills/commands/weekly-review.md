---
name: weekly-review
description: Run a full weekly product review — combines weekly brief, opportunity discovery, and experiment readouts into one workflow.
---

# Weekly Review

Run a comprehensive weekly product review by orchestrating multiple analytics skills.

## Workflow

1. **Weekly Brief** — Run the `weekly-brief` skill to summarize the last 7 days: trends, wins, risks, and inflection points compared to the prior 4-week baseline.
2. **Experiment Readouts** — Run the `monitor-experiments` skill. For any experiments that concluded this week, run `analyze-experiment` on each to generate full readouts with recommendations.
3. **Opportunity Discovery** — Run the `discover-opportunities` skill to cross-reference analytics, experiments, feedback, and session replays for new product opportunities.
4. **Synthesize** — Combine into a weekly review document:
   - **This week's headline** — Single sentence capturing the most important signal.
   - **Key metrics** — 3-5 metrics with week-over-week change and trend direction.
   - **Experiment outcomes** — Ship/iterate/abandon decisions with rationale.
   - **Top opportunities** — Ranked by RICE score with evidence sources.
   - **Next week's priorities** — 3-5 concrete actions.

## Output Format

Target 700-1000 words. Structure for shareability — this should be ready to paste into Slack or a team doc. Use narrative paragraphs for findings, tables for metrics and experiments. End with recommended follow-on prompts.

## When to Use

- End-of-week review before planning next sprint
- Preparing for leadership syncs or product reviews
- Monthly planning input (run 4 consecutive weekly reviews)
