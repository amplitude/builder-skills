---
name: analyze-account-health
description: Summarizes B2B account health by analyzing usage patterns, engagement trends, risk signals, and expansion opportunities. Use for customer success reviews, renewal preparation, QBRs, or account prioritization.
---

# Analyze Account Health

Deep-dive into a B2B account's product usage to prepare for QBRs, assess renewal risk, identify expansion opportunities, or prioritize CS outreach.

## Instructions

### Step 0: Identify Account & Discover Context

**Get the account identifier:**
- Company name, org ID, account ID, or group property value
- Ask user if not provided

**Search for existing work:**
Use `Amplitude:search` to find existing dashboards, charts, or notebooks for this account. If found, ask user if they want fresh analysis or to review existing.

---

### Step 1: Quick Health Triage

Use `Amplitude:query_dataset` to run these queries in parallel:

**Usage Trend:**
- Event: `_active`, Metric: `uniques`, Group by: account property
- Time: Last 60 days, daily interval
- **Shows:** Activity increasing or decreasing?

**Engagement Quality:**
- Calculate DAU and MAU for account
- Get DAU/MAU ratio (stickiness)
- **Shows:** How engaged are active users?

**User Momentum:**
- Active user count week-over-week
- **Shows:** Team growing or shrinking?

**Classify Health:**
- **Healthy**: Growing MAU, DAU/MAU >40%, positive WoW
- **At-Risk**: Flat/declining MAU, DAU/MAU 20-40%, negative WoW
- **Critical**: Steep decline, DAU/MAU <20%, sustained negative WoW

---

### Step 2: User-Level Analysis

Use `Amplitude:query_dataset` with user-level groupBy:

**Power Users:**
- Top 3-5 users by event volume (champions to leverage)

**Churned Users:**
- Users active in previous period but not current (retention risks)

**License Utilization:**
- Active users in last 30 days vs total seats

---

### Step 3: Feature Usage Analysis

Use `Amplitude:query_dataset` grouped by events/features:

**Feature Breadth:**
- Which core features are being used (ask user for 5-10 key features)
- Adoption rate per feature

**Feature Trends:**
- Usage over last 90 days per feature
- Identify growing vs declining features

**Focus based on health:**
- **If At-Risk/Critical:** Find abandoned features (used 60-90 days ago, not in last 30)
- **If Healthy:** Find expansion opportunities (premium features not yet tried)

---

### Step 4: Account Feedback Analysis

**Get feedback sources:**
Use `Amplitude:get_feedback_sources` to see what's available.

**Get feedback insights:**
Use `Amplitude:get_feedback_insights` filtered by:
- ampId for each user in the account
- dateStart/dateEnd: Last 90 days
- types: `bug`, `painPoint`, `complaint`, `request`, `lovedFeature`

**Get specific mentions:**
For top 3-5 insights, use `Amplitude:get_feedback_mentions` to get quotes.

**Correlate with behavior:**
- Complaint about Feature X? Query their usage of Feature X
- Request for Feature Y? Check if they hit limits Y would solve
- Praise for Feature Z? Validate they're heavy users of Z

---

### Step 5: Present Account Health Report

Structure output as follows:

# Account Health Report: [Account Name]

## Executive Summary
[2-3 sentences: Health score, key trend, primary recommendation]

## Health Score: [🟢 Healthy | 🟡 At-Risk | 🔴 Critical]
[One sentence rationale with key metric]

---

## Key Metrics
| Metric | Current | Trend | Status |
|--------|---------|-------|--------|
| MAU | X | ↑↓→ Y% | 🟢🟡🔴 |
| DAU/MAU | X% | ↑↓→ Y% | 🟢🟡🔴 |
| License Utilization | X% | ↑↓→ | 🟢🟡🔴 |
| Features Adopted | X/Y | ↑↓→ | 🟢🟡🔴 |

---

## 🚨 Risk Factors (if any)
1. **[Issue]** - [Impact]
   - Usage data: [metric/trend]
   - Customer feedback: [theme with X mentions] - [representative quote]

## ✅ Positive Signals
1. **[What's working]** - [Evidence from usage + feedback]

---

## 👥 User Intelligence

### Champions (Leverage)
- **[User ID/Name]**: [Activity summary] - *Action: [Specific CS recommendation]*

### At Risk (Engage)
- **[User ID/Name]**: [Last active date / declining pattern] - *Action: [Check-in recommendation]*

### Inactive (>30 days)
- [Count] users ([X]% of licenses)

---

## 💡 Top Pain Points & Requests

### Pain Points
1. **[Theme]** (X mentions)
   - [Concise description]
   - Evidence: [Behavioral data] + "[Quote]" - [Source, Date]
   - *Action: [What to do]*

### Feature Requests
1. **[Theme]** (X mentions)
   - [What they want]
   - Evidence: "[Quote]" - [Source, Date]
   - *Roadmap status: [On roadmap/Not planned/Considering]*

### What They Love ❤️
1. **[Feature]**: "[Quote]"

---

## 📊 Feature Adoption

**High Usage:** [Feature] - [X users] (↑Y%)
**Declining:** [Feature] - [X users] (↓Y%) - *Investigate*
**Untapped (Upsell):** [Premium feature] - Could solve [pain point]

---

## 🎯 Recommendations

### 🔥 This Week
1. [Specific action with user/contact name]

### 📅 This Month
1. [Strategic action with context]

### 💰 Expansion Opportunities
1. [Upsell signal with evidence]

---

## 📎 Details
- **Analysis Date:** [Date]
- **Timeframe:** [Last X days]
- **Confidence:** [High/Medium/Low based on data volume]

---

## Best Practices

- **Always name users** - CS needs who to contact, not aggregates
- **Connect feedback to behavior** - Validate complaints with usage data
- **Be specific in recommendations** - "Call Sarah about Feature X" not "improve engagement"
- **Show trends, not snapshots** - Direction matters more than point-in-time
- **Flag data gaps** - Note low volume, missing properties, or incomplete data
- **Prioritize by impact** - Focus on issues affecting multiple users or champions

## Common Patterns

**Churn Risks:**
- Champion churned + declining overall usage
- Multiple complaints about same issue + behavioral evidence of friction
- License utilization declining + negative feedback

**Expansion Signals:**
- Hitting plan limits (users, API, storage)
- Requests for premium features + high engagement
- New users being added + positive feedback
