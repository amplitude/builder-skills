---
name: update-knowledge-base
description: Cross-reference recently shipped tickets against your help center and changelog to detect outdated articles, missing documentation, and undocumented features. Suggests updates and writes draft copy where possible. Use after each release or on a weekly cadence.
suggest_when: User says "update docs", "documentation is out of date", "update knowledge base", "what docs need updating", "keep help center in sync", or wants to ensure documentation stays current with what shipped.
---
**User context:** $ARGUMENTS

> If the above is blank, ask the user to share the relevant context before proceeding.


# Update Knowledge Base

**Automatically detect what your docs are missing — and draft the updates.**

Every release creates documentation debt. This skill reads your latest shipped tickets, compares them against your help center and changelog, and tells you exactly which articles are stale, which features are undocumented, and what to write.

---

## Prompt Template

```
/schedule

### Step 1 — Read recent shipped work
Check {{TICKET_SOURCES}} for items shipped, done, or merged in the past {{TIME_WINDOW}}.
For each: feature name, 1-sentence description of what changed for users, affected product area.

### Step 2 — Read current documentation
- Help center: {{HELP_CENTER_URL}}
- Changelog: {{CHANGELOG_URL}}
- Drive docs at {{DOCS_FOLDER}} modified in the last 90 days

### Step 3 — Detect gaps
**Outdated articles** — docs describing a flow that has since changed
**Missing articles** — features shipped with no documentation
**Stale UI references** — articles mentioning UI elements that no longer exist

### Step 4 — Write update suggestions
For each gap:
**[Article title or "New article needed"]**
Status: Outdated / Missing / Stale UI reference
Affected feature: [from ticket]
What changed: [1 sentence — now vs. what docs say]
Suggested update: [draft the updated paragraph if possible]

### Step 5 — Save
DocUpdates_YYYY-MM-DD.md to {{OUTPUT_FOLDER}} with summary table at top:
| Article | Status | Priority | Suggested action |

Priority: Missing docs for major features = High. Outdated steps = High. Minor wording = Low.
Return the Drive link when done.
```

---

## Setup

| Field | Value |
|-------|-------|
| **MCPs required** | Linear / Jira / GitHub Issues, Google Drive, Browser |
| **Output** | `DocUpdates_YYYY-MM-DD.md` → `/Product/Docs/Updates` |
| **Scheduler** | Weekly, or after each release |

## Placeholders to fill in

- `{{TIME_WINDOW}}` — e.g. `the past 7 days`
- `{{TICKET_SOURCES}}` — e.g. `Linear`, `Jira`, `GitHub Issues`
- `{{HELP_CENTER_URL}}` — e.g. `https://help.yourproduct.com`
- `{{CHANGELOG_URL}}` — e.g. `https://yourproduct.com/changelog`
- `{{DOCS_FOLDER}}` — e.g. `/Product/Docs`
- `{{OUTPUT_FOLDER}}` — e.g. `/Product/Docs/Updates`

## Tips

- Pair with `release-notes-generator` — run both after every release.
- The priority column helps your technical writer triage without reading every suggestion.
- If your help center is on Notion or Confluence, connect it as an MCP for richer read access.
