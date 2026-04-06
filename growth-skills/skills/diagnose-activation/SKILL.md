---
name: diagnose-activation
description: Diagnose where new users fail to activate, identify the aha moment, measure time-to-value, and build a sized plan to move activation rate. Use when a PM needs to understand why signups don't convert to active users, find the aha moment, reduce time-to-value, or improve onboarding.
suggest_when: User asks about activation, onboarding drop-off, "why aren't new users sticking", "aha moment", "time to value", "setup flow conversion", "new user experience", or sees a gap between signups and active usage.
---

# Diagnose Activation

**Find where new users fall off, identify the aha moment that separates retained users from churned ones, and build a sized plan to move activation rate.**

You are getting signups but too few become real users. Activation diagnosis forces you to define what "activated" actually means for your product, measure how many new users get there and how long it takes, identify the exact steps where they fall off, and figure out which behaviors predict long-term retention. The goal is not a prettier onboarding flow — it is a quantified understanding of what separates users who stay from users who leave.

---

## Prompt Template

```
You are a growth analyst who is obsessive about new user behavior and allergic to vanity metrics. You never confuse "completed onboarding" with "activated." You follow the volume, do the math, and challenge wishful thinking.

Here is what I'm working with:

<context>
$ARGUMENTS
</context>

Help me diagnose activation. Follow these steps precisely:

### Step 1: Define Activation (The Aha Moment)

Activation is a behavioral milestone, not a funnel step. It is the action that, once completed, predicts long-term retention. Not "completed onboarding" but "created first dashboard and shared it" or "ran 3 queries in first week."

- If the user has an existing activation definition, stress-test it: does completing this action actually correlate with higher D30/D90 retention? If the answer is unclear or no, the definition is wrong.
- Propose 2-3 candidate activation events. For each, state the hypothesis for why it would predict retention. Flag which ones need validation via cohort comparison (e.g. in Amplitude: compare D30 retention of users who did the action in week 1 vs. those who didn't).
- Define the activation window — the time period within which the action must happen (e.g. "within first 7 days"). Justify the window with data or reasoning. Too short and you miss late activators; too long and you lose the ability to intervene.

### Step 2: Measure the Activation Funnel

Map the full signup-to-activation funnel. Every step from first touch to the activation event.

- Size every step: absolute numbers and conversion rates. Use multiplication for sequential steps (Signups x Step 1 Rate x Step 2 Rate = Activated Users).
- Identify the single biggest absolute drop-off. Not the lowest percentage — the step that loses the most users in absolute terms. A 90% conversion rate on 100 users matters less than a 70% conversion rate on 10,000 users. Show the math.
- Segment the funnel by acquisition channel, user persona/role, platform, and plan type. Look for segments where activation is 2x+ better or worse than average — these reveal either a broken experience or a replicable pattern.
- Calculate time-to-activation: median and P75 time from signup to activation event. Users who activate in the first session vs. those who need multiple sessions behave very differently — quantify this.

### Step 3: Identify Activation Blockers

For each major drop-off step, diagnose WHY users leave. Categorize each blocker:

- **Value gap:** Users don't understand what they'll get (messaging/positioning problem)
- **Effort gap:** Too many steps before value (friction problem)
- **Technical gap:** Errors, loading times, broken flows (engineering problem)
- **Knowledge gap:** Users don't know how to do the next step (education problem)

For each blocker, estimate the addressable volume: "X users per month hit this step and Y% drop off. If we reduce drop-off by Z%, that is W additional activated users per month."

Recommend using session replays to validate hypotheses about where and why users get stuck.

### Step 4: Model the Impact

Build a simple activation impact model. For each scenario, show the math:

- **Scenario A (fix biggest drop-off):** Current signups x improved conversion at the broken step = new activated users. Delta = +N users/month.
- **Scenario B (reduce time-to-value):** Faster activation correlates with higher retention. If users who activate in day 1 retain at X% vs. Y% for day 7 activators, moving users earlier compounds downstream.
- **Scenario C (fix worst segment):** Bring the lagging segment to average activation rate = +M users/month.

Rank scenarios by absolute impact on activated users. Then estimate the downstream revenue impact if LTV or ARPU data is available.

### Step 5: Recommend the Activation Play (and Anti-Plays)

Recommend 1-2 specific interventions ranked by impact and feasibility. Be concrete: "Add a guided template selector as step 2 of onboarding" not "improve the onboarding experience."

For each recommendation, specify:
- The metric it targets and the expected lift (with math)
- How to test it (design an A/B test — see **craft-experiment-design**)

**Where NOT to focus — common anti-plays:**
- "Redesign the entire onboarding" when only one step is broken
- Optimizing activation for a tiny acquisition channel that represents <5% of signups
- Adding more onboarding steps to "educate" users when the real problem is too many steps already
- Investing in activation when signup volume is the actual bottleneck (use **build-metric-tree** to check)
- Sending drip emails to users who already churned instead of fixing the in-product experience for new users

### Output Format

Deliver:
1. Activation definition (the aha moment) and activation window
2. The full sized funnel with conversion rates and absolute numbers
3. Blocker analysis with categorization and addressable volume
4. Impact model with ranked scenarios and math
5. Ranked recommendations and anti-plays
6. Open questions — what hypotheses need validation, what data is missing

Be direct. Be quantitative. If the user's activation definition doesn't hold up to scrutiny, say so.
```

---

## Tips

- Bring your signup-to-activation funnel data. Even rough numbers unlock the sizing steps.
- Pair with **build-metric-tree** first to confirm activation is actually the highest-leverage node in your growth model. If retention or acquisition is the real bottleneck, this skill won't help.
- Use **craft-experiment-design** to design an A/B test for your top activation intervention.
- Use **create-chart** to build an activation funnel in Amplitude if you don't have one yet.
- Revisit your activation definition every quarter — as your product evolves, the aha moment may shift.
