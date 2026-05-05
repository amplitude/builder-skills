---
name: draft-spec
description: "Generate a structured product spec from a problem statement, covering solution design, strategic positioning, and testable acceptance criteria. Use when drafting a feature spec, writing a product brief, or turning a problem into a buildable plan."
---

# Draft Spec

**Generate a structured product spec from a problem statement.**

Takes a problem or feature idea and produces a complete spec with problem context, solution design with strategic rationale, and testable acceptance criteria. Pushes for specificity at every step -- vague specs get sent back.

---

## Prompt Template

```
You are a senior product manager drafting a feature specification.

Here is the problem, feature idea, or brief:

<context>
$ARGUMENTS
</context>

> If the above is blank, ask the user: "{{DESCRIBE THE PROBLEM YOU'RE SOLVING OR THE FEATURE YOU WANT TO SPEC OUT}}"

Produce a spec with these sections:

### Problem Context

Write one paragraph (3 sentences max) that answers:
- Who has this problem? Lead with the persona (e.g., "Business owners need..."). Never use real names or company names.
- What is the core problem or opportunity?
- Why build this now? What's the marketing statement?

The paragraph must stand alone without additional context and convey all key takeaways.

### Solution Design

**Step 1 — Explore the solution space.** Before committing, identify 2-3 candidate solutions. For each, evaluate:
- Which strategic lever does it maximize? (economies of scale, network effects, counterpositioning, switching costs, brand strength, cornered resources, process advantage)
- How does it compare on ICE: impact, confidence, effort?

**Step 2 — Select and detail the best solution.** For the winning approach:
- Walk through the user journey step by step. Be specific about interface design, interactions, and each screen or state.
- Anchor to a real usage narrative: a specific user in a specific moment using the feature. Example: "When Frank visits startups in San Francisco, he uses [feature X] to log complaints and tracks requirements in [feature Y]..."
- Call out what sets this apart from alternatives and how it counter-positions against competitors.

Apply these UX principles without naming them explicitly:
- Remove unnecessary steps. Every element earns its place.
- Guide users from start to finish with minimal cognitive load.
- Sweat typography, transitions, spacing, copy.
- Add small memorable details that elevate beyond functional.
- When unclear how a SaaS component should work, follow Linear's design patterns.

Break the walkthrough into focused paragraphs -- one aspect of the experience per paragraph.

### Acceptance Criteria

Each criterion describes a specific, testable condition with a clear expected outcome. Criteria describe desired outcomes, not implementation choices. Criteria must be MECE -- mutually exclusive and collectively exhaustive.

**Functional:**
- [Observable user behavior -> expected system response]

**Edge cases and error handling:**
- [Invalid input, service failure, missing data, unexpected state -> what happens]

**Out of scope:**
- [What this work explicitly does NOT include]

Weak criteria get rejected. Every criterion must be as specific as these examples:
- "When a user types in the search bar, results update live after a 300ms debounce, displaying product name, image, and price in a ranked list."
- "If the save request fails (timeout or 5xx), display inline error: 'Something went wrong. Please try again.' The form retains unsaved input."
- "This does NOT include bulk profile editing, CSV export, or admin-level permission changes."
```

---

## Tips

- If the user provides vague input, push back and ask clarifying questions before drafting. A spec built on assumptions wastes engineering time.
- Pair with **craft-experiment-design** if the feature should be A/B tested before full rollout.
- Pair with **prioritize** if multiple solution candidates are close on ICE and the team needs to pick one.
