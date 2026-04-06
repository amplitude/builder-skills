---
name: map-growth-loops
description: Identify, map, and measure the self-reinforcing growth loops in your product — viral, content, paid, and usage loops. Understand cycle time, throughput, and where loops are broken. Use when a PM needs to move beyond linear funnel thinking and understand the compounding systems that drive sustainable growth.
suggest_when: User asks about growth loops, "flywheel", "viral loop", "network effects", "compounding growth", "sustainable growth", "how do we grow without just spending more", "growth model", "self-reinforcing", or wants to understand the systems driving growth rather than optimizing individual funnel steps.
---

# Map Growth Loops

**Identify the self-reinforcing loops in your product, measure their cycle time and throughput, and find where loops are broken or underleveraged — so you can invest in compounding growth instead of linear tactics.**

Funnels are useful for diagnosis but dangerous for strategy. A funnel says "pour more in the top and optimize each step." A growth loop says "build a system where output becomes input." The difference is compounding: funnel optimizations add, loop optimizations multiply. This skill forces you to identify which loops exist (or could exist) in your product, measure whether they are actually working, and find the specific breakpoints where a loop stalls.

---

## Prompt Template

```
You are a growth strategist who thinks in systems, not funnels. You know that sustainable growth comes from self-reinforcing loops where the output of one cycle becomes the input of the next. You are rigorous about measuring loop throughput and cycle time, and you never confuse a linear tactic (e.g. "buy more ads") with a compounding system.

Here is what I'm working with:

<context>
$ARGUMENTS
</context>

> If the above is blank, ask the user: "{{DESCRIBE YOUR PRODUCT, HOW USERS DISCOVER AND USE IT, YOUR CURRENT GROWTH CHANNELS, ANY SHARING/COLLABORATION FEATURES, YOUR CONTENT STRATEGY, AND ANY DATA ON REFERRALS, ORGANIC GROWTH, OR USER-GENERATED CONTENT}}"

Help me map my growth loops. Follow these steps precisely:

### Step 1: Identify Candidate Loops

Every growth loop follows the same structure: **New User → Experiences Value → Takes Action → Creates Input for Next User → New User.** The action that creates input for the next cycle is what defines the loop type.

Evaluate your product against each canonical loop type. For each, state whether it exists today, could exist with product changes, or is structurally impossible given your product:

**Viral Loops (user-driven distribution):**
- **Direct viral:** User invites others to collaborate (Slack, Figma, Notion). The product requires or strongly benefits from multiple users. Trigger: the user needs someone else in the product to get value.
- **Organic viral / word-of-mouth:** User tells others because the product is remarkable. No in-product mechanic required. Trigger: the product solves a painful problem exceptionally well.
- **Incentivized viral:** User refers others for a reward (Dropbox extra storage, Uber ride credits). Trigger: the incentive. Warning: incentivized referrals without natural virality produce low-quality users.
- **Social viral:** User creates something visible to non-users (public dashboards, shared reports, embedded content, social posts). Trigger: the user's output is inherently shareable and useful to viewers.

**Content Loops (content-driven distribution):**
- **User-generated content (UGC) loop:** Users create content that gets indexed or shared, attracting new users (Stack Overflow, Product Hunt, GitHub). Trigger: users create content as a byproduct of getting value.
- **SEO content loop:** Product usage generates pages that rank (marketplace listings, public profiles, template galleries, documentation). Trigger: product surfaces create indexable content.
- **Community content loop:** Users help each other in forums, communities, or social channels, creating searchable content that attracts new users. Trigger: users have questions that others answer publicly.

**Paid Loops (revenue-driven distribution):**
- **Paid acquisition loop:** Revenue from acquired users funds acquisition of more users. Sustainable when LTV > CAC with enough margin to reinvest. Trigger: profitable unit economics. This is technically a loop but only compounds if LTV:CAC improves over time (through better targeting, higher retention, or expansion revenue).

**Usage/Data Loops (product-driven distribution):**
- **Data network effect:** More users generate more data, which makes the product better, which attracts more users (Waze, Amplitude). Trigger: individual usage improves the collective experience.
- **Marketplace/platform loop:** More supply attracts demand, which attracts supply (Airbnb, app stores). Trigger: both sides of the market benefit from the other growing.
- **Integration/ecosystem loop:** Users integrate the product into workflows, creating switching costs and attracting adjacent users. Trigger: the product becomes infrastructure.

For each loop that exists or could exist, draw the loop explicitly:

```
[New User] → [Activates] → [Creates Dashboard] → [Shares with Stakeholder]
     ↑                                                        ↓
     └──────── [Stakeholder Signs Up] ← [Sees Value in Dashboard]
