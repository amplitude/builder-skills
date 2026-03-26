---
name: interview-scheduling
description: Find the most active users in Amplitude, check your Google Calendar for open slots, and create personalised Gmail drafts inviting them to a research interview. Never sends — always saves as drafts for your review. Use when planning a user research sprint.
suggest_when: User says "schedule interviews", "reach out to users", "user research outreach", "find users to talk to", "draft interview invites", or wants to recruit participants for user research.
---

# Interview Scheduling

**Find the right users, check your calendar, draft personalised outreach — without lifting a finger.**

You want to talk to real users, but finding them, cross-referencing your calendar, and writing individual emails takes hours. This skill pulls the most active users from Amplitude, finds your open slots, and drafts a personalised email for each one — ready for your review before anything goes out.

---

## Prompt Template

```
/schedule You are helping me schedule user research interviews. Work through these steps:

### Step 1 — Find top users in Amplitude
Go to Amplitude and identify the top {{N}} most active users from the past {{TIME_PERIOD}}.
For each user, note:
- Number of sessions
- Most-used features
- Any recent spikes or drop-offs in activity
- How long they've been a customer

### Step 2 — Check my Google Calendar availability
Look at my Google Calendar for the next {{CALENDAR_WINDOW}}. Find open 45-minute slots during
{{PREFERRED_HOURS}}, avoiding existing events and leaving at least 15 minutes of buffer between
meetings. Identify {{SLOT_COUNT}} good candidate slots.

### Step 3 — Draft individual emails in Gmail — do not send
For each user, create a personalised Gmail draft. Each draft should:

Subject: "Quick chat? We'd love your feedback on {{PRODUCT_NAME}}"

Opening: A personalised 1–2 sentence observation based on their Amplitude data — e.g. "We noticed
you've been using {{FEATURE_NAME}} heavily over the past few weeks." Keep it genuine and specific,
not flattering.

Body: Briefly explain the purpose — a short research interview to understand what's working and
where {{PRODUCT_NAME}} can improve for users like them.

Scheduling:
- If Calendly is available: lead with it — "Feel free to grab a time: {{CALENDLY_LINK}}"
- If no Calendly: offer the {{SLOT_COUNT}} available time slots (day, date, time + timezone) and
  include a meeting link: {{MEETING_LINK}}

Sign off as: {{SENDER_NAME}}

### Rules
- Do NOT send any email. Save everything as drafts.
- Do not fabricate user data — only use what Amplitude returns.
- If a user has no email in Amplitude, note them separately and skip the draft.
```

---

## Setup

| Field | Value |
|-------|-------|
| **MCPs required** | Amplitude, Google Calendar, Gmail |
| **Output** | Gmail drafts (never auto-sent) |
| **Scheduler** | Run on-demand before each research sprint, or daily if recruiting continuously |

## Placeholders to fill in

- `{{N}}` — Number of users to target, e.g. `10`
- `{{TIME_PERIOD}}` — Lookback window, e.g. `the past 30 days` or `last quarter`
- `{{CALENDAR_WINDOW}}` — How far ahead to check, e.g. `the next 2 weeks`
- `{{PREFERRED_HOURS}}` — Your available hours, e.g. `10am–4pm Mon–Fri`
- `{{SLOT_COUNT}}` — Slots to offer, e.g. `3`
- `{{PRODUCT_NAME}}` — Your product name
- `{{FEATURE_NAME}}` — A feature to personalise with (optional; remove if not needed)
- `{{CALENDLY_LINK}}` — Your scheduling link, or remove this line if not using Calendly
- `{{MEETING_LINK}}` — Google Meet or Zoom link
- `{{SENDER_NAME}}` — Your name or team name

## Tips

- Always review drafts before sending — personalisation is only as good as Amplitude's data.
- If recruiting for a specific feature, filter Amplitude by that feature's event to find power users.
- Pair with `craft-discovery-synthesis` to process the resulting interviews.
- For B2B products, consider filtering by company ARR or plan tier using Amplitude cohorts before running the skill.
