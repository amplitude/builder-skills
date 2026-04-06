---
name: pm-weekly-brief
description: Read your Slack mentions, calendar events, and recently modified Drive documents from the last 7 days and synthesize them into a short personal PM summary. Use at the end of each week to capture what happened before it fades.
suggest_when: User says "weekly brief", "week in review", "summarize my week", "what happened this week", "PM summary", or wants a personal recap of decisions, blockers, shipped features, and upcoming deadlines.
---
**User context:** $ARGUMENTS

> If the above is blank, ask the user to share the relevant context before proceeding.


# PM Weekly Brief

**A personal week-in-review written for you — decisions, risks, wins, and what's coming next.**

By Friday you've had 30 meetings, 200 Slack messages, and a handful of docs updated. This skill reads your Slack mentions, calendar, and Drive activity to produce a clean weekly brief.

---

## Prompt Template

```
/schedule

Read for activity from the last 7 days:
- My Slack mentions and DMs
- My Google Calendar events (attended and upcoming)
- Google Drive documents modified in the last 7 days

## Week of {{WEEK_DATE_RANGE}}

### Key Decisions
Decisions made this week from meetings, Slack, or docs. One sentence each.
If discussed but not decided, put in Open Questions.

### Risks & Blockers
Anything that slowed progress or is unresolved. Include owner and what's needed to unblock.

### Important Conversations
2–4 bullets of recurring themes or significant exchanges — signal only.

### Shipped
Features, experiments, or changes that went live. Link to ticket or doc if available.

### Upcoming Deadlines
Meetings, launches, or deliverables in the next 7–14 days.

Rules:
- Keep the whole brief under 400 words
- Lead each section with the most important item
- If a section has nothing to report, write "Nothing notable this week"
- Save to {{OUTPUT_FOLDER}} as PM-Brief-YYYY-MM-DD.md
- Return the Drive link when done
```

---

## Setup

| Field | Value |
|-------|-------|
| **MCPs required** | Slack, Google Calendar, Google Drive |
| **Output** | `PM-Brief-YYYY-MM-DD.md` → `/Product/Weekly briefs` |
| **Scheduler** | Weekly, Friday afternoon |

## Placeholders to fill in

- `{{WEEK_DATE_RANGE}}` — Auto-populated by the scheduler
- `{{OUTPUT_FOLDER}}` — e.g. `/Product/Weekly briefs`

## Tips

- Run on Friday — you'll start Monday knowing exactly where things stand.
- Share Risks & Blockers with your manager directly if anything needs escalating.
- Pair with `stakeholder-update` to turn this into a polished leadership update.
