---
name: amazon-working-backwards
description: Write a PR/FAQ for a product idea using Amazon's Working Backwards process. Start from the customer press release and work backward to what needs to be built. Use when validating whether an idea is worth building before committing to a spec.
suggest_when: User has a product idea and wants to pressure-test it, says "PR/FAQ", "working backwards", "write the press release first", "is this worth building", or wants to crystallize a vague idea into a compelling customer narrative before speccing it out.
---

# Amazon Working Backwards

**Start from the customer. Write the press release before you write the code.**

You have an idea — maybe a new product, a major feature, or a strategic bet. Before you invest in specs, designs, and engineering, this skill forces you to articulate what you're building, who it's for, and why it matters — all from the customer's perspective. If you can't write a compelling press release, the idea isn't ready.

---

## Prompt Template

```
You are an experienced product leader applying Amazon's Working Backwards process.

Here is the product idea, feature concept, or strategic bet:

<context>
{{PASTE YOUR IDEA — ROUGH NOTES, SLACK THREADS, BRAINSTORM OUTPUT, OR A ONE-LINER}}
</context>

Write a PR/FAQ document using this structure:

### PRESS RELEASE

**Heading:** [Product name] — a clear, customer-facing name (not an internal codename).

**Subheading:** One sentence describing who the customer is and what benefit they get.

**Date & City:** [Plausible future launch date and location]

**Opening Paragraph:** Summarize the product and its benefit in 3-4 sentences. Lead with the customer problem, then the solution. Write as if this is a real press release going to the public — no internal jargon.

**Problem Paragraph:** Describe the customer's current pain in vivid, specific terms. What are they doing today? Why does it suck? Use concrete scenarios, not abstract statements. The reader should feel the pain.

**Solution Paragraph:** Describe how the product solves the problem. Focus on the customer experience, not the technology. What can they do now that they couldn't before? How does their life or workflow change?

**Quote from Company Leader:** A quote from a VP or CEO explaining why this matters strategically. This forces you to articulate the "why now" and the company's point of view.

**How It Works:** 3-5 sentences describing the customer experience. Walk through the happy path in simple terms. A customer should be able to read this and understand what they'd actually do.

**Quote from a Customer:** A fictional but realistic quote from a target customer describing the benefit in their own words. This forces you to think about what success sounds like from the outside.

**Call to Action:** How customers can get started. One sentence.

### FREQUENTLY ASKED QUESTIONS

**External FAQs** (customer-facing — 4-6 questions):
Answer the questions a customer would ask after reading the press release. Cover: pricing/availability, how it compares to alternatives, who it's for (and who it's NOT for), data/privacy, and the "yeah but..." objections.

**Internal FAQs** (team-facing — 4-6 questions):
Answer the hard questions your leadership team, engineers, and stakeholders would ask. Cover: market size and business case, technical feasibility and timeline, dependencies and risks, why now vs. later, what we're NOT building, and how we'll measure success.

### WORKING BACKWARDS ASSESSMENT

After writing the PR/FAQ, step back and evaluate:

1. **Clarity test** — Can a non-technical person read the press release and understand what the product does? If not, the idea is still fuzzy.
2. **Differentiation test** — Could a competitor's product fill in the blanks? If yes, the unique value isn't sharp enough.
3. **Customer test** — Would the fictional customer actually say that quote? If it sounds forced, the benefit isn't real enough.
4. **Internal FAQ test** — Are the internal answers convincing? Flag any where you're hand-waving — those are your biggest risks.
5. **Kill test** — Based on this PR/FAQ, should this idea move forward, be reworked, or be killed? Make a call.

Rules:
- Write the press release at a 6th-grade reading level. If you need jargon, the idea isn't clear enough.
- The problem paragraph is the most important section. If the pain isn't vivid and specific, everything downstream will be vague.
- Don't hedge. "This might help some users sometimes" is a sign the idea isn't ready. Commit to a strong claim and let the FAQs address the nuance.
- Internal FAQs should include at least one question you don't have a good answer to yet — that's the honest part.
- The assessment should be brutally honest. A PR/FAQ that reveals a weak idea is more valuable than one that papers over the cracks.
```

---

## Tips

- The PR/FAQ is a thinking tool, not a marketing artifact. The goal is to expose fuzzy thinking before you invest in building.
- If you struggle to write the problem paragraph, you probably don't understand the customer well enough. Run **jobs-to-be-done** or **craft-discovery-synthesis** first.
- If the internal FAQs reveal too many unanswered questions, use **run-discovery** to design experiments that close the gaps.
- Once the PR/FAQ is solid, feed it into **craft-spec** to turn it into a buildable PRD.
- For high-stakes bets, run **pre-mortem** on the PR/FAQ to stress-test the risks the internal FAQs might have missed.
