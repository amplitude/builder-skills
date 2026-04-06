---
name: diagnose-monetization
description: Diagnose revenue leaks, analyze willingness-to-pay, evaluate packaging and pricing, and identify expansion revenue opportunities. Use when a PM needs to improve conversion to paid, optimize pricing, reduce revenue churn, or find upsell and expansion opportunities.
suggest_when: User asks about monetization, pricing, "how do we make more money", "conversion to paid", "free-to-paid", "upsell", "expansion revenue", "willingness to pay", "packaging", "pricing tiers", ARPU, LTV, or revenue per user.
---
**User context:** $ARGUMENTS

> If the above is blank, ask the user to share the relevant context before proceeding.


# Diagnose Monetization

**Find where revenue is leaking, identify willingness-to-pay signals in user behavior, evaluate your packaging, and size the opportunities to capture more value.**

You are delivering value but not capturing it proportionally. Monetization diagnosis is not about raising prices blindly — it is about understanding the relationship between the value users receive and the revenue you collect, finding the gaps, and closing them. The best monetization improvements come from aligning price with value: charge more where you deliver more, remove friction where payment blocks adoption, and expand revenue from users who have already proven they need you.

---

## Prompt Template

```
You are a monetization strategist who understands that pricing is a product decision, not a finance decision. You follow the value, size every opportunity, and never recommend a price change without understanding the behavioral impact on conversion and retention.

Here is what I'm working with:

<context>
{{DESCRIBE YOUR PRODUCT, PRICING MODEL (FREE/FREEMIUM/TRIAL/PAID TIERS), CURRENT REVENUE METRICS (ARR, ARPU, CONVERSION RATE, EXPANSION RATE, REVENUE CHURN), USER SEGMENTS, AND ANY DATA ON FEATURE USAGE BY TIER}}
</context>

Help me diagnose monetization. Follow these steps precisely:

### Step 1: Map the Revenue Architecture

Start by decomposing how revenue is generated and where it leaks.

- **Decompose revenue mathematically:** Revenue = Users x Conversion Rate x ARPU x (1 - Revenue Churn Rate) + Expansion Revenue. Size every component with actual numbers.
- **Map each tier/plan:** For each — price, what's included, current user count, conversion rate from the prior tier, ARPU.
- **Identify the value metric** — the unit of value that scales with usage and should drive pricing (seats, events tracked, queries run, projects created, API calls). Assess whether current pricing aligns with this value metric. If you charge per seat but value scales with usage volume, there is a structural misalignment that leaks revenue.
- **Calculate LTV:CAC by segment** if data is available. Segments where LTV:CAC > 3 are under-monetized or under-invested in acquisition. Segments where LTV:CAC < 1 are value-destroyers — you are paying more to acquire them than they will ever return.

### Step 2: Diagnose the Free-to-Paid Funnel

If you have a free tier or trial, this is where most revenue leaks.

- **Map the conversion funnel** from free/trial to first payment. Size every step with absolute numbers and rates.
- **Identify the conversion trigger** — what behavior or event precedes conversion? Common triggers:
  - Hitting a usage limit (natural paywall)
  - Needing a paid-only feature (feature gate)
  - Team expansion (seat-based trigger)
  - Compliance or admin requirement (enterprise trigger)
- **Segment conversion by:** acquisition channel, user persona, company size, usage intensity, time-in-product. Look for segments that convert at 2x+ or 0.5x the average — these reveal packaging misalignment or targeting problems.
- **Analyze time-to-conversion:** How long from signup to first payment? Is there a natural conversion window? Plot the conversion probability over time — users who don't convert within this window rarely convert later. Quantify the decay curve.
- **Distinguish "freeloaders" from "future converts":**
  - **Freeloaders:** Heavy free users who will never pay — they work around limits, use free alternatives for paid features, or are in segments that don't have budget. Size this population.
  - **Future converts:** Users building toward a trigger — growing usage, adding team members, exploring paid features. Size this population.
  - If the freeloader population is large, the free tier gives away too much value. If the future-convert pipeline is thin, the free tier doesn't demonstrate enough value to motivate upgrading.

### Step 3: Evaluate Packaging and Pricing

Packaging decides who pays and how much. Get it wrong and you either leave money on the table or block adoption.

- **Assess feature-tier alignment.** For each paid feature:
  - What percentage of free users would want it?
  - What percentage of paid users actually use it?
  - Is it a "door-opener" (drives initial conversion) or a "door-closer" (justifies renewal)?
- **Identify packaging problems:**
  - **Under-gating:** High-value features available for free that could drive conversion if gated. Size the opportunity: "X free users use Feature Y weekly. If gated behind paid, at current conversion rates, this is $Z/month."
  - **Over-gating:** Features gated to expensive tiers that few users reach, reducing overall adoption and creating network-effect drag. If a collaboration feature is locked to Enterprise, the product feels hollow for everyone else.
  - **Wrong value metric:** Pricing on seats when value scales with usage (penalizes collaboration) or on usage when value comes from breadth (punishes exploration).
  - **Missing tier:** A gap in the pricing ladder where a meaningful user segment falls — too expensive to upgrade, not enough value in the current plan. Size the population stuck in this gap.
- **Identify willingness-to-pay signals from behavior:** Users who hit limits and work around them, users who request features only available in higher tiers, users whose usage patterns match paid-tier profiles but haven't upgraded. These are your highest-conversion targets.

### Step 4: Analyze Expansion and Contraction

For subscription businesses, expansion revenue is often a larger opportunity than new customer acquisition.

- **Decompose net revenue retention (NRR):** Gross retention + expansion - contraction - churn. Size each component.
- **Identify expansion triggers:** What causes users to upgrade? Seat growth, usage growth, feature need, compliance? Size each trigger by frequency and revenue impact.
- **Identify contraction triggers:** What causes downgrades? Seat reduction, usage decline, feature redundancy, budget cuts? Size each.
- **Calculate expansion revenue potential:** "X% of users on Tier A use >80% of their limit. If Y% upgrade when they hit the limit, that is $Z/month in expansion revenue." This is the most directly addressable monetization opportunity.
- **Identify "expansion-ready" cohorts** — users whose behavior signals they need a higher tier but haven't upgraded. What is blocking them?
  - Price shock (the jump between tiers is too large)
  - Unclear value (they don't understand what they'd get)
  - Friction (the upgrade flow is buried, requires sales contact, or takes too long)

### Step 5: Size and Rank Monetization Opportunities (and Anti-Plays)

Build a monetization opportunity matrix. For each opportunity:

| Opportunity | Revenue Impact ($/month) | Affected Users | Retention Risk | Effort | Time to Impact |
|-------------|-------------------------|----------------|----------------|--------|----------------|
| ... | ... | ... | ... | ... | ... |

- Rank by **risk-adjusted revenue impact.** A change that adds $50K/month but increases churn by 5% may be net-negative. Show the math for the top 3 opportunities.
- **Model the sensitivity:** "A 1 percentage point improvement in free-to-paid conversion at current volume = $X/month. A $Y increase in ARPU across current paid base = $Z/month." This reveals whether conversion or ARPU is the bigger lever.
- **Run the compound math:** Monetization improvements that also improve retention (better value alignment, removing friction) compound. Monetization changes that hurt retention erode over time. Always model both effects.

**Where NOT to focus — common anti-plays:**
- Raising prices without understanding price sensitivity — you may increase ARPU but decrease conversion, netting negative
- Gating features that drive activation or retention — you'll trade short-term revenue for long-term churn. If a feature is what makes users stick, keep it accessible.
- Optimizing monetization before product-market fit — if retention is poor, fixing pricing won't save you. Use **build-metric-tree** to check.
- Adding a cheap tier to "capture more users" when the real problem is conversion friction, not price — you'll dilute ARPU without fixing the funnel
- Treating all free users as "potential revenue" — some segments will never pay, and that's fine if they contribute to network effects, word-of-mouth, or marketplace liquidity
- Over-indexing on ARPU when user volume is the constraint — use **build-metric-tree** to check whether monetization or acquisition is the real lever
- Copying a competitor's pricing without understanding whether your value metric and customer segments are the same

### Output Format

Deliver:
1. Revenue architecture with the decomposed formula and every component sized
2. Free-to-paid funnel analysis with conversion triggers and time-to-conversion
3. Packaging evaluation with specific under-gating, over-gating, and misalignment findings
4. Expansion/contraction analysis with NRR decomposition and expansion-ready cohorts
5. Ranked monetization opportunity matrix with risk-adjusted revenue math
6. Anti-plays — where not to invest
7. Open questions — what data is missing, what hypotheses need validation (especially price sensitivity)

Be direct. Be quantitative. If the pricing model is structurally misaligned with value delivery, say so clearly.
```

---

## Tips

- Monetization changes are high-stakes and hard to reverse. Always pair with **craft-experiment-design** before shipping pricing or packaging changes.
- Bring your revenue data by tier and segment. Even approximate ARPU and conversion rates unlock the sizing steps.
- Use **build-metric-tree** first to confirm monetization is actually the bottleneck — if acquisition or retention is broken, fixing monetization won't save you.
- Use **create-chart** to build feature usage by tier charts in Amplitude. These are essential for the packaging evaluation in Step 3.
- Use **diagnose-retention** to understand if revenue churn is driven by product churn or pricing dissatisfaction — the interventions are completely different.
- If you have a free tier, the single most impactful analysis is identifying the conversion trigger. Once you know what makes users pay, you can engineer more users toward that moment.
