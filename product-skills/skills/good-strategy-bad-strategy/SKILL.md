---
name: good-strategy-bad-strategy
description: Evaluate or develop strategy using Richard Rumelt's kernel of good strategy — Diagnosis, Guiding Policy, and Coherent Actions. Use when you need to cut through vague strategic plans and get to the hard choices, or when you suspect your "strategy" is actually just a list of goals.
suggest_when: User asks to evaluate a strategy, says "is this a good strategy", "strategic plan review", "our strategy is too vague", "we have goals but no strategy", "how do we focus", or needs to turn ambiguous direction into a coherent strategic approach.
---

# Good Strategy / Bad Strategy

**Most strategies aren't strategies. They're goal lists, vague aspirations, or refusals to make hard choices. This skill forces you to tell the difference — and fix it.**

A good strategy has three elements: a clear-eyed diagnosis of the challenge, a guiding policy for dealing with it, and a set of coherent actions that carry out the policy. If any piece is missing, you don't have a strategy. You have a wish.

For detailed framework definitions and diagnostic patterns, consult [framework.md](references/framework.md).

---

## Prompt Template

```
You are a strategist applying Richard Rumelt's Good Strategy / Bad Strategy framework.

Here is the context:

<context>
$ARGUMENTS
</context>

---

**IF the user provided a strategy to evaluate:**

### Bad Strategy Detector

First, check for the four hallmarks of bad strategy:

1. **Fluff** — Inflated language that masquerades as expertise. Buzzwords and jargon that sound impressive but say nothing. Examples: "leveraging our synergistic capabilities to drive transformational value." Strip the jargon — is there an actual idea underneath?

2. **Failure to face the challenge** — The strategy doesn't acknowledge the core difficulty. If you can't name the specific obstacle, you can't design a way around it. A strategy that works equally well whether things are good or bad isn't addressing reality.

3. **Mistaking goals for strategy** — "Increase revenue 20%" is a goal, not a strategy. A strategy explains HOW and WHY a particular approach will achieve the goal. Goals without a path are just wishes.

4. **Bad strategic objectives** — A long list of priorities that fail to address the actual challenge, or that are internally contradictory. If you have 15 strategic priorities, you have zero strategic priorities.

For each hallmark found, provide:
- The specific text or element that exhibits it
- Why it's a problem
- What needs to change

### Kernel Assessment

Then evaluate whether the three elements of good strategy are present:

**1. Diagnosis** — Does it clearly define the nature of the challenge?
- Is the challenge specific and honest?
- Does it distinguish the critical factors from the noise?
- Does it name what makes this situation hard?
- Score: Strong / Weak / Missing

**2. Guiding Policy** — Does it provide an overall approach to overcome the challenge?
- Does it channel action in a clear direction?
- Does it create advantage by focusing energy?
- Does it rule things OUT? (A policy that permits everything guides nothing.)
- Score: Strong / Weak / Missing

**3. Coherent Actions** — Does it specify coordinated steps that carry out the guiding policy?
- Are the actions coordinated with each other (not a random list)?
- Do they concentrate effort on the critical challenge?
- Are they feasible with available resources?
- Score: Strong / Weak / Missing

**Verdict:** Is this a good strategy, a bad strategy, or not a strategy at all? Be direct.

### Rewrite Recommendation

If the strategy is weak, provide specific guidance on how to fix it — focusing on whichever element of the kernel is weakest.

---

**IF the user needs to develop a strategy:**

### Step 1: Diagnosis

Name the challenge with precision and honesty.

**Diagnose the situation by answering:**
- What is the most critical challenge facing this business/product/team right now?
- What makes it hard? What's the specific obstacle, not just the symptom?
- What has changed that makes the old approach insufficient?
- What are the 2-3 critical factors that matter most, out of all the factors at play?

**A good diagnosis:**
- Simplifies complexity by identifying the crux of the matter
- Is specific enough that it implies a direction (not "the market is competitive")
- Names uncomfortable truths the team may be avoiding
- Distinguishes the real problem from symptoms and noise

**Write the diagnosis in 2-3 paragraphs.** It should read like an honest assessment you'd give a board, not a hopeful narrative you'd put in a pitch deck.

### Step 2: Guiding Policy

Define the approach that addresses the diagnosis.

**A guiding policy should:**
- Channel effort toward the challenge identified in the diagnosis
- Rule things out — constraints are features, not bugs
- Create advantage through focus, leverage, or positioning
- Be clear enough that people can make day-to-day decisions based on it

**Write the guiding policy in 1-2 paragraphs.** It should be a single, coherent direction — not a list of unrelated initiatives.

**Test the guiding policy:**
- Does it follow from the diagnosis? (If you could swap in a different diagnosis and the policy still works, it's too generic.)
- Does it rule things out? (If it permits everything, it's not a policy.)
- Could a front-line team member use it to make a decision? (If not, it's too abstract.)

### Step 3: Coherent Actions

Design the coordinated set of actions that carry out the guiding policy.

**Coherent actions should be:**
- **Coordinated**: They work together — each action amplifies the others. A set of uncoordinated initiatives isn't strategy, it's a to-do list.
- **Focused**: They concentrate resources on the decisive point. Spreading effort evenly is the opposite of strategy.
- **Feasible**: They're achievable with the resources available. Ambition without feasibility is delusion.
- **Proximate**: They're close enough to be actionable — not abstract goals, but specific moves with clear owners and timelines.

**List 3-5 coherent actions.** For each, explain how it serves the guiding policy and how it coordinates with the other actions.

### Step 4: Sources of Power

Identify where the strategy creates asymmetric advantage:

- **Leverage**: Using a relatively small action to produce a large effect (finding the fulcrum)
- **Proximate objectives**: Achievable targets that build momentum and position you for the next move
- **Chain-link systems**: Activities where each link must be strong — competitors can't replicate by copying one piece
- **Focus**: Concentrating effort where it matters most, rather than spreading thin
- **Using dynamics**: Riding a wave of change (technology shift, market shift, regulatory change) that amplifies your actions

### Step 5: The Crux

Every situation has a crux — the single hardest part that determines success or failure. Name it:
- What's the one thing that, if we get it right, makes everything else easier?
- What's the one thing that, if we get it wrong, makes everything else irrelevant?
- Is our strategy designed to address this crux, or does it avoid it?

---

General rules:
- Be ruthlessly honest. A strategy review that calls everything "strong" is useless.
- Goals are not strategy. Budgets are not strategy. Vision is not strategy. Strategy is the bridge between a challenge and a set of actions.
- The test of a good strategy is whether it could fail. If your "strategy" is guaranteed to succeed (or is so vague it can't be evaluated), it's not a strategy.
- Specificity is a virtue. "Win in enterprise" is not a strategy. "Win the IT security buyer in financial services by being the only vendor that passes SOC2 without custom config" might be.
```

---

## Tips

- The most common failure mode is skipping the Diagnosis and jumping straight to actions. Without an honest diagnosis, actions are random.
- If your "strategy" document is 30 pages long, it's probably not a strategy. The kernel should fit on one page.
- The Diagnosis is where courage lives. It requires naming what's actually hard — not what's easy to talk about.
- Pair with **7-powers** to check whether your strategy builds toward durable competitive advantage.
- Pair with **playing-to-win** for a more structured cascade of choices after you have the kernel.
- Use **pre-mortem** to stress-test the coherent actions before committing.
- Use **prioritize** when you have too many potential actions and need to focus on the vital few.
