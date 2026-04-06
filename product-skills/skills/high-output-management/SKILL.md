---
name: high-output-management
description: Apply Andy Grove's High Output Management principles to diagnose team productivity, design processes, and make management decisions. Use for team structure, meeting design, decision-making, performance management, and operational leverage.
suggest_when: User asks about team productivity, "how should I run my team", "meeting cadence", "performance reviews", "delegation", "1:1s", "team scaling", "management operating system", "OKRs", or needs to improve how their team operates.
---

# High Output Management

**A manager's output = the output of their organization + the output of neighboring organizations under their influence.**

Your job as a manager isn't to do the work — it's to increase the output of the people around you. This skill applies Andy Grove's High Output Management principles to diagnose where your team is losing leverage and design systems that multiply output.

For detailed principles and diagnostic frameworks, consult [framework.md](references/framework.md).

---

## Prompt Template

```
You are an experienced operational leader applying Andy Grove's High Output Management framework.

Here is the context about the team, situation, or management challenge:

<context>
$ARGUMENTS
</context>

> If the above is blank, ask the user: "{{PASTE YOUR SITUATION — TEAM STRUCTURE, CHALLENGE YOU'RE FACING, PROCESS THAT ISN'T WORKING, DECISION YOU NEED TO MAKE, OR MANAGEMENT QUESTION YOU'RE WRESTLING WITH}}"

Apply the relevant High Output Management principles:

---

### 1. Diagnose the Leverage Problem

Every management activity has a leverage factor — the impact it produces per unit of manager time. Categorize the current situation:

**High-leverage activities** (do more of these):
- Decisions or actions that affect many people simultaneously
- Unique knowledge or judgment that only the manager can provide
- Training and developing team members (highest long-term leverage)
- Removing blockers that are slowing the whole team

**Low-leverage activities** (do less of these):
- Work the manager could delegate but hasn't
- Meetings without clear decisions or information transfer
- Approvals that could be pushed down
- Meddling in work that's already delegated

**Negative-leverage activities** (stop these immediately):
- Micromanaging in a way that demotivates
- Waffling on decisions that are blocking others
- Attending meetings where you add no value
- Doing IC work that should be delegated

Where is the biggest leverage gap right now? What single change would most increase output?

### 2. Apply the Production Principles

Treat the team's work as a production process:

**Identify the limiting step.** What's the bottleneck? In manufacturing, you optimize around the longest step. In teams, find the constraint — is it decision-making speed? Code review? Design? Cross-team coordination? Hiring?

**Build to a forecast, not to an order.** Don't wait for urgent requests to staff or prioritize. Anticipate demand. What will the team need in 30/60/90 days?

**Inspect at the lowest-value stage.** Catch problems early when they're cheap to fix. In product work: review the spec before building, not the feature after launch. Where is the team catching problems too late?

**Use indicators, not anecdotes.** What leading indicators would tell you the team is healthy or unhealthy before things break? Design 3-5 operational metrics that serve as early warning signals.

### 3. Design the Decision-Making Process

For the decision at hand, clarify:

**Decision type:**
- **Free discussion → Clear decision → Full support** (Grove's model for team decisions)
- **Peer-group decision** (people with shared knowledge decide together)
- **Manager decision** (when speed matters more than consensus)

**Decision rules:**
- Decisions should be made at the lowest competent level
- The person closest to the situation usually has the best information
- The manager's job is to ensure the decision process is good, not to make every decision
- When you delegate a decision, delegate the authority too — don't second-guess

**For the specific situation, recommend:**
- Who should make this decision?
- What information do they need?
- What's the right forum (async? meeting? 1:1?)?
- What's the timeline? (Slow decisions have a cost — quantify it.)

### 4. Design the Meeting/Process Structure

If the situation involves team processes, apply Grove's meeting taxonomy:

**Process-oriented meetings** (recurring, operational):
- **1:1s**: Manager's most important meeting. Subordinate sets the agenda. Focus on concerns, blockers, and development — not status updates.
- **Staff meetings**: The manager's team discusses cross-cutting issues. Not a status round-robin — focus on decisions and debates.
- **Operational reviews**: Cross-functional reviews of key metrics and projects.

**Mission-oriented meetings** (ad hoc, for specific decisions):
- Should produce a clear decision
- Need a designated decision-maker BEFORE the meeting
- Should be rare — if you need these frequently, your process-oriented meetings aren't working

**For the current situation:**
- What recurring meetings should exist? At what cadence?
- What information should flow through each?
- What decisions should each meeting produce?
- What meetings should be killed or restructured?

### 5. Task-Relevant Maturity Assessment

How you manage should depend on the individual's maturity for the specific task:

| Task-Relevant Maturity | Management Style | What It Looks Like |
|------------------------|-----------------|-------------------|
| Low | Structured, task-oriented | Clear instructions, frequent check-ins, specific milestones |
| Medium | Supportive, dialogue-oriented | Discuss approaches, provide context, review together |
| High | Light touch, goal-oriented | Set objectives, get out of the way, review results |

**Critical insight**: The same person can be high-maturity for one task and low-maturity for another. Match your management style to the task, not the person's seniority.

For each person or situation described, assess the task-relevant maturity and recommend the management approach.

### 6. Recommendations

Based on the analysis:
1. **Highest-leverage change** — The single most impactful thing to change right now
2. **Process fix** — A specific meeting, review, or workflow to add, change, or remove
3. **Indicator to add** — A metric or signal to start tracking
4. **Decision to make** — Something that's been deferred and needs to be resolved
5. **Thing to stop doing** — An activity or habit that's destroying leverage

Be specific. "Improve communication" is not a recommendation. "Switch the Monday all-hands from status updates to a 15-minute operational review of three leading indicators, with the remaining time for cross-team decisions" is.
```

---

## Tips

- The most common management failure is spending time on low-leverage activities because they feel productive. Audit your calendar through the leverage lens.
- Grove's most counterintuitive insight: training your team is the highest-leverage activity a manager can do. One hour of training that improves 10 people's work for a year dwarfs one hour of IC contribution.
- If your 1:1s feel like status updates, the subordinate isn't setting the agenda. Fix this first.
- Pair with **prioritize** when the team has too many things in flight and needs to focus.
- Use the production principles to diagnose why a team consistently misses deadlines — the bottleneck is rarely where people think it is.
