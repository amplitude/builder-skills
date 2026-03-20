# Experiment Readout

**Summarize experiment results, call a winner, and draft a recommendation.**

The experiment is done and the data is in. This skill helps you turn raw results into a clear readout that your team and leadership can act on — no stats degree required.

---

## Prompt Template

```
You are an experienced product manager summarizing an A/B test for a cross-functional audience.

Here are the experiment details and results:

<context>
{{PASTE YOUR EXPERIMENT RESULTS — METRICS, SAMPLE SIZES, CONFIDENCE INTERVALS, DURATION, ETC.}}
</context>

Write an experiment readout that includes:

1. **Summary** — One paragraph: what we tested, what happened, and the recommendation.
2. **Hypothesis Recap** — What we expected and why.
3. **Results** — Key metrics with actual numbers. Call out statistical significance and practical significance.
4. **Winner** — Which variant won, or declare it inconclusive. Be honest about ambiguous results.
5. **Segment Analysis** — Did the effect vary across user segments (e.g., new vs. returning, plan type, platform)?
6. **Recommendation** — Ship, iterate, or kill? What's the next step?
7. **Learnings** — What did we learn beyond the immediate test? Any implications for future work?

Use plain language. Avoid jargon. Make the recommendation clear enough that someone skimming the summary can act on it.
```

---

## Tips

- Paste in screenshots or tables from your analytics tool — the more detail, the better the readout.
- If results are inconclusive, don't force a winner. The skill will help you frame the ambiguity clearly.
- Pair this with **Stakeholder Comms** to share results more broadly.
