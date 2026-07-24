---
name: customer-issue-analyzer
description: >
  Aggregates support signals and cross-references against product tracking to show whether each issue
  is known, tracked, or untracked. Produces an HTML report with issue themes, cross-customer patterns,
  status badges, and a Product Tracking table per issue.

  ALWAYS use when anyone asks: "what issues does [customer] have?", "are other customers seeing this?",
  "is this on the roadmap?", "what pain points does [customer] have?", "is this a known issue?",
  or any variation on understanding a customer's friction and whether Amplitude is addressing it.
  Also trigger when an issue surfaces on a call, email, or Slack message about a customer problem.
  Use for QBR prep, renewals, escalations, cadence calls, or any customer-facing conversation.
---

# Customer Issue Analyzer

## Step 0: Mode selection

Before doing anything else, use the `AskUserQuestion` tool to present the two modes as buttons. Use this exact question:

```
Question: "Which mode would you like to run?"
Header: "Mode"
Options:
  - Label: "Mode A — Full Account Retrospective"
    Description: "Pull all support signals for an account and cross-reference against product tracking. Best for QBR prep, renewal risk, or general account health."
  - Label: "Mode B — Live Issue Lookup"
    Description: "A customer just raised a specific issue on a call, email, or Slack. Quickly check if it's known, widespread, and whether a fix is coming."
```

If the user's original message already makes the mode obvious (e.g. they named a specific issue for Mode B, or asked for QBR prep for Mode A), skip this step and proceed directly.

After the user selects a mode, also ask for the customer name if not already provided.

---

## Critical guidance: managing data volume

Each data source you query can return a large amount of text. If you pull everything from every source without limits, you'll run out of context before you can synthesize anything useful. **Be selective and disciplined at every step:**

- Apply strict result limits to every query (see caps below)
- After querying each source, immediately extract the 2–5 most relevant findings and discard the rest — don't carry raw API responses forward
- Stop querying a source once you have enough signal; don't fetch more pages
- For Mode B, skip low-value sources (Gmail, Granola) unless the issue is very account-specific

---

## Mode A: Account Retrospective

### Step 1: Identify the account (1 query)

Look up the customer in Salesforce. Keep the result to 5 matches max.

```sql
SELECT Id, Name, Type, Owner.Name, Org_ID__c
FROM Account WHERE Name LIKE '%[account_name]%' LIMIT 5
```

Confirm with the user if multiple matches. Capture: Account ID, owner name, renewal date, and **Org ID** (`Org_ID__c`). The Org ID is the customer's Amplitude project/org ID — use it in all subsequent Amplitude Feedback calls. If the field is blank, ask the user to provide it before proceeding to the feedback steps.

### Step 2: Gather support signals — work through sources sequentially

Query each source below in order. After each one, extract your key findings in 3–5 bullet points and move on. Don't accumulate raw responses.

**Source 1: Salesforce Cases** (highest signal, always start here)
```sql
SELECT CaseNumber, Subject, Status, Priority, CreatedDate
FROM Case
WHERE AccountId = '[account_id]'
AND CreatedDate = LAST_N_DAYS:365
ORDER BY Priority ASC, CreatedDate DESC
LIMIT 15
```
Extract: case subjects grouped by theme, open vs. closed count, any high-priority cases.

**Source 2: Zendesk** (direct support tickets — check before Glean)
Use the Zendesk External Support connector: `zendesk_search_tickets(query="[account name]")`. Extract: ticket subjects, statuses, and any recurring themes.

**Source 3: Glean** (broad internal sweep — covers Zendesk, Slack, docs)
Search: `"[account name]" issue OR bug OR problem OR workaround`
Limit yourself to the first 8–10 results. Extract: any complaints or friction not already in Salesforce cases or Zendesk.

**Source 4: Amplitude Feedback**
First find the customer's Amplitude `projectId` — check the Salesforce account record for a custom field, or ask the user. Then call `get_feedback_insights(projectId=<id>, types=["request","bug","complaint"], pageSize=10)`. Also run a keyword search without a projectId to catch cross-customer signal across all accounts. Extract: specific feature requests, bug reports, and how many accounts share them. Important: `projectId` is the customer's Amplitude project ID, not your own — using the wrong one will return empty results silently.

**Source 5: Outreach / Kaia** (qualitative signal — use only if you need richer context)
Search for calls involving this account. Limit to the 3 most recent. Extract: any moments where the customer described bugs, limitations, or workarounds.

**Source 6: Granola** (use only if Kaia/Salesforce left gaps)
Search for recent meetings. Limit to 3. Extract: any product feedback or friction moments.

**Source 7: Gmail** (lowest priority — skip unless the above sources are thin)
Search by customer domain for support-related threads. Limit to 5. Extract: any escalation threads or feature requests not captured elsewhere.

### Step 3: Synthesize into 3–8 issue themes

