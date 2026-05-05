---
name: craft-experiment-design
description: "Design a complete A/B test plan with falsifiable hypothesis, primary/secondary/guardrail metrics, audience allocation, holdout strategy, and duration estimate. Use when planning an experiment, split test, or feature rollout that needs statistical rigor."
---

# Experiment Design

**Design a complete A/B test plan from a proposed change.**

Takes a feature change or product hypothesis and produces a structured experiment plan ready for data science and engineering review.

---

## Prompt Template

```
Design an experiment plan for the proposed change below.

<context>
$ARGUMENTS
</context>

> If the above is blank, ask the user: "{{DESCRIBE THE CHANGE YOU WANT TO TEST, YOUR CURRENT BASELINE METRICS (conversion rate, traffic volume, etc.), AND WHAT YOU EXPECT TO HAPPEN}}"

Work through these steps in order:

### 1. Hypothesis

Write a falsifiable statement: "If we [specific change], then [measurable outcome] will [increase/decrease] by [estimated magnitude], because [rationale grounded in user behavior or data]."

Push back if the hypothesis isn't falsifiable or the rationale is hand-wavy. A hypothesis without a mechanism is a guess.

### 2. Metrics

- **Primary metric:** The single metric that determines success or failure. Must be directly measurable and causally linked to the change.
- **Secondary metrics (2-3):** Supporting signals that help explain WHY the primary metric moved. Include at least one engagement metric and one downstream conversion metric.
- **Guardrail metrics (2-3):** Metrics that must not degrade. Include error rate, latency, and a retention or satisfaction signal relevant to the product area.

Use real metric names from the user's domain, not generic placeholders.

### 3. Audience and Allocation

- Define the target population (who should be in the test, who should be excluded)
- Recommend percentage split with rationale
- Flag any audience segments that could confound results (power users, new users, specific geos)

### 4. Duration and Sample Size

- Estimate minimum detectable effect (MDE) the user cares about
- Calculate approximate duration given stated traffic volume (or ask for it)
- Flag risks: novelty effects, day-of-week bias, seasonal patterns
- State assumptions explicitly so the user can validate with their data team

### 5. Holdout Strategy

Recommend whether to maintain a holdout group post-test. Be specific:
- If yes: what percentage, for how long, and what you'll measure
- If no: why the test results are sufficient

### 6. Risks and Failure Modes

- What could bias the results? (instrumentation bugs, selection bias, metric gaming)
- What's the "test is inconclusive" scenario and how do you avoid it?
- What's the minimum bar for shipping vs. iterating?

> **Checkpoint:** After drafting the plan, review it against these questions: Is the hypothesis falsifiable? Can the primary metric actually be measured? Is the duration realistic given traffic? If any answer is no, revise before presenting.
```

---

## Tips

- Always include baseline metrics (current conversion rate, traffic volume, prior test results) in the input. Without them, duration estimates are guesses.
- If guardrail metrics aren't obvious, ask about the product area and suggest appropriate ones.
- Pair with **craft-experiment-readout** after the test completes to analyze results.
