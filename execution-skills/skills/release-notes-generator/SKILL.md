---
name: release-notes-generator
description: Read completed tickets from Linear, Jira, or GitHub Issues, filter to user-visible changes, group by product area, and write polished user-facing release notes saved as a .docx to Google Drive. Use before each release or on a weekly cadence.
suggest_when: User says "release notes", "write changelog", "what shipped this sprint", "draft release notes", "summarize what we shipped", or needs to communicate recent product changes to customers or stakeholders.
---
**User context:** $ARGUMENTS

> If the above is blank, ask the user to share the relevant context before proceeding.


# Release Notes Generator

**Turn a sprint's worth of closed tickets into polished, user-facing release notes — automatically.**

Writing release notes from raw tickets is tedious: filter out internal work, translate engineer-speak into user language, format consistently. This skill does all of it.

---

## Prompt Template

```
/schedule

### Step 1 — Gather completed tickets
Check {{TICKET_SOURCES}} for items marked done, shipped, merged, or closed in the past {{TIME_WINDOW}}.

Skip: in-progress, internal-only, pure bug fixes with no visible UX change, chores, refactors,
anything tagged "internal", "infra", or "ops".

### Step 2 — Group by product area
Use ticket labels or project names. Merge areas with fewer than 2 items into the closest group.

### Step 3 — Write the release notes
For each area:

**[Area Tag]**
**[Title]** — 2–5 words, present tense, feature name not a commit message.
Good: "Faster search results", "New billing dashboard". Never: "added", "fixed", "shipped".

[Description] — 1–3 sentences to the user. Lead with what changed and why it matters.
Use "you can now…" framing. No bullet points. No ticket IDs, sprint names, or engineer names.

### Step 4 — Save
Date at top: Month DD, YYYY. Entries grouped by area.
Save as ReleaseNotes_YYYY-MM-DD.docx to {{OUTPUT_FOLDER}}.
Do not publish — save for review only. If no tickets found, say which sources you checked.
```

---

## Setup

| Field | Value |
|-------|-------|
| **MCPs required** | Linear / Jira / GitHub Issues, Google Drive |
| **Output** | `ReleaseNotes_YYYY-MM-DD.docx` → `/Product/ReleaseNotes` |
| **Scheduler** | Manual before each release, or weekly |

## Placeholders to fill in

- `{{TICKET_SOURCES}}` — e.g. `Linear`, `Jira`, or `GitHub Issues`
- `{{TIME_WINDOW}}` — e.g. `the past 7 days`, `the past 2 weeks`, or `this sprint`
- `{{OUTPUT_FOLDER}}` — e.g. `/Product/ReleaseNotes`

## Tips

- Good ticket hygiene = better release notes. Descriptions that say "users can now..." produce the best output.
- Pair with `update-knowledge-base` to flag which help articles need updating after each release.
- For API/webhook changes, keep those tickets in a separate label — the skill gives them a distinct technical voice.