Group your findings into distinct themes — the underlying problems, not a list of every ticket. For each theme:
- **Name**: Specific and descriptive (e.g., "Cohort export timeouts on large datasets")
- **Evidence**: Source name + specific reference (case #, call date) — 1–3 references max per theme
- **Severity**: Blocking? Escalated? Recent?
- **Customer impact**: What's the business consequence?

### Step 4: Cross-reference product tracking — work through sources sequentially

For each theme, check these systems in order. Stop when you have a clear status.

**Linear** — keyword search on the theme. Note: status, priority, milestone. Limit: 5 results per theme.

**Amplitude Feedback** — Call `get_feedback_insights(projectId=<customer_project_id>, search=[theme keywords], types=["request","bug","complaint"], pageSize=5)`. If no projectId is available, omit it to search across all accounts for cross-customer signal.

**Jira** — `searchJiraIssuesUsingJql` with text search. Limit: 5 results per theme.

**Amplitude Product Roadmap** — Fetch `https://script.google.com/a/macros/amplitude.com/s/AKfycbyTqkhhp7pggIDotB59vM9OpOTGNxjyhzTYNa5STbgs_Ig-bm75lY6sqkC4IYotcCZF9g/exec` and search the response for theme keywords. This is Amplitude's internal roadmap feed — check it for planned or upcoming work that may address the issue even if it isn't in Jira or Linear yet.

**Glean** — Search for ProductBoard items or roadmap docs. Limit: 3 results per theme. Only needed if Linear/Jira/Roadmap found nothing.

### Step 5: Assign roadmap status

- 🟢 **Addressed / Shipped** — Linear Done, or recent release covers it
- 🟡 **In Progress** — Linear In Progress or active Jira sprint
- 🔵 **Planned** — Linear Todo with milestone, ProductBoard planned
- 🟠 **Acknowledged** — Ticket/request exists, no active commitment
- 🔴 **Not Tracked** — No evidence in any product system

---

## Mode B: Live Issue Lookup

This mode is designed to be fast. The person asking might be on a call right now.

### Step 1: Clarify if needed

If the issue description is vague, ask one question to sharpen it before searching.

### Step 2: Three targeted lookups (run in parallel — these are small queries)

**Amplitude Feedback** — Call `get_feedback_insights(projectId=<customer_project_id>, search=[issue keywords], types=["request","bug","complaint"], pageSize=10)`. If you don't have the customer's projectId, run without it to search across all accounts — this still tells you cross-customer prevalence. This tells you: is this widespread?

**Linear** — keyword search on the issue. Limit: 5 results. This tells you: is it tracked?

**Amplitude Product Roadmap** — Fetch `https://script.google.com/a/macros/amplitude.com/s/AKfycbyTqkhhp7pggIDotB59vM9OpOTGNxjyhzTYNa5STbgs_Ig-bm75lY6sqkC4IYotcCZF9g/exec` and scan for the issue keywords. This tells you: is a fix or feature planned?

**Glean** — Search `[issue keywords] site OR internal`. Limit: 8 results. This tells you: is it known internally?

### Step 3: Optional account history check (only if customer was named)

Quick Salesforce lookup for prior cases from this account on the same issue. If you haven't already looked up the account, also fetch `Org_ID__c` here so Amplitude Feedback calls use the correct org:
```sql
SELECT CaseNumber, Subject, Status, CreatedDate
FROM Case WHERE AccountId = '[account_id]'
AND Subject LIKE '%[keyword]%'
LIMIT 5
```

If the account hasn't been looked up yet, run this first to get the Org ID:
```sql
SELECT Id, Name, Org_ID__c
FROM Account WHERE Name LIKE '%[account_name]%' LIMIT 3
```

### Step 4: Assign roadmap status (same labels as Mode A)

---

## Output: HTML Report

Save a self-contained HTML file to the outputs folder.
- Mode A: `[account-name]-issue-intelligence.html`
- Mode B: `[account-name]-issue-lookup-[short-topic].html`

### Report structure

**Header**: Account name, renewal date, owner, report date, mode used, data sources checked (✓/✗)

**Executive Summary**: 2–4 sentences. What are the top issues? What's the overall product response posture?

**Issue Themes / Issue Detail** (Mode A: most severe first; Mode B: focused on the one issue)

For each issue:
- Status badge (colored chip)
- Theme name and brief description
- Evidence (source + specific reference, max 3 per theme)
- Cross-customer signal: "X other accounts have requested this in Amplitude Feedback"
- **Product Tracking table** — two rows, always present:
  - *Feature Requests*: Matching requests in Amplitude Feedback or ProductBoard with vote/account counts. If none found, say so explicitly — "No feature request found" is still useful.
  - *Engineering Commitment*: Matching Linear issues, Jira bugs/tasks, or roadmap items with ticket ID, status, and a direct link. If nothing found, mark "Not tracked" — that's a call to action.
  - If both are empty, the status badge must be 🔴 Not Tracked, and the recommended action is to file a request.

**Cross-Customer Patterns** *(Mode A only)*: Which issues are shared pain, vs. isolated to this account.

**Recommended Actions**:
- Not Tracked → Submit feature request / escalate to PM with customer evidence
- Acknowledged → Get a commitment or timeline; communicate to customer
- Planned / In Progress → Get ETA and proactively update the customer
- Shipped → Schedule a walkthrough — customer may not know it's resolved

### Style guidelines
- White background, light gray cards
- Amplitude colors: `#1A1464` (dark navy) headers, `#E45C2B` (orange) accents
- Colored badge chips for status
- `<details>` elements for collapsible evidence sections
- Sections should stand alone — someone might jump straight to Actions

---

## Quality notes

**Cite specifically.** Every claim needs a source: case number, call date, Linear URL. Vague claims erode trust.

**Flag gaps.** If a source returned nothing or wasn't accessible, say so in the report. Don't imply completeness you don't have.

**Recency matters.** Issues from the last 90 days are far more actionable. Surface those first.

**Mode B: lead with the answer.** State known/unknown and widespread/isolated upfront, then support it. Don't bury the lede.

**Synthesize, don't dump.** A tight report on 3 real issues is more useful than 15 loosely grouped data points.
