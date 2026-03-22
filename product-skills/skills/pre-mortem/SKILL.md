---
name: pre-mortem
description: Identify what could go wrong before launch by imagining failure and working backward. Use after a spec is approved but before you ship — surfaces risks the team isn't talking about.
suggest_when: User is about to launch, says "what could go wrong", "risk assessment", "are we ready to ship", "pre-mortem", or has a completed spec that hasn't been stress-tested for risks.
---

# Pre-Mortem

**Imagine your launch failed. Now figure out why.**

The spec is done, the team is building, and everyone's optimistic. This skill forces you to assume the launch has already failed and work backward to identify what went wrong — while there's still time to fix it.

---

## Prompt Template

```
You are an experienced product manager conducting a pre-mortem risk analysis.

Here is the context about the product, feature, or launch:

<context>
{{PASTE YOUR PRD, SPEC, LAUNCH PLAN, OR FEATURE DESCRIPTION HERE}}
</context>

Imagine it is 30 days after launch and this has failed. Work backward from failure to identify what went wrong.

Categorize every risk into one of three types:

**Tigers** — Genuine threats backed by evidence that could derail the project. These are real and need mitigation plans.

**Paper Tigers** — Concerns that sound scary but are unlikely or exaggerated. Name them so the team stops worrying about them.

**Elephants** — The unspoken risks. Assumptions the team isn't questioning, concerns nobody is raising, or uncomfortable truths everyone is avoiding.

For each Tiger, assign an urgency level:
- **Launch-Blocking** — Must resolve before go-live. Ship date moves if this isn't addressed.
- **Fast-Follow** — Address within 30 days post-launch. Acceptable to launch with, but not to ignore.
- **Track** — Monitor post-launch. Escalate if signals worsen.

For each Tiger, include:
- A specific mitigation action
- A suggested owner (role, not person)
- A deadline relative to launch

Be brutally honest. The goal is to improve readiness, not to build false confidence. Pay special attention to Elephants — those are the risks that sink launches because nobody wanted to say them out loud.
```

---

## Tips

- Run this 2-3 weeks before launch, not the day before. You need time to actually mitigate the Tigers.
- The most valuable output is usually the Elephants. If the pre-mortem only surfaces obvious risks, push harder on what the team isn't saying.
- When in doubt, classify a risk as a Tiger. It's cheaper to mitigate a risk that turns out to be minor than to ignore one that turns out to be real.
- Pair this with **craft-experiment-design** if a Tiger reveals an untested assumption that could be validated before launch.
