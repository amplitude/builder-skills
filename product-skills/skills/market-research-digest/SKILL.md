---
name: market-research-digest
description: Synthesize Drive files, Granola meeting notes, and web signals into a weekly Markdown research summary with Trends, Competitors, Ideas, and Risks sections. Use when a PM wants to consolidate scattered research into a single weekly digest.
suggest_when: User says "research digest", "weekly research summary", "summarize my research", "what are the trends this week", or wants to pull together market signals from Drive, meetings, and the web.
---
**User context:** $ARGUMENTS

> If the above is blank, ask the user to share the relevant context before proceeding.


# Market Research Digest

**Turn scattered research into a structured weekly summary — trends, competitor signals, ideas, and risks in one place.**

You have files in Google Drive, meeting notes in Granola, and signals scattered across the web. This skill reads everything from the past week, synthesizes it into four clean sections, and saves a dated Markdown file back to Drive — so nothing gets lost and every stakeholder stays informed.

---

## Prompt Template

```
/schedule Every week, read everything in my Google Drive {{INPUT_FOLDER}} folder (all files and
any links inside them), query my Granola meeting notes from the last 30 days, and search the web
for competitor signals, product trends, feature requests, and risks relevant to {{PRODUCT_DESCRIPTION}}.

Synthesize all of it into a Markdown summary with four sections:

## Trends
What is shifting in the market, user behavior, or the competitive landscape? Lead with the most
significant movement. Each item should be a 2–3 sentence observation with a source citation.

## Competitors
What are competitors shipping, changing, or saying? One entry per competitor. Include: what
changed, why it matters, and what (if anything) to do about it.

## Ideas
Product opportunities, feature ideas, or strategic moves surfaced by the research. Be specific —
"add X to solve Y for Z users" is better than "improve onboarding."

## Risks
Market risks, competitive threats, or internal signals that could hurt the product. Rank by
severity. Include a suggested mitigation for each.

## Sources
Cite every file, meeting, and document used. Format: [Title] — [source type] — [date if known]

Rules:
- If any source is unavailable, skip it and note it at the top of the file
- Do not overwrite existing summaries — always create a new file named research-summary-YYYY-MM-DD.md
- Save to Google Drive at {{OUTPUT_FOLDER}}
- Return the Drive link when done
```

---

## Setup

| Field | Value |
|-------|-------|
| **MCPs required** | Google Drive, Granola, Browser (for web signals) |
| **Input folder** | `/Product/Research` (or your folder) |
| **Output** | `research-summary-YYYY-MM-DD.md` → `/Product/Research` |
| **Scheduler** | Weekly |

## Placeholders to fill in

- `{{INPUT_FOLDER}}` — Google Drive path to your research folder, e.g. `/Product/Research`
- `{{PRODUCT_DESCRIPTION}}` — One sentence on what your product does and who it serves
- `{{OUTPUT_FOLDER}}` — Where to save the digest, e.g. `/Product/Research`

## Tips

- Keep a `competitors.md` in your Research folder listing the competitors to monitor — the skill will find it automatically.
- Add links to newsletters, blogs, or analyst reports to your Research folder and the skill will pull them in.
- Pair with the `competitor-monitoring` skill for deeper per-competitor analysis on the same schedule.
- The Sources section makes this easy to share with leadership — every claim is traceable.
