# High Output Management: Detailed Framework Reference

Based on *High Output Management* by Andrew S. Grove (Intel).

## Core Principle

A manager's output = the output of their organization + the output of neighboring organizations under their influence. Everything a manager does should be evaluated by whether it increases this aggregate output.

## The Production Analogy

Grove treats all knowledge work as a production process. The same principles that optimize a factory optimize a team.

### Key Production Concepts

**1. The Limiting Step**
Every production process has a bottleneck — the step that constrains total throughput. Optimizing any step that isn't the bottleneck doesn't improve output.

Applied to teams:
- If code review is the bottleneck, writing more code faster doesn't help
- If decision-making is the bottleneck, better execution doesn't help
- If hiring is the bottleneck, process improvements don't help
- Find the constraint first, then optimize around it

**2. Build to Forecast**
Don't wait for demand to appear before starting production. In knowledge work: don't wait for the crisis to hire, plan, or build infrastructure. Anticipate needs 30-90 days out.

**3. Inspect at the Lowest-Value Stage**
Quality control should happen as early as possible, when defects are cheapest to fix.

Applied to product development:
- Review the problem statement before writing the spec
- Review the spec before writing code
- Review the design before building the UI
- Review the experiment plan before running the experiment
- The later you catch a problem, the more expensive it is

**4. Use Indicators**
You can't manage what you don't measure. But you can drown in metrics. Choose indicators that:
- Are leading, not lagging (predict problems before they happen)
- Pair quantity with quality (output volume + defect rate)
- Compare actual vs. forecast (trend, not snapshot)
- Are visible (everyone can see them, not buried in a dashboard)

Good indicator sets:
- **Pairing indicators**: Measure output AND quality. Lines of code + bug rate. Features shipped + customer satisfaction. Hires made + 6-month retention.
- **Leading indicators**: Pipeline health, sprint velocity trend, team morale signals, backlog growth rate.
- **Black-box indicators**: When you can't see inside a process, measure inputs and outputs. If inputs are good and outputs are bad, something inside is broken.

## Leverage

### The Leverage Equation

Manager's output = sum of (leverage × activity)

Leverage can be:
- **Positive and high**: Actions that affect many people or have lasting impact
- **Positive and low**: Actions that help one person temporarily
- **Negative**: Actions that slow people down, demotivate, or create confusion

### High-Leverage Activities

1. **Training**: One hour of training that improves 10 people's output by 1% for a year = massive leverage. Grove considered this the single highest-leverage activity.

2. **Decisions that unblock many people**: Making a call that 5 people are waiting on. Speed of decision matters — a fast 80% decision often beats a slow 95% decision.

3. **Performance reviews**: When done well, they clarify expectations and improve future output. When done poorly (or skipped), they're a missed high-leverage opportunity.

4. **Process design**: Creating a process that scales. One hour designing a good onboarding process saves hundreds of hours over time.

5. **Information sharing**: Unique information that changes how people make decisions. A 5-minute message that prevents a team from going down the wrong path.

### Low-Leverage Activities (Manager Traps)

1. **Attending meetings where you add no value**: If you're not providing unique information, making a decision, or learning something critical — skip it.

2. **Doing IC work that should be delegated**: Often feels productive but has opportunity cost.

3. **Status collection**: If you need to collect status in a meeting, your indicators are bad.

4. **Approval queues**: If decisions pile up waiting for your approval, you're the bottleneck.

### Negative-Leverage Activities

1. **Waffling**: Delaying a decision when others are blocked. The cost of delay often exceeds the cost of being wrong.

2. **Meddling**: Intervening in delegated work without reason. Destroys motivation and signals distrust.

3. **Micromanaging high-maturity people**: Treating experienced people like beginners wastes their capability and your time.

## Meetings

### Grove's Meeting Taxonomy

**Process-Oriented Meetings** (recurring, structured):

