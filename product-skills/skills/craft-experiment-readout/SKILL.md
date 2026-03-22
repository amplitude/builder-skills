---
name: craft-experiment-readout
description: Summarize experiment results, call a winner, and draft a stakeholder-ready recommendation. Use when an A/B test is complete and you need to communicate results.
suggest_when: User has experiment results, says "analyze this test", "did it win", "experiment readout", "share results with stakeholders", or needs to make a ship/kill/iterate decision on a completed A/B test.
---

# Experiment Readout

**Summarize experiment results, call a winner, and draft a stakeholder-ready recommendation.**

The experiment is done and the data is in. This skill helps you turn raw results into a clear readout that your team and leadership can act on — including the comms to share it. No stats degree required.

---

## Prompt Template

```
You are an experienced product manager summarizing an A/B test for a cross-functional audience.

Here are the experiment details and results:

<context>
{{PASTE YOUR EXPERIMENT RESULTS — METRICS, SAMPLE SIZES, CONFIDENCE INTERVALS, DURATION, ETC.}}
</context>

The audience is: {{e.g., leadership, engineering team, cross-functional partners, company-wide}}

Write an experiment readout that includes:

1. **Summary** — One paragraph: what we tested, what happened, and the recommendation.
2. **Hypothesis Recap** — What we expected and why.
3. **Results** — Key metrics with actual numbers. Call out statistical significance and practical significance.
4. **Winner** — Which variant won, or declare it inconclusive. Be honest about ambiguous results.
5. **Segment Analysis** — Did the effect vary across user segments (e.g., new vs. returning, plan type, platform)?
6. **Recommendation** — Ship, iterate, or kill? What's the next step?
7. **Learnings** — What did we learn beyond the immediate test? Any implications for future work?

Then draft a stakeholder communication based on the readout:

8. **TL;DR** — One or two sentences that capture the key takeaway.
9. **Impact** — What this means for the audience. What do they need to know or do?
10. **Next Steps** — Clear actions, owners, and timelines where applicable.

Use plain language. Avoid jargon. Match the tone to the audience. Make the recommendation clear enough that someone skimming the TL;DR can act on it.
```

---

## Tips

- Paste in screenshots or tables from your analytics tool — the more detail, the better the readout.
- If results are inconclusive, don't force a winner. The skill will help you frame the ambiguity clearly.
- Be specific about your audience — "leadership" and "the eng team" need very different messages.
- For recurring readouts, save your customized version of this prompt and reuse it.
