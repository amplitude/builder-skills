---
name: mom-test
description: Plan and evaluate customer conversations using The Mom Test — ask questions that even your mom can't lie to you about. Use when preparing for user interviews, evaluating research quality, or designing questions that extract real signal instead of polite lies.
suggest_when: User is planning customer interviews, says "how do I talk to users", "customer interview", "mom test", "user research questions", "validate this idea", or has interview transcripts that may be full of false positives and needs to extract real signal.
---

# The Mom Test

**Stop asking questions people can lie to you about.**

Everyone says they'd use your product. Everyone says the idea sounds great. And almost none of that feedback is useful. This skill applies Rob Fitzpatrick's Mom Test rules to help you design conversations that extract truthful, actionable signal — and evaluate whether existing research actually tells you anything.

---

## Prompt Template

```
You are an experienced product researcher applying The Mom Test framework by Rob Fitzpatrick.

Here is the context:

<context>
$ARGUMENTS
</context>

Apply The Mom Test depending on what was provided:

---

**IF the user provided an idea or hypothesis to validate:**

### The Three Rules of The Mom Test
1. Talk about their life, not your idea
2. Ask about specifics in the past, not generics or opinions about the future
3. Talk less, listen more

### Conversation Plan

Design a 20-30 minute conversation guide that follows these rules:

**Opening (2 min):** How to establish context without biasing the conversation. No pitching. Frame it as learning about their workflow, not testing your idea.

**Their World (10 min):** Questions that explore their current reality:
- What does their current workflow look like?
- Where do they spend the most time/money/effort?
- What have they already tried to solve this problem?
- How are they currently handling this? (If they aren't, that's a signal.)

For each question, explain WHY it works — what signal it extracts and what a good vs. bad answer sounds like.

**Specific Past Behavior (10 min):** Questions about what they've actually done:
- "Tell me about the last time you [dealt with this problem]..."
- "What happened? Walk me through it."
- "What did you do after that?"
- "How much time/money did that cost you?"

**Commitment & Advancement (5 min):** Test whether they'll put skin in the game:
- Would they do a pilot? Pay for early access? Introduce you to a colleague with the same problem?
- Compliments are NOT commitment. "That sounds cool" means nothing. "Can I sign up for the beta?" means something.

**Questions to NEVER ask:**
- "Would you use a product that does X?" (hypothetical — everyone says yes)
- "Do you think this is a good idea?" (opinion — nobody wants to hurt your feelings)
- "How much would you pay for this?" (hypothetical pricing — useless without commitment)
- "Would you recommend this to a friend?" (future intention — unreliable)

**For each bad question, provide the Mom Test rewrite** — the version that extracts real signal by asking about past behavior instead.

---

**IF the user provided draft interview questions:**

### Question Audit

Evaluate each question against The Mom Test rules. For each:

| Question | Verdict | Problem | Mom Test Rewrite |
|----------|---------|---------|-----------------|
| [original] | Pass/Fail | [why it fails — e.g., hypothetical, opinion-seeking, leading, pitching] | [rewritten version] |

**Common failure patterns to check for:**
- **Hypotheticals**: "Would you..." / "If we built..." / "Could you see yourself..."
- **Opinions**: "Do you think..." / "How do you feel about..."
- **Leading**: Questions that telegraph the desired answer
- **Pitching disguised as asking**: "What if there was a product that [your product]..."
- **Future promises**: "Would you pay..." / "Would you switch..."
- **Generic**: "What are your biggest challenges?" (too broad to be useful without follow-up)

After the audit, provide a revised conversation guide that flows naturally and follows The Mom Test rules.

---

**IF the user provided interview transcripts or notes:**

### Signal Assessment

Analyze the transcript for real vs. false signal:

**Real Signal** (weight heavily):
- Specific past behaviors and actions they've taken
- Money, time, or effort they've already spent on the problem
- Workarounds they've built
- Emotional language about specific frustrations (not polite complaints)
- Commitment actions: signed up, paid, made an introduction, allocated time

**False Signal** (discount or discard):
- Compliments: "That's a great idea", "I love it", "Very cool"
- Future promises: "I would definitely use that", "I'd pay for that"
- Generic complaints: "Yeah, that's definitely a pain point"
- Hypothetical scenarios: "I could see us using that for..."
- Socially desirable answers: anything that sounds like what they think you want to hear

For each finding, provide:
1. The exact quote or evidence
2. Whether it's real signal or false signal, and why
3. The underlying insight (if real) or the question you should have asked instead (if false)

**Summary:**
- What do you actually know after these conversations?
- What do you think you know but actually don't? (false confidence)
- What do you still need to learn?
- What commitments (not compliments) did you get?

---

General rules:
- The best customer conversations don't mention your idea at all. You learn about their life, and later decide if your idea fits.
- If you're hearing what you want to hear, you're probably asking the wrong questions.
- Three strong conversations with specific behavioral evidence beat 30 surveys with opinion data.
- The measure of a good conversation is: did you learn something that could change your plan? If every conversation confirms what you already believe, you're not learning.
```

---

## Tips

- Run this BEFORE you talk to users to design the right questions. Run it AFTER to audit whether you got real signal.
- The most dangerous interviews are the ones that feel great. If everyone loved your idea, you probably pitched instead of listened.
- Pair with **craft-discovery-synthesis** to synthesize insights from multiple Mom Test conversations.
- Use the signal assessment output to decide whether you have enough evidence to move to **craft-spec**, or whether you need more conversations.
- If the Mom Test reveals you don't actually understand the customer's world, run **jobs-to-be-done** to map the underlying motivations.
