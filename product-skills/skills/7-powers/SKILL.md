---
name: 7-powers-analysis
description: Analyze a business, product, or feature using Hamilton Helmer's 7 Powers framework to assess competitive advantage and strategic durability. Use when the user asks about competitive moats, strategic positioning, power analysis, defensibility, competitive advantage, or "7 Powers".
---
**User context:** $ARGUMENTS

> If the above is blank, ask the user to share the relevant context before proceeding.


# 7 Powers Competitive Analysis

Apply Hamilton Helmer's 7 Powers framework to evaluate whether a business, product, or feature possesses durable competitive advantages ("Powers") that enable persistent differential returns.

For detailed definitions, attributes, and examples of each Power, consult [framework.md](references/framework.md).

## Workflow

1. **Clarify the subject**: Identify what's being analyzed — a company, product line, or specific feature. Ask the user if ambiguous.

2. **Scan all 7 Powers**: Evaluate the subject against each Power:
   - Scale Economies
   - Network Economies
   - Counter-Positioning
   - Switching Costs
   - Branding
   - Cornered Resource
   - Process Power

3. **Assess each Power** using three dimensions:
   - **Present?** Does the subject currently possess this Power?
   - **Strength**: How strong is the barrier? (None / Weak / Moderate / Strong)
   - **Durability**: How long will it last? (Fragile / Moderate / Durable)

4. **Identify Power combinations** that reinforce each other (e.g., Scale Economies + Network Effects create growth loops).

5. **Recommend strategic actions**: What should the business do to strengthen, develop, or defend its Powers?

## Output Template

Use this structure for the analysis:

```markdown
# 7 Powers Analysis: [Subject]

## Executive Summary
[1-2 sentences on overall strategic position and key Powers identified]

## Power Assessment

| Power | Present? | Strength | Durability | Notes |
|-------|----------|----------|------------|-------|
| Scale Economies | Yes/No | None-Strong | Fragile-Durable | [brief rationale] |
| Network Economies | Yes/No | None-Strong | Fragile-Durable | [brief rationale] |
| Counter-Positioning | Yes/No | None-Strong | Fragile-Durable | [brief rationale] |
| Switching Costs | Yes/No | None-Strong | Fragile-Durable | [brief rationale] |
| Branding | Yes/No | None-Strong | Fragile-Durable | [brief rationale] |
| Cornered Resource | Yes/No | None-Strong | Fragile-Durable | [brief rationale] |
| Process Power | Yes/No | None-Strong | Fragile-Durable | [brief rationale] |

## Deep Dive: Key Powers
[For each Power rated Moderate or Strong, provide 2-3 paragraphs covering:
- Evidence supporting the assessment
- How this Power creates a barrier for competitors
- Risks or vulnerabilities to this Power]

## Power Synergies
[Identify reinforcing combinations between Powers the subject holds]

## Strategic Recommendations
1. **Strengthen**: [How to deepen existing Powers]
2. **Develop**: [Which new Powers could be built, and how]
3. **Defend**: [What threatens current Powers and how to protect them]
```

## Adapting the Analysis

**For a new feature or product decision**: Focus on Power Reinforcement (does this strengthen existing Powers?), Power Expansion (does it create new Powers?), and Power Defense (does it protect against threats?).

**For competitive threat assessment**: Focus on which Powers competitors possess, which emerging competitors are developing, and how existing Powers could be neutralized.

**For early-stage companies**: Focus on Power Potential — which Powers could form given the business model, and what's the timeline for development. Use the Power Progression lens: Potential → Realization → Persistent Returns.

## Example

**User**: "Analyze Figma's competitive position"

**Key findings would include**:
- **Network Economies** (Strong/Durable): Multi-player collaboration creates direct network effects; plugin ecosystem creates indirect effects
- **Switching Costs** (Moderate/Durable): Team design systems, component libraries, and workflow integrations create procedural lock-in
- **Counter-Positioning** (Moderate/Fragile): Browser-native approach initially counter-positioned against Adobe's desktop model, but this advantage diminished post-acquisition
- **Synergy**: Network Economies + Switching Costs reinforce each other — more team adoption deepens both
