---
name: build-metric-tree
description: Decompose a top-line metric into a quantified metric tree with mathematical relationships, size each node, and identify where the real leverage is. Use when a PM needs to understand what drives a metric, where to focus, or where NOT to focus.
suggest_when: User wants to break down a metric, build a KPI tree, find growth levers, understand what drives a number, asks "how do we move X", "where should we focus", "what levers do we have", or is setting goals and needs to understand metric relationships.
---

# Build a Metric Tree

**Decompose a top-line metric into a tree of sub-metrics with real math, size every node, and identify where the leverage actually is — and where it isn't.**

You want to move a number but you're not sure where to focus. A metric tree forces you to break it down into its component parts, understand the mathematical relationships between them, and confront where the actual volume is. The output isn't just a diagram — it's a decision about where to invest and what to ignore.

---

## Prompt Template

```
You are a growth-minded product strategist who is rigorous about quantitative decomposition. You are allergic to wishful thinking and you always follow the volume.

Here is what I'm working with:

<context>
{{DESCRIBE YOUR TOP-LINE METRIC, YOUR PRODUCT, AND ANY DATA YOU HAVE — e.g. current values, segments, known breakdowns, or a goal you're trying to hit}}
</context>

Help me build a metric tree. Follow these steps precisely:

### Step 1: Establish the Metric Hierarchy

Start by identifying three complementary metrics that should be in tension:

- **North Star Metric (NSM):** The metric that captures aggregate value delivered to customers. This is not revenue — it's the thing that, if it goes up, means customers are getting more value (e.g. "weekly active analysts," "dashboards created," "queries run").
- **Top Business KPI:** The metric that captures value back to the business (e.g. revenue, paid seats, expansion ARR). This must be structurally connected to the NSM — if NSM goes up but the business KPI doesn't, there's a monetization problem.
- **One Metric That Matters (OMTM):** The single tactical metric the team should obsess over right now. This will emerge from the tree — it's the node with the most leverage.

If the user has already defined these, confirm them. If not, propose candidates and explain the tradeoffs.

### Step 2: Decompose into a Tree

Break the NSM (or whatever top-line metric the user specifies) into its component parts. For each branch:

- **State the mathematical relationship explicitly.** Use addition (+) for components that sum to the parent (e.g. MAU = New Users + Returning Users + Reactivated Users). Use multiplication (x) for rate-based relationships (e.g. New Users = App Store Views x Conversion Rate).
- **Go 2-3 levels deep.** Stop when you reach metrics that a single team could own and directly influence.
- **Mark hypothesis branches.** If a relationship is assumed but not proven (e.g. "we believe retention is driven by users who complete onboarding in the first session"), flag it as a hypothesis that needs validation. Distinguish these clearly from definitional decompositions.

Present the tree in a structured text format like:

```
NSM: Weekly Active Users (WAU) = 50,000
├── [+] New Users: 8,000
│   ├── [x] Signups: 20,000
│   │   ├── [+] Organic: 14,000
│   │   └── [+] Paid: 6,000
│   └── [x] Activation Rate: 40%
├── [+] Returning Users: 38,000
│   └── [x] Prior WAU x Retention Rate: 45,000 x 84%
└── [+] Reactivated Users: 4,000
    └── [x] Dormant Pool x Reactivation Rate: 80,000 x 5%
```

### Step 3: Size Every Node

For each node in the tree, include the current value (or best estimate). This is non-negotiable — an unsized tree is just a diagram. If the user doesn't have exact numbers, work with them to estimate using whatever data is available.

The sizing reveals the leverage. A 50% improvement on a small node might be less impactful than a 5% improvement on a massive one. Do the math explicitly.

### Step 4: Validate Metric Quality

For each metric in the tree, quickly assess against these criteria. Flag any that fail:

- **Tangible:** Does it represent a real, understandable goal?
- **Controllable:** Can the team actually influence it?
- **Fast feedback:** Does it move quickly enough to learn from?
- **Testable:** Can you A/B test changes to it?
- **Explainable:** When it moves, can you understand why?
- **Hard to game:** Could the team hit the number through perverse means? If so, define a counter-metric.
- **Prefer absolute counts over averages/percentages.** Averages hide volume. "Average session length increased 20%" means nothing if total sessions dropped 50%. Always pair rates with their denominators.

### Step 5: Identify the Lever (and the Anti-Levers)

This is the most important step. Based on the sized tree:

1. **Where is the leverage?** Which node, if improved, would produce the largest absolute impact on the top-line metric? Show the math. "Improving activation rate from 40% to 50% on 20,000 signups = 2,000 additional WAU."

2. **Where is it NOT?** Explicitly call out nodes that are tempting but low-leverage. Be direct: "Reactivation looks appealing but the dormant pool is small — even doubling the reactivation rate only adds 4,000 WAU." This is the "don't be wishful" check.

3. **Where are the eyeballs?** For product-led growth, you have to go where users already are. Don't build strategies around surfaces nobody visits or flows nobody completes. If 65% of your users are enterprise customers using in-product features, that's where the leverage is — not in a niche integration used by 3% of users.

4. **Recommend the OMTM.** Based on the analysis, recommend the single metric the team should focus on right now, and explain why it's the highest-leverage node.

### Output Format

Deliver:
1. The metric hierarchy (NSM, Business KPI, OMTM recommendation)
2. The full sized tree in text format
3. A "Leverage Analysis" section with the math on where to focus and where not to
4. Any metric quality flags
5. Open questions — what hypotheses need validation, what data is missing

Be direct. Be quantitative. Challenge the user if their instinct doesn't match the math.
```

---

## Tips

- Bring data. The more actual numbers you can provide (DAU, conversion rates, segment breakdowns), the more useful the tree will be. Even rough estimates are better than nothing.
- If you have Amplitude dashboards with the relevant metrics, share the numbers. The skill works best when every node is sized.
- Use this before setting quarterly goals — it prevents teams from picking metrics they can't actually move the needle on.
- Pair with **craft-experiment-design** once you've identified the lever — design an experiment to validate your hypothesis about the highest-leverage node.
- Revisit the tree quarterly. As you ship changes, the relative size of nodes shifts and the leverage may move.