| Meeting | Purpose | Cadence | Key Principle |
|---------|---------|---------|--------------|
| 1:1 | Subordinate raises concerns, manager coaches | Weekly or biweekly | Subordinate sets the agenda — it's their meeting |
| Staff meeting | Team discusses cross-cutting issues, makes decisions | Weekly | Not a status round-robin — focus on 2-3 real issues |
| Operational review | Cross-functional review of key metrics and projects | Monthly or quarterly | Present data, debate, decide — not present and admire |

**Mission-Oriented Meetings** (ad hoc):
- Called to make a specific decision
- Must have a designated decision-maker before the meeting starts
- Should produce a clear output (decision, plan, assignment)
- If you need these frequently, your process meetings aren't working

### Meeting Discipline

- Every meeting needs a clear purpose: information sharing, discussion, or decision
- The decision-maker must be identified before the meeting
- Meetings should produce outputs — decisions, action items, or documented knowledge
- If a meeting doesn't produce output, it's a waste of leverage

## Task-Relevant Maturity (TRM)

The most important management concept in the book. How you manage someone should depend on their experience with the specific task — not their overall seniority.

### The TRM Model

| TRM Level | Manager's Approach | Communication | Check-in Frequency |
|-----------|-------------------|---------------|-------------------|
| Low | Structured, detailed direction | What, when, how — explicitly | Daily or more |
| Medium | Supportive, two-way dialogue | Discuss approaches, share context | 2-3 times per week |
| High | Goal-oriented, light touch | Set objectives, review results | Weekly or less |

### Critical Nuances

- **TRM is task-specific, not person-specific.** A senior engineer is high-TRM for coding but may be low-TRM for cross-team negotiation. Adjust per task.
- **TRM changes over time.** As someone grows into a task, decrease structure. If they move to a new domain, temporarily increase it.
- **Matching matters more than either extreme.** Over-managing a high-TRM person demotivates them. Under-managing a low-TRM person sets them up for failure. Both are manager failures.

## Decision-Making

### Grove's Decision Framework

1. **Free discussion**: All relevant viewpoints aired, including dissent
2. **Clear decision**: Someone makes the call (not consensus — a decision-maker)
3. **Full support**: Once decided, everyone commits — even those who disagreed

### Decision Principles

- Decisions should be made at the lowest competent level (closest to the information)
- The manager's job is to ensure good decision process, not to make every decision
- Speed matters — a fast decision with 70% confidence often beats a slow decision with 95% confidence
- Revisit decisions when new information arrives, not when the old decision becomes uncomfortable

### When the Manager Should Decide

- When speed is critical and debate is slowing things down
- When the decision affects multiple teams and no single owner exists
- When the team is stuck in analysis paralysis
- When the stakes are high enough that the manager's judgment is the tiebreaker

## Performance Reviews

Grove considered performance reviews the highest-leverage single event in management — and the most commonly botched.

### Grove's Principles for Reviews

1. **Assess output, not activity.** Did they produce results, or were they just busy?
2. **Rate against objectives, not against each other.** Did they hit the targets that were set?
3. **Deliver one key message.** If the person remembers only one thing, what should it be?
4. **Be specific.** "Good job" is not feedback. "The migration plan you designed saved two weeks of engineering time because you anticipated the schema conflict" is feedback.
5. **Address the gap between where they are and where they could be.** The review should make them better, not just validate them.

## Planning and OKRs

Grove was an early champion of what became OKRs (Objectives and Key Results) at Intel.

### Grove's Planning Principles

- **Start with the output.** What do you want to be different at the end of the quarter?
- **Work backward to activities.** What must happen to produce that output?
- **Focus on the vital few.** 3-5 objectives max. If everything is a priority, nothing is.
- **Key Results must be measurable.** "Improve onboarding" is an objective. "Increase 7-day activation from 40% to 55%" is a key result.
- **Set stretch goals.** Hitting 70% of an ambitious target is often better than hitting 100% of a conservative one.
