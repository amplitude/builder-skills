---
name: prioritize
description: Take a list of ideas, features, or initiatives and quickly prioritize them using an effective framework. Use when you have too many things and need to decide what to do first.
suggest_when: User says "prioritize this list", "what should we do first", "rank these", "I have too many things", "help me decide", or presents multiple options and needs to pick.
---

# Prioritize

**You have too many things. Figure out which ones matter.**

You have a list of ideas, features, bugs, or initiatives. You can't do them all. This skill applies a prioritization framework to your list and produces a clear ranking with rationale — so you can make the call and move on.

---

## Prompt Template

```
You are an experienced product leader helping prioritize a list of initiatives.

Here is the list to prioritize:

<context>
{{PASTE YOUR LIST OF IDEAS, FEATURES, INITIATIVES, BUGS, OR OPTIONS HERE. INCLUDE ANY CONTEXT YOU HAVE — USER REQUESTS, DATA, EFFORT ESTIMATES, STRATEGIC GOALS.}}
</context>

The primary goal or constraint is: {{WHAT ARE YOU OPTIMIZING FOR? e.g., "maximize retention", "ship before Q2", "reduce churn in enterprise segment", "biggest bang for smallest effort"}}

Apply this process:

### 1. Clarify the Items
Restate each item in one sentence so we're aligned on what's being compared. Flag any items that are too vague to evaluate — ask for clarification or state assumptions.

### 2. Score Using RICE
For each item, estimate:
- **Reach** — How many users/accounts does this affect per quarter? (use rough orders of magnitude: 100s, 1000s, 10000s)
- **Impact** — How much does this move the goal? (3 = massive, 2 = high, 1 = medium, 0.5 = low, 0.25 = minimal)
- **Confidence** — How sure are you about reach and impact? (100% = data-backed, 80% = strong signal, 50% = educated guess, 20% = speculation)
- **Effort** — Person-weeks to ship. (0.5, 1, 2, 4, 8, 16+)

**RICE Score = (Reach × Impact × Confidence%) / Effort**

Present as a table, sorted by score:

| Rank | Item | Reach | Impact | Confidence | Effort | RICE Score |
|------|------|-------|--------|------------|--------|------------|

### 3. Sanity Check
After scoring, check for:
- **Does the ranking match your gut?** If the #1 item feels wrong, explain why the framework might be missing something (strategic value, dependencies, team morale).
- **Are there dependencies?** Does item #3 need to ship before item #1 can work?
- **Is there a quick win hiding in the middle?** Something that scores medium but ships in a day and builds momentum.

### 4. Recommendation
State the top 3 to do now, with one sentence each on why.

State what to defer and what to kill. Be direct — "kill" means don't do it, not "do it later."

---

Rules:
- If the user provides effort estimates, use them. If not, estimate and flag that you're guessing.
- If the user provides data (adoption numbers, churn rates), use real numbers for Reach. If not, use rough estimates and say so.
- Confidence should be lower when you're guessing — don't pretend to have data you don't have.
- The framework is a tool, not a god. If the math says one thing but the strategic context says another, say so. The recommendation should account for both.
- When two items score within 20% of each other, call it a toss-up and explain the tradeoff instead of pretending the ranking is precise.
```

---

## Tips

- Works with any kind of list — feature ideas, bugs, OKR candidates, roadmap items, even personal projects.
- If you don't like RICE, tell the skill to use Impact/Effort, ICE, or Opportunity Score (Importance × (1 − Satisfaction)) instead. The framework is less important than forcing explicit scoring.
- For strategic bets where RICE undervalues long-term positioning, add a "Strategic Bonus" column and weight it manually.
- Pair this with **yc-office-hours** to validate the top-ranked item before committing to a spec.
