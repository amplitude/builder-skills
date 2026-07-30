---
name: jobs-to-be-done
description: "Analyze customer research, interview notes, or feature requests to uncover functional, social, and emotional jobs driving behavior, then prioritize by intensity, frequency, and underservedness. Use when investigating churn, switching behavior, JTBD analysis, customer motivation, or unmet needs."
---

# Jobs to Be Done

**Uncover the jobs driving customer behavior -- not just what they say they want.**

Analyzes customer research, interviews, churn data, or feature requests through the JTBD lens to surface the functional, social, and emotional jobs that drive adoption, retention, and churn. Separates evidence from inference and flags where more research is needed.

---

## Prompt Template

```
Analyze the following through the Jobs to Be Done framework.

<context>
$ARGUMENTS
</context>

> If the above is blank, ask the user: "{{PASTE YOUR CUSTOMER RESEARCH, INTERVIEW NOTES, CHURN DATA, FEATURE REQUESTS, OR PRODUCT DESCRIPTION}}"

Work through these steps:

### 1. Extract Jobs

For each job identified, classify it and provide evidence:

**Functional Jobs** -- Tasks customers are trying to accomplish.
- What is the specific workflow today?
- Measure by: time savings, effort reduction, accuracy, throughput

**Social Jobs** -- How customers want to be perceived.
- What professional identity or status are they projecting?
- These are often unspoken but drive adoption and willingness to pay

**Emotional Jobs** -- Feelings customers want to achieve or avoid.
- What anxieties does the current approach create?
- Often the strongest loyalty driver but least articulated

For each job: cite the specific evidence from the input (direct quotes where available) or explicitly mark it as an inference with your confidence level (high/medium/low).

### 2. Map Pains and Gains

For each prioritized job:

| Dimension | Current Pains | Desired Gains |
|-----------|--------------|---------------|
| Obstacles | What prevents completion? | What would exceed expectations? |
| Waste | Time, money, effort lost? | Quantifiable efficiency improvement? |
| Errors | What mistakes does the current approach cause? | New capabilities unlocked? |
| Gaps | Where do existing solutions fall short? | Quality-of-life improvements? |

### 3. Prioritize

Rank jobs using this matrix:

| Job | Intensity (1-5) | Frequency (1-5) | Underserved (1-5) | Priority Score | Evidence Basis |
|-----|-----------------|-----------------|-------------------|----------------|----------------|
| ... | How strongly felt? | How often? | How poorly served today? | Sum | Quote/data or inference? |

Flag any job ranked highly on inference alone -- these need validation.

### 4. Implications

Based on the prioritized jobs:
- **Build:** What should we build or change to address the top jobs?
- **Position:** How should we message or position the product against these jobs?
- **Ignore:** Which jobs should we explicitly NOT pursue, and why?
- **Validate:** Where is the evidence thin? What specific research would fill the gaps?

> **Checkpoint:** Before presenting implications, verify that each recommendation traces back to a specific prioritized job with supporting evidence. Recommendations without evidence chains get flagged.
```

---

## Tips

- The classic test: customers don't want a quarter-inch drill -- they want a quarter-inch hole. Keep pushing past the feature request to the underlying job.
- Social and emotional jobs are where real differentiation lives. Functional jobs get commoditized.
- Pair with **craft-discovery-synthesis** when you have raw interview transcripts to process first.
- If you only have feature requests (not research), this skill surfaces the assumptions you're making -- which tells you what to validate.
