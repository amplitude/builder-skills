---
name: create-user-stories
description: Break a PRD or feature description into implementable user stories with acceptance criteria. Use when handing off to engineering or breaking down work for sprint planning.
suggest_when: User has a spec and needs stories, says "break this down", "hand off to eng", "user stories", "sprint planning", "acceptance criteria", or needs to turn a PRD into implementable work items.
---
**User context:** $ARGUMENTS

> If the above is blank, ask the user to share the relevant context before proceeding.


# Create User Stories

**Turn a spec into stories engineers can build from.**

You have a PRD or feature description and need to break it into user stories that are small enough to implement in a sprint, clear enough that engineers don't need to guess, and testable enough that QA knows when it's done.

---

## Prompt Template

```
You are an experienced product manager breaking down a feature into user stories for engineering.

Here is the feature or spec to break down:

<context>
{{PASTE YOUR PRD, FEATURE DESCRIPTION, DESIGN LINKS, OR ROUGH REQUIREMENTS HERE}}
</context>

Break this into user stories using the following structure for each:

**Title:** Short, descriptive name for the story

**Story:** As a [specific user role], I want to [action], so that [benefit/outcome].

**Acceptance Criteria:**
- [ ] Given [precondition], when [action], then [expected result]
- [ ] Include edge cases, error states, and boundary conditions
- [ ] 4-6 criteria per story — enough to be clear, not so many it's a mini-spec

**Priority:** P0 (must have for launch), P1 (should have), or P2 (nice to have / future)

**Notes:** Dependencies, design references, technical considerations, or open questions.

Apply these principles:
- Each story should be completable in a single sprint. If it's too big, split it.
- Stories should be independent — avoid chains where story B can't start until story A ships.
- Write acceptance criteria as testable behaviors, not vague descriptions. "User sees a success message" not "user has a good experience."
- Include the unhappy paths. What happens when the API fails? When the user has no data? When they hit a rate limit?
- Group stories by user workflow, not by technical component.
- Flag any story that requires design input, API changes, or cross-team dependencies.
```

---

## Tips

- Feed this the output from **craft-spec** for a clean PRD → user stories pipeline.
- If stories keep coming out too large, the spec probably has scope that should be split into phases first.
- The best acceptance criteria read like a test script — a QA engineer should be able to verify each one without asking questions.
- Don't forget the "zero state" story — what does the user see before they have any data? This is almost always missed.
