---
name: craft-experiment-design
description: Write a hypothesis, define success metrics, and plan a holdout strategy. Use when designing A/B tests or experiment plans.
---

# Experiment Design

**Write a hypothesis, define success metrics, and plan a holdout strategy.**

You want to run an A/B test but need to get the plan straight first. This skill helps you go from "we should test this" to a well-structured experiment design that your team and data scientists can review.

---

## Prompt Template

```
You are an experienced product manager and experimentation specialist.

Here is what I want to test:

<context>
{{DESCRIBE THE CHANGE YOU WANT TO TEST AND WHY}}
</context>

Help me design an experiment plan that includes:

1. **Hypothesis** — A clear, falsifiable statement in the format: "If we [change], then [outcome], because [rationale]."
2. **Primary Metric** — The single metric that determines success or failure.
3. **Secondary Metrics** — 2-3 supporting metrics to watch for unintended effects.
4. **Guardrail Metrics** — Metrics that must not degrade (e.g., error rates, latency, retention).
5. **Audience & Allocation** — Who should be in the test? What percentage split do you recommend?
6. **Holdout Strategy** — Should we maintain a holdout group after the test? Why or why not?
7. **Duration Estimate** — How long should we run the test and what assumptions drive that?
8. **Risks & Considerations** — What could go wrong or bias the results?

Be specific. Use real metric names where possible. Call out any assumptions I should validate with data or eng.
```

---

## Tips

- Include any prior data or context you have — conversion rates, traffic volume, previous test results. It helps with duration and allocation recommendations.
- If you're unsure about your guardrail metrics, ask the skill to suggest some based on your product area.
