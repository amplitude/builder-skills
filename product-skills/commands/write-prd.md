---
name: write-prd
description: Guided PRD writing — gathers context conversationally, then generates a structured spec.
---

# Write PRD

Turn a rough idea into a structured PRD through guided conversation.

## Workflow

1. **Understand the Feature** — Accept the user's input in any form: bullet points, Slack threads, rough notes, or a verbal description. Don't ask them to clean it up.

2. **Gather Context** — Ask 3-5 focused questions to fill gaps. Cover:
   - What problem are we solving and for whom?
   - How do we know this is a real problem? (data, feedback, intuition)
   - What does success look like? What metrics would move?
   - What constraints exist? (timeline, tech, dependencies)
   - What's explicitly out of scope?

   Ask questions conversationally, not as a checklist. Skip questions the user already answered in their input.

3. **Generate the PRD** — Use the `craft-spec` skill to produce a structured PRD with:
   - Problem Statement
   - Goals & Success Metrics
   - Scope (in-scope and out-of-scope)
   - Proposed Solution
   - Key User Stories
   - Open Questions

4. **Review and Iterate** — Present the draft and offer:
   - "Want me to tighten the scope?"
   - "Should I add more detail to any section?"
   - "Want me to draft the stakeholder announcement?"

## Principles

- Tight scope over vagueness — if something is ambiguous, call it out
- Non-goals weighted equally to goals
- Success metrics must be specific and measurable
- Flag assumptions so the user can validate them
- Suggest phasing when scope is large
