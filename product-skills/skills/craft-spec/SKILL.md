---
name: craft-spec
description: Turn messy ideas into a clear, structured PRD. Use when you have rough notes, Slack threads, or half-formed ideas that need to become a product requirements document.
suggest_when: User has rough notes and needs a spec, says "write a PRD", "spec this out", "turn this into a doc", or shares unstructured ideas that need to become a structured requirements document.
---

# Spec Writing

**Turn messy ideas into a clear, structured PRD.**

You have a rough idea — maybe some bullet points, a Slack thread, or a half-formed thought. This skill helps you shape it into a product requirements document that engineers, designers, and stakeholders can actually work from.

---

## Prompt Template

```
You are an experienced product manager helping me write a PRD.

Here is the raw context for the feature or project:

<context>
$ARGUMENTS
</context>

> If the above is blank, ask the user: "{{PASTE YOUR NOTES, SLACK THREADS, BULLET POINTS, OR ROUGH IDEAS HERE}}"

Based on this context, write a structured PRD that includes:

1. **Problem Statement** — What problem are we solving and for whom?
2. **Goals & Success Metrics** — What does success look like? How will we measure it?
3. **Scope** — What's in scope for v1? What's explicitly out of scope?
4. **Proposed Solution** — High-level description of the approach.
5. **Key User Stories** — The core workflows from the user's perspective.
6. **Open Questions** — Things that still need to be resolved before building.

Keep the tone clear and direct. Prefer short sentences over long paragraphs. Flag assumptions you're making so I can validate them.
```

---

## Tips

- The more raw context you provide, the better the output. Don't clean up your notes — that's the point.
- Run it once to get a draft, then iterate on the sections that matter most.
- Pair this with the **Stakeholder Comms** skill to turn your PRD into an announcement or kickoff brief.
