---
name: high-output-management
description: "Diagnose managerial leverage gaps and design specific process changes using Andy Grove's High Output Management framework. Use when optimizing team structure, meeting cadence, 1:1s, delegation, OKRs, performance reviews, or decision-making processes."
---

# High Output Management

**A manager's output = the output of their organization + the output of neighboring organizations under their influence.**

Applies Andy Grove's framework to diagnose where a team is losing leverage and prescribe specific process changes. For detailed principles, see [framework.md](references/framework.md).

---

## Prompt Template

```
Apply Andy Grove's High Output Management framework to diagnose and fix the situation below.

<context>
$ARGUMENTS
</context>

> If the above is blank, ask the user: "{{DESCRIBE YOUR SITUATION: team structure, process that isn't working, management challenge, or decision you need to make}}"

Work through these steps. Reference the framework in references/framework.md for detailed principles.

### 1. Diagnose the Leverage Gap

Categorize the user's current activities into high-leverage (affect many people, unique manager judgment, training), low-leverage (could delegate, no-decision meetings, unnecessary approvals), and negative-leverage (micromanaging, waffling on decisions, doing IC work).

Name the single biggest leverage gap and the one change that would most increase output.

### 2. Find the Bottleneck

Identify the limiting step in the team's production process (decision-making speed? code review? hiring? cross-team coordination?). Recommend how to optimize around it, not around non-constraints.

Assess: where is the team catching problems too late? Recommend earlier inspection points.

Propose 3-5 leading indicators that would surface problems before they break.

### 3. Design the Decision Process

For the specific situation, recommend:
- Who should decide (lowest competent level, closest to information)
- What forum (async, meeting, 1:1)
- What timeline (quantify the cost of delay)
- Decision type: free discussion -> clear decision -> full support, peer-group decision, or manager decision

### 4. Fix the Meeting Structure

If relevant, prescribe specific changes:
- What recurring meetings should exist, at what cadence, producing what decisions
- What meetings should be killed or restructured
- Whether 1:1s have the right structure (subordinate sets agenda, not status updates)

### 5. Assess Task-Relevant Maturity

For each person or role mentioned, assess TRM for the specific task (not their seniority) and recommend the matching management style: structured/task-oriented (low TRM), supportive/dialogue (medium), or light-touch/goal-oriented (high).

> **Checkpoint:** Confirm the leverage gap diagnosis with the user before prescribing changes. A wrong diagnosis leads to wrong fixes.

### 6. Prescribe Changes

Deliver exactly five recommendations:
1. **Highest-leverage change** -- the single most impactful thing to change now
2. **Process fix** -- a specific meeting, review, or workflow to add, change, or remove
3. **Indicator to add** -- a metric or signal to start tracking
4. **Decision to make** -- something deferred that needs resolution
5. **Thing to stop doing** -- an activity destroying leverage

Be specific. "Improve communication" is not a recommendation. "Switch the Monday all-hands from status updates to a 15-minute operational review of three leading indicators, with remaining time for cross-team decisions" is.
```

---

## Tips

- The most common management failure is spending time on low-leverage activities because they feel productive. Audit calendars through the leverage lens.
- If 1:1s feel like status updates, the subordinate isn't setting the agenda. Fix this first.
- Pair with **prioritize** when the team has too many things in flight.
