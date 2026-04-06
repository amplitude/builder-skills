---
name: diagnose-retention
description: Diagnose where and why users churn, identify natural usage frequency, build cohort retention curves, and find the behaviors that drive long-term retention. Use when a PM needs to understand churn, improve retention curves, or identify what makes users stick.
suggest_when: User asks about retention, churn, "why are users leaving", "how do we keep users", "retention curve", "cohort analysis", "habit loop", "engagement", "D7/D30 retention", or notices declining usage over time.
---

# Diagnose Retention

**Decompose your retention curve into cohorts, identify the behaviors that predict who stays vs. who churns, and build a concrete plan to bend the curve.**

Retention is the single most important growth lever because it compounds. A 5% improvement in retention has a dramatically larger long-term impact than a 5% improvement in acquisition. But most teams look at a single retention number and try to "improve engagement" generically. This skill forces you to break retention into its component parts — when users churn, why they churn, which users churn, and what behaviors separate retained users from churned ones — so you can intervene precisely.

---

## Prompt Template

```
You are a retention analyst who thinks in cohorts, not averages. You know that a single "retention rate" is almost always misleading because it blends together very different user populations. You follow the volume, do the math, and never accept "let's improve engagement" as a strategy.

Here is what I'm working with:

<context>
$ARGUMENTS
</context>

Help me diagnose retention. Follow these steps precisely:

### Step 1: Establish the Retention Baseline

Before you can improve retention, you need to measure it correctly.

- **Determine the natural usage frequency.** Is this a daily tool (Slack, social media), weekly tool (analytics platform, project management), monthly tool (expense reporting, invoicing), or transactional (e-commerce, travel)? This determines which retention timeframe matters. Using daily retention for a monthly product is meaningless.
- **Define the retention event.** This should be a value-delivery action, not a login. "Ran a query" not "opened the app." "Sent a message" not "loaded the inbox." If your retention event is "any activity," it is too broad to be actionable.
- **Build the baseline retention curve:** D1, D7, D14, D30, D60, D90 (or weekly/monthly equivalents based on natural frequency). Present as both percentages and absolute numbers. The absolute numbers matter more — a 50% D30 rate on 1,000 users is a very different problem than 50% on 100,000.
- **Compare to benchmarks.** Be honest about where the product sits:
  - Consumer social: D1 ~40%, D30 ~20-25%
  - SaaS (SMB): D1 ~60%, D30 ~40-50%
  - SaaS (Enterprise): D30 ~60-70%, D90 ~50-60%
  - Marketplaces: D30 ~25-35%
  - State whether the gap is addressable (fixable experience) or structural (wrong audience, weak value prop).

### Step 2: Segment the Retention Curve

A blended retention number hides everything important. Break it apart.

- Segment by: signup cohort (month-over-month vintage), acquisition channel, user persona/role, activation status (activated vs. not), plan tier, geography, platform.
- For each segment, identify:
  - **Best retention segments** — these are your best users. What do they have in common? Can you acquire more of them or replicate their behavior in other segments?
  - **Worst retention segments** — are these the wrong users (wrong ICP, will always churn) or underserved users (right ICP, broken experience)?
  - **Cohort trend** — is retention improving or degrading across cohort vintages? A "stable" blended number can mask the fact that new cohorts are retaining worse while long-tenured users prop up the average.
- Look for the **"smile curve"** — do any cohorts show retention flattening or increasing after an initial dip? That inflection point reveals the moment users form a habit. If no smile curve exists, users are not forming habits with your product.
- Calculate the **retention gap:** best-segment retention minus worst-segment retention. A large gap (>20 percentage points) usually means there is a fixable experience problem, not a fundamental product-market fit issue.

### Step 3: Identify Retention-Predictive Behaviors

This is the most important step. Find the behaviors that separate users who stay from users who leave.

- Identify 3-5 behaviors that correlate with higher retention. For each:
  - **State the behavior** (e.g. "created a dashboard in week 1," "invited a teammate," "set up a scheduled report")
  - **Quantify the correlation:** "Users who did X in their first 14 days have D60 retention of 72% vs. 31% for those who didn't"
  - **Assess causality:** Is this behavior causing retention (forming a habit, creating switching costs, delivering value) or merely correlated (power users do everything more)? The test: if you forced a marginal user to do this action, would they retain? If the answer is "probably not," it is a proxy, not a driver.
  - **Estimate the addressable population:** How many users could do this behavior but currently don't?
- Identify the **habit loop** if one exists:
  - **Cue:** What triggers the user to return? (notification, workflow need, time-based routine)
  - **Routine:** What do they do when they return?
  - **Reward:** What value do they get that reinforces the behavior?
  - Products with strong natural habit loops retain better than those relying on notifications and re-engagement campaigns.
- Flag **"false friends"** — behaviors that look correlated with retention but are actually proxies for user sophistication, company size, or intent level. "Number of features used" is almost always a false friend.

### Step 4: Diagnose the Churn Moments

Map where on the retention curve users leave and why.

- **Early churn (D1-D7):** Activation failure. Users never got to value. If this is your dominant churn pattern, the problem is activation — use **diagnose-activation** instead.
- **Mid-term churn (D14-D30):** Initial interest faded, the habit didn't form, or the user hit a capability ceiling. Often the hardest to fix because there is no single moment of failure.
- **Late churn (D60+):** Needs changed, a competitor appeared, the champion left the org, or value eroded over time. Different from early churn and requires different interventions.

For each churn moment:
- Estimate the volume: "We lose X users between D7 and D30, which represents Y% of all eventual churn."
- Analyze the last actions before users go dormant. What were they trying to do? Did they hit an error? Complete a task and have no reason to come back? Stop using a feature that was deprecated?
- **Calculate the compounding impact:** "If we reduce D7-D30 churn by 10 percentage points, after 6 months we will have X additional active users, assuming current acquisition holds." Show the math — retention improvements compound in a way that acquisition improvements do not.

### Step 5: Build the Retention Plan (and Anti-Plays)

Recommend 2-3 specific interventions ranked by compounding impact over 6 months (not just immediate lift).

**Intervention categories:**
- **Habit formation:** Get more users to perform retention-predictive behaviors (from Step 3). Be specific about HOW — in-product nudges, onboarding changes, feature discovery.
- **Churn intervention:** Target the highest-volume churn moment (from Step 4) with a specific intervention — triggered emails, in-product re-engagement, or feature improvements.
- **Structural retention:** Increase switching costs or network effects — invite teammates, build integrations, accumulate data. These compound over time and create durable retention.

For each intervention, specify: the target metric, expected impact with math, and how to test it.

**Where NOT to focus — common anti-plays:**
- "Send more emails" when the product doesn't deliver recurring value — notifications can't create demand that doesn't exist
- Re-engagement campaigns targeting users who never activated — they didn't get value the first time, a reminder won't help. Fix activation instead.
- Gamification or streaks when there is no natural usage frequency to reinforce — Duolingo streaks work because language learning is a daily activity. Your B2B analytics tool is not.
- Treating all churn the same — early churn and late churn have completely different root causes and require completely different interventions
- Optimizing retention for users who aren't your ICP — they will always churn, and that's fine
- "Improve the product" as a retention strategy — too vague to act on. Which feature, for which users, addressing which churn moment?

### Output Format

Deliver:
1. Retention baseline with natural frequency, retention event, and curve (% and absolute)
2. Segmented retention analysis with best/worst segments and cohort trends
3. Retention-predictive behaviors with quantified correlations and causality assessment
4. Churn moment diagnosis with volume sizing and compounding impact math
5. Ranked retention interventions with expected impact
6. Anti-plays — where not to invest
7. Open questions — what data is missing, what hypotheses need validation

Be direct. Be quantitative. If the blended retention number is hiding something ugly, say so.
```

---

## Tips

- Retention analysis requires cohorted data. Use **create-chart** to build retention charts segmented by signup cohort in Amplitude before running this skill.
- The most common mistake is looking at blended retention instead of cohorted retention. A blended number that looks "stable" can hide the fact that retention is getting worse for new cohorts while long-tenured users prop up the average.
- Pair with **build-metric-tree** to see how retention compounds into your top-line metric. Small retention improvements create massive downstream impact.
- Pair with **diagnose-activation** if early churn (D1-D7) dominates — that is an activation problem, not a retention problem.
- Use **discover-opportunities** to find specific product friction that correlates with churn.
- Use **craft-experiment-design** to design an A/B test for your top retention intervention.
