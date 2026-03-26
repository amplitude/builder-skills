---
name: churn-lost-deal-analysis
description: Read lost deals and churned accounts from your CRM, extract reasons clustered by theme (missing features, pricing, competitors, UX), and write a prioritized weekly analysis with product improvement recommendations. Use before roadmap planning or to build the case for prioritizing retention work.
suggest_when: User says "churn analysis", "why are we losing deals", "lost deal report", "analyze churn", "why do customers leave", or wants to turn CRM loss reasons into concrete product insights.
---

# Churn / Lost Deal Analysis

**Turn CRM loss data into a product roadmap signal — themes, patterns, and concrete recommendations.**

Lost deal notes and churn reasons are scattered across CRM fields, call notes, and tags. This skill reads all of it, clusters the feedback by theme, ranks the most frequent patterns, and translates them into specific product improvement suggestions — giving you evidence-backed input for your next planning cycle.

---

## Prompt Template

```
/schedule Act as a product analyst investigating why {{COMPANY_NAME}} loses deals and customers.

### Step 1 — Pull lost deals and churned accounts
Read from {{CRM_NAME}} all deals marked as lost and accounts that churned in the past {{TIME_WINDOW}}.
For each record, collect:
- Deal or account name, ARR, loss/churn date
- Loss reason (from the CRM field, if populated)
- Deal notes, call notes, and comments
- Tags or labels applied to the record
- Competitor mentioned, if any

### Step 2 — Extract reasons
- Missing features — "we need X", "your product doesn't do Y"
- Pricing issues — "too expensive", "competitor is cheaper"
- Competitor wins — which competitor and what advantage they cited
- UX or product quality — "hard to use", "too many bugs", "slow"
- Fit issues — use case mismatch, wrong ICP
- Process or sales issues — note separately

### Step 3 — Cluster by theme
A theme needs at least 2 occurrences. For each theme:
- Theme name, number of occurrences, total ARR affected
- 2–3 representative direct quotes
- The specific product gap this points to

### Step 4 — Rank and recommend
Rank by: (occurrences × average ARR affected). For each top theme (up to 5):
**Theme**: [name]
**Frequency**: [N], **ARR at risk**: [total]
**Root cause**: [what the product is missing or doing wrong]
**Recommendation**: [specific, actionable product change]
**Evidence**: [1–2 direct quotes]

### Step 5 — Save the report as ChurnAnalysis_YYYY-MM-DD.md to {{OUTPUT_FOLDER}}

## Summary / ## Top Themes / ## Competitor Intelligence / ## Watch List

Return the Drive link when done.
```

---

## Setup

| Field | Value |
|-------|-------|
| **MCPs required** | CRM (HubSpot / Attio / Intercom), Google Drive |
| **Output** | `ChurnAnalysis_YYYY-MM-DD.md` → `/Product/Churn analysis` |
| **Scheduler** | Weekly, or manually before planning sessions |

## Placeholders to fill in

- `{{COMPANY_NAME}}` — Your company name
- `{{CRM_NAME}}` — e.g. `HubSpot`, `Attio`, or `Salesforce`
- `{{TIME_WINDOW}}` — e.g. `the past 30 days` or `this quarter`
- `{{OUTPUT_FOLDER}}` — e.g. `/Product/Churn analysis`

## Tips

- The ARR-weighted ranking is the key lever — one $100K deal outweighs five free-tier requests.
- The Competitor Intelligence section feeds directly into `competitor-monitoring`.
- Run quarterly as well as weekly — slow-moving trends hide in weekly noise.
- Share Top Themes with your head of product and sales lead before each planning cycle.
