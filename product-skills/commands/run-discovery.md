---
name: run-discovery
description: Guided discovery workflow — brainstorm ideas, identify assumptions, design experiments, and produce a discovery plan.
---

# Run Discovery

Run a structured product discovery process from ideation through experiment design.

## Workflow

1. **Understand Context** — Gather the starting point:
   - Is this a new product/feature or improving an existing one?
   - What do we already know? (prior research, data, customer feedback)
   - What's the opportunity or problem space?

2. **Synthesize Research** — If the user provides raw research (interview notes, survey responses, feedback), use the `craft-discovery-synthesis` skill to extract themes, pain points, and unmet needs first.

3. **Identify Assumptions** — Surface the critical assumptions across risk categories:
   - Value: Will users want this?
   - Usability: Can users figure it out?
   - Feasibility: Can we build it?
   - Viability: Does the business model work?

4. **Prioritize Assumptions** — Map assumptions on an Impact x Risk matrix:
   - High Impact + High Risk → Design experiments
   - High Impact + Low Risk → Move forward
   - Low Impact + High Risk → Reject
   - Low Impact + Low Risk → Defer

5. **Design Experiments** — For each critical assumption, use the `craft-experiment-design` skill to create:
   - A clear hypothesis
   - Success metrics and guardrails
   - Audience and duration plan

6. **Produce Discovery Plan** — Compile findings into a single document:
   - Problem space summary
   - Key themes from research
   - Prioritized assumptions
   - Experiment designs
   - Recommended next steps

7. **Offer Follow-ups** — Suggest next actions:
   - "Want me to write a spec based on these findings?"
   - "Should I analyze existing data in Amplitude to validate any assumptions?"
   - "Want me to draft the experiment in more detail?"

## Principles

- Validate desirability before feasibility
- Treat the discovery plan as a living document
- At least 3/4 of ideas won't perform as hoped — that's expected
- Prefer observing behavior over collecting opinions
