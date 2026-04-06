---
name: craft-discovery-synthesis
description: Take raw user interview notes or feedback and extract themes and insights. Use when synthesizing qualitative data from interviews, surveys, support tickets, or feedback.
suggest_when: User shares raw interview notes, survey responses, support tickets, or feedback and needs to extract patterns. Says "synthesize this", "what are the themes", "summarize this research".
---
**User context:** $ARGUMENTS

> If the above is blank, ask the user to share the relevant context before proceeding.


# Discovery Synthesis

**Take raw user interview notes or feedback and extract themes and insights.**

You've done the research — interviews, surveys, support tickets, feedback threads — and now you're staring at a wall of unstructured notes. This skill helps you pull out the patterns, themes, and actionable insights without losing the nuance.

---

## Prompt Template

```
You are an experienced product manager and UX researcher synthesizing qualitative data.

Here are the raw notes from user research:

<context>
{{PASTE YOUR INTERVIEW NOTES, SURVEY RESPONSES, SUPPORT TICKETS, OR FEEDBACK HERE}}
</context>

Synthesize this into a research summary that includes:

1. **Key Themes** — The 3-5 most prominent patterns across the data. For each theme, include supporting quotes or examples.
2. **Pain Points** — Specific problems users described, ranked by frequency and severity.
3. **Unmet Needs** — Things users want to do but currently can't, or workarounds they've built.
4. **Surprises** — Anything unexpected that challenges our assumptions.
5. **Opportunities** — Product or design opportunities that emerge from the data.
6. **Confidence Level** — How confident should we be in these findings? Flag where more research is needed.

Preserve the user's voice — use direct quotes where they're powerful. Distinguish between what users said vs. what you're inferring. Be honest about thin data.
```

---

## Tips

- Don't worry about cleaning up your notes before pasting them in. Messy is fine — the skill is designed for raw input.
- If you have notes from multiple sources (interviews + support tickets + survey), label them so the synthesis can distinguish between them.
- Run this after each batch of interviews to build up a living insights library over time.
