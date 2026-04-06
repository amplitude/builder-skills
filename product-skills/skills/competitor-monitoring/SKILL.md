---
name: competitor-monitoring
description: Visit each competitor's homepage, features page, pricing page, and blog using Chrome MCP, then write a structured competitive intelligence report saved to Google Drive. Use for a standing weekly competitive pulse or an on-demand deep-dive.
suggest_when: User says "competitor monitoring", "competitive intelligence", "what are competitors shipping", "competitive report", "track competitors", or wants to stay on top of competitor moves without doing manual research.
---
**User context:** $ARGUMENTS

> If the above is blank, ask the user to share the relevant context before proceeding.


# Competitor Monitoring

**A weekly competitive intelligence analyst — reads your competitor list, visits their sites, and writes you a report.**

Staying on top of competitors manually means visiting dozens of pages, taking notes, and writing a summary — every week. This skill does all of it: pulls your competitor list from Drive, browses each competitor's key pages, and produces a structured Markdown report with a per-competitor snapshot and a recommended actions section.

---

## Prompt Template

```
/schedule Act as a competitive intelligence analyst for {{COMPANY_NAME}}, {{COMPANY_DESCRIPTION}}.

### Step 1 — Load the competitor list
Pull the competitor list from Google Drive. Check {{COMPETITORS_FOLDER}} and any file with
"competitor" or "landscape" in the name. If no list is found, note it and stop.

### Step 2 — Research each competitor
Use the Chrome MCP to visit each competitor's:
- Homepage — messaging, positioning, headline value prop
- Product / features page — new or changed capabilities
- Pricing page — tier names, price points, packaging changes
- Blog or changelog — recent posts, announcements, release notes

For each competitor, capture:
- Any messaging changes since the prior report (if available)
- New features or capabilities announced or shipped
- Pricing changes or new tiers
- Recent blog posts or announcements worth noting
- One "watch-out" — the single most important signal for us

### Step 3 — Write the report

## Executive Summary
2–3 sentences on the most important competitive development this week and what it means for us.

## Competitor Snapshots
One section per competitor:
**[Competitor Name]**
- Headline: One sentence on their current positioning
- New features: What they shipped or announced
- Pricing: Any changes, or "no change"
- Recent content: Blog posts or announcements worth reading
- Watch-out: The single thing we should pay attention to

## At-a-Glance Table
| Competitor | Biggest move this week | Pricing change | Watch-out |
|---|---|---|---|

## Recommended Actions
3–5 concrete things our team should do in response to this week's findings. Start each with a verb.

### Rules
- Save the report as Competitor-Report-YYYY-MM-DD.md to Google Drive at {{OUTPUT_FOLDER}}
- Return the Drive link when done
- If a competitor's site is unavailable, note it and skip — do not fabricate
- Keep the executive summary to 3 sentences maximum
```

---

## Setup

| Field | Value |
|-------|-------|
| **MCPs required** | Google Drive, Chrome / Browser |
| **Input** | Competitor list in `/Product/Competitors/` or any Drive file named with "competitor" |
| **Output** | `Competitor-Report-YYYY-MM-DD.md` → `/Product/Competitors` |
| **Scheduler** | Weekly, Monday 8am |

## Placeholders to fill in

- `{{COMPANY_NAME}}` — Your company name
- `{{COMPANY_DESCRIPTION}}` — One sentence on what you do and who you serve
- `{{COMPETITORS_FOLDER}}` — Drive path to your competitors folder, e.g. `/Product/Competitors/`
- `{{OUTPUT_FOLDER}}` — Where to save reports, e.g. `/Product/Competitors/`

## Tips

- Keep a `competitors.md` in your Competitors folder listing URLs for each competitor's key pages — the skill uses it as a checklist.
- The "Watch-out" column in the at-a-glance table is the fastest way to scan for urgency in a busy week.
- Pair with `market-research-digest` to weave competitor signals into broader market context.
- If competitors have public changelogs (e.g. Linear, Notion), add the changelog URL to your competitor list for the most reliable feature tracking.