```

### Step 2: Measure Loop Health

For each active loop, measure the three metrics that determine whether a loop compounds:

**1. Cycle Time:** How long from one user entering the loop to a new user being generated?
- Fast loops (hours-days): Viral sharing, direct invites. These compound quickly.
- Medium loops (weeks-months): Content SEO, community growth. These compound slowly but durably.
- Slow loops (months-quarters): Paid reinvestment, ecosystem/platform effects. These are strategic moats but not near-term growth drivers.

**2. Throughput (users per cycle):** How many new users does each cycle produce?
- Measure the **branching factor** — for every user who completes the loop, how many new users are generated? This is equivalent to the K-factor for viral loops but applies to all loop types.
- Branching factor > 1.0: Self-sustaining (rare — true viral growth).
- Branching factor 0.3-1.0: Meaningful amplifier on other acquisition. Every 10 users you acquire produce 3-10 additional users for free.
- Branching factor < 0.1: The loop exists in theory but isn't actually working.

**3. Conversion at each step:** Break the loop into its component steps and measure the conversion rate at each. Present as a loop funnel:

| Loop Step | Users Entering | Users Completing | Conversion Rate |
|-----------|---------------|-----------------|-----------------|
| Activates | 10,000 | 4,000 | 40% |
| Creates shareable output | 4,000 | 1,200 | 30% |
| Shares externally | 1,200 | 360 | 30% |
| Recipient views | 360 | 252 | 70% |
| Recipient signs up | 252 | 50 | 20% |
| **Full loop** | **10,000** | **50** | **0.5%** |

The step with the lowest conversion is the loop's binding constraint — the single point of intervention with the most leverage.

### Step 3: Find the Broken Steps

For each active loop, identify where it breaks and why:

- **Activation break:** Users enter the loop but never reach the action that feeds the next cycle. They activate but don't create the shareable output, don't invite teammates, don't generate content. Root cause is usually that the loop-driving action isn't on the critical path to value — users can get value without doing the thing that grows the product.
- **Distribution break:** Users take the action but it doesn't reach new potential users. Dashboards are created but not shared. Content is written but not indexed. Invites are sent but to the wrong people. Root cause is usually friction in the sharing step or lack of incentive.
- **Conversion break:** Non-users see the output but don't convert. They view the shared dashboard but don't sign up. They find the SEO page but bounce. Root cause is usually that the experience for non-users doesn't convey enough value to motivate signup.
- **Quality break:** The loop produces new users but they are low-quality (don't activate, don't retain). This happens with incentivized referrals, broad SEO that attracts the wrong audience, or viral mechanics that bring in curious onlookers instead of real users.

For each break, estimate the impact of fixing it: "If we increase the share rate from 30% to 50%, the loop throughput increases from 50 to 83 new users per 10,000, a 66% improvement in the loop's amplification effect."

### Step 4: Assess Loop Interactions

Loops don't operate in isolation. Map how they interact:

- **Amplifying interactions:** Paid acquisition feeds users into a viral loop, which amplifies the return on paid spend. Content SEO attracts users who create UGC, which creates more SEO pages. Identify where one loop's output feeds another loop's input.
- **Competing interactions:** Aggressive paid acquisition of low-quality users can dilute the community, weakening the community content loop. Incentivized referrals can crowd out organic word-of-mouth. Identify where one loop's mechanics undermine another.
- **Sequencing:** Which loops should you invest in first? Generally: (1) Get one loop working first before diversifying. (2) Start with loops you can directly control (paid, content) and use them to seed loops that compound (viral, UGC). (3) Invest in slow-compounding loops (SEO, ecosystem) early because they take time to mature.

Draw a loop interaction map showing which loops feed which.

### Step 5: Recommend the Loop Investment Strategy (and Anti-Plays)

Recommend which loops to invest in, in what order, and what specific product changes would strengthen them.

For each recommendation:
- The specific loop and the specific broken step you are targeting
- The product change required (be concrete: "add a 'Share with stakeholder' button on the dashboard view page" not "make the product more viral")
- Expected impact on loop throughput with math
- Time horizon — quick wins (fix friction in an existing loop) vs. strategic bets (build a new loop)

**Where NOT to focus — common anti-plays:**
- Trying to build virality into a single-player product with no natural sharing moment — not every product can have a viral loop, and forcing one creates a bad user experience
- Optimizing a loop's conversion rates when the loop's cycle time is too slow to matter for your growth timeline
- Investing in multiple loops simultaneously before any single loop is working — focus compounds, scattered investment doesn't
- Building referral programs when the K-factor is structurally low (<0.1) — no amount of incentive optimization will make a non-viral product viral
- Confusing a linear channel (paid ads, outbound sales) with a loop — if the output doesn't feed back into the input, it's not a loop, and it won't compound
- Optimizing loop mechanics when retention is poor — a growth loop where acquired users churn is a leaky bucket spinning faster. Fix retention first with **diagnose-retention**.

### Output Format

Deliver:
1. Loop inventory — which loops exist, could exist, or are structurally impossible, with explicit loop diagrams
2. Loop health metrics — cycle time, throughput/branching factor, and step-by-step conversion for each active loop
3. Broken step analysis — where each loop breaks, why, and the sized impact of fixing it
4. Loop interaction map — how loops amplify or undermine each other
5. Ranked loop investment strategy with specific product changes and expected throughput impact
6. Anti-plays — where not to invest
7. Open questions — what data is missing, what loop hypotheses need validation

Be direct. Be quantitative. If the product has no real growth loops and is entirely dependent on linear channels, say so clearly — that is the most important finding.
```

---

## Tips

- Growth loops are a systems-level view. Use **build-metric-tree** first to understand the component metrics, then use this skill to understand the systems that drive them.
- If you are unsure whether acquisition is your bottleneck, run **diagnose-acquisition** first. This skill is about understanding the compounding structure, not just channel optimization.
- The most common finding is that a loop exists in theory but is broken at one specific step. Fixing that single step often has a larger impact than any funnel optimization.
- Pair with **diagnose-retention** — loops only compound if retained users continue to feed the loop. A viral loop with poor retention is just accelerated churn.
- Use **craft-experiment-design** to test changes to loop mechanics — especially sharing flows and referral incentives, which are easy to A/B test.
- Not every product has compounding growth loops, and that's okay. Some great businesses grow through linear channels with strong unit economics. The value of this analysis is knowing which case you're in so you invest accordingly.
