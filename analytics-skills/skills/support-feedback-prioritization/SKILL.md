---
name: support-feedback-prioritization
description: Pull Intercom tickets and Slack support messages from the past 7 days, classify each signal, enrich with CRM data (ARR, plan, renewal), score by customer value and churn risk, and output a tiered priority report saved to Drive. Use when you need a fast, data-driven view of what support signals matter most.
suggest_when: User says "support triage", "prioritize feedback", "what are customers complaining about", "support digest", "what should I act on from support this week", or wants to turn raw support volume into a ranked action list.
---
**User context:** $ARGUMENTS

> If the above is blank, ask the user to share the relevant context before proceeding.


# Support Feedback Prioritization

**Turn a week of support noise into a ranked, enriched action list — in minutes.**

You have Intercom tickets, Slack threads, and a CRM full of customer data. This skill reads all of it, classifies every signal, enriches each item with ARR and plan data, and scores the stack using a weighted priority model. The output is a four-tier report — Critical, High, Medium, FYI — so you know exactly where to spend Monday morning.

---

## Prompt Template

```
/schedule Act as a customer feedback analyst for {{COMPANY_NAME}}.

### Step 1 — Collect signals
Gather all feedback from the past 7 days from:
- Intercom: all tickets and conversations
- Slack: {{SLACK_CHANNELS}}

For each signal, note: source, customer name or ID, date, a 1-sentence summary, and the raw text.

### Step 2 — Classify
Assign each signal one category:
- Bug — something broken
- UX confusion — user can't find or understand a feature
- Feature request — explicit ask for new functionality
- Billing issue — pricing, invoicing, or plan confusion
- Churn risk — contains keywords like "cancel", "leaving", "switching", "disappointed", "frustrated"

### Step 3 — Enrich with CRM data
For each signal, query {{CRM_NAME}} for:
- ARR or deal value
- Plan type (free / starter / pro / enterprise)
- Company size
- Renewal date
- CSM or account owner name

If a customer can't be found in the CRM, note "CRM: not found" and continue.

### Step 4 — Score and rank
- Churn risk signals: multiply score by ×3
- Enterprise or high-ARR customers (top 20% by ARR): multiply score by ×2
- Same issue appearing 3+ times from different customers: escalate one tier automatically
- Bugs outrank feature requests when all other factors are equal

### Step 5 — Write the report
Save a Markdown file named SupportDigest_{{DATE}}.md to Google Drive at {{OUTPUT_FOLDER}}.

## 🔴 Critical — Act today
## 🟠 High — Act this week
## 🟡 Medium — Monitor
## ℹ️ FYI

For each item: | Company | ARR | Plan | Category | Source | CSM | Recommended action |

## Trends
3–5 sentences on recurring themes and patterns suggesting systemic problems.

Rules:
- Read only — do not send messages or reply to tickets
- Return the Drive link when done
```

---

## Setup

| Field | Value |
|-------|-------|
| **MCPs required** | Intercom, Slack, CRM (HubSpot / Attio), Google Drive |
| **Output** | `SupportDigest_YYYY-MM-DD.md` → `/Product/SupportDigest` |
| **Scheduler** | Weekly, Monday 8am |

## Placeholders to fill in

- `{{COMPANY_NAME}}` — Your company name
- `{{SLACK_CHANNELS}}` — e.g. `#support, #customer-feedback, #bugs`
- `{{CRM_NAME}}` — e.g. `HubSpot`, `Attio`, or `Intercom`
- `{{DATE}}` — Auto-filled to today's date when the scheduler runs
- `{{OUTPUT_FOLDER}}` — Drive path, e.g. `/Product/SupportDigest`

## Tips

- The Trends section is often the most valuable part — a systemic issue is worth more than five one-off tickets.
- Share the 🔴 Critical tier directly in your #product Slack channel each Monday.
- If you don't have a CRM connected, remove Step 3 — the skill still works without ARR weighting.
- Pair with `analyze-feedback` to cross-reference support themes against Amplitude behavioral data.
