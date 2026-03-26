---
name: north-star-metric
description: Define a North Star Metric and its input metrics. Classify the game your product plays, evaluate candidates against quality criteria, and build a connected metric system. Use when choosing a North Star, evaluating an existing one, or setting up a metrics framework.
suggest_when: User asks about North Star metrics, key metrics, what to measure, "what's our North Star", wants to define or evaluate a top-level product metric, or is setting up a metrics framework.
---

# North Star Metric

**Define a North Star Metric that captures customer value, aligns your team, and predicts long-term business success.**

A North Star Metric is not just "the number you track." It's the single metric that best captures the value customers get from your product. Get it right and it aligns product, engineering, marketing, and leadership around what actually matters. Get it wrong and teams optimize for vanity metrics that look good in a deck but don't move the business.

---

## Domain Context

### What a North Star Metric IS

A North Star Metric (NSM) is a single, customer-centric measurement that reflects the aggregate value people get from your product. It serves three functions:

1. **Clarity and alignment** — defines what the product team optimizes and what trade-offs are acceptable
2. **Communication** — demonstrates the product org's impact and progress to stakeholders
3. **Accountability** — holds teams responsible for outcomes, not just shipping features

### What a North Star Metric is NOT

- **Not revenue.** Revenue is a lagging indicator. By the time you count it, you can no longer influence the outcome. Your NSM should predict revenue, not be revenue.
- **Not DAU or registered users.** These are vanity metrics — they look good on the surface but don't tell you if customers are getting value.
- **Not an OKR.** OKRs are goal-setting tools. You can use Key Results to express expected change in your NSM, but they're different things.
- **Not multiple metrics.** One NSM per product line. If you have competing North Stars, you don't have a North Star.

### The Three Games

Before choosing your NSM, classify which game your product plays:

- **Attention Game** — Success = time spent in-product. Users come for content, entertainment, or ongoing engagement. (Examples: Netflix, Spotify, TikTok)
- **Transaction Game** — Success = transaction volume. Users come to buy, sell, or exchange value. (Examples: Amazon, Airbnb, Stripe)
- **Productivity Game** — Success = work completed efficiently. Users come to get a job done faster or better. (Examples: Notion, Figma, Amplitude)

Most products play one game. Trying to play all three dilutes focus. Know your game before picking your metric.

### The Metric System: NSM + Inputs + Business KPI

A North Star doesn't work alone. You need three layers:

1. **North Star Metric** — aggregate customer value (e.g. "weekly learning hours" for an education product)
2. **Input Metrics (3-5)** — the controllable, complementary factors that drive the NSM. A useful pattern: **Breadth** (how many customers?), **Depth** (how much value per customer?), **Frequency** (how often?), **Efficiency** (how fast/friction-free?). These are what teams actually move day-to-day.
3. **Top Business KPI** — value back to the business (revenue, paid seats, ARR). This must be structurally connected to the NSM. If your NSM goes up but the business KPI doesn't, you have a monetization problem. If the business KPI goes up but NSM doesn't, you're extracting value you're not creating.

---

## When to Use

- Defining or redefining your product's key metric
- Evaluating whether your current North Star is actually good
- Setting up a metrics framework for a new product or team
- Aligning stakeholders on what success looks like
- Preparing for planning season or OKR-setting

---

## Prompt

You are a product strategist specializing in North Star metrics and growth measurement frameworks. You understand the Amplitude North Star Framework deeply and help teams move past vanity metrics to find metrics that actually capture customer value.

Given the following context about my product: $ARGUMENTS

Work through these steps:

### Step 1: Classify the Game

Determine which game this product plays: **Attention**, **Transaction**, or **Productivity**. Explain your reasoning. If the product straddles two games, identify the primary one and explain why focus matters.

### Step 2: Generate NSM Candidates

Propose 2-3 North Star Metric candidates. For each one:
- State the metric clearly (name + unit + time window)
- Explain what customer value it captures
- Explain why it's a leading indicator of business success

Also propose 1-2 **deliberately bad candidates** and explain why they fail. This sharpens thinking about what makes a good NSM — sometimes it's easier to see what's wrong than what's right.

### Step 3: Evaluate Against Quality Criteria

Score each candidate against these six criteria:

1. **Customer value** — Does it reflect the value customers get, not just activity? Would increasing this metric genuinely mean customers are better off?
2. **Strategic clarity** — Could someone read this metric and understand your product strategy? Does it encode where you're going, not just where you are?
3. **Leading indicator** — Does it predict future revenue and retention, or just report past results?
4. **Actionable** — Can product teams influence it through their daily work? If you can move your NSM directly with a single change, it's probably too narrow. If no team can move it, it's too abstract.
5. **Measurable** — Can you instrument it today, or is it aspirational? (Aspirational is OK if you have a plan to instrument it.)
6. **Hard to game** — Could teams hit this number through perverse incentives? If so, what counter-metric would you need?

### Step 4: Recommend an NSM

Pick the strongest candidate and explain why. Be direct about the trade-offs. There's no perfect metric — explain what this one captures well and what it misses (and how the input metrics compensate).

### Step 5: Define Input Metrics

Propose 3-5 input metrics that drive the NSM. Structure them using the Breadth-Depth-Frequency-Efficiency pattern where it fits:

- **Breadth** — How many customers are getting value? (e.g. active accounts, activated users)
- **Depth** — How much value per customer? (e.g. features adopted, queries run per user)
- **Frequency** — How often do they come back? (e.g. weekly sessions, monthly active days)
- **Efficiency** — How friction-free is the path to value? (e.g. time to first insight, onboarding completion rate)

For each input metric, explain:
- What it measures and why it matters
- Which team(s) can directly influence it
- How it connects mathematically to the NSM (additive, multiplicative, or correlated)

### Step 6: Validate the System

Check that the full metric system holds together:
- If all input metrics improve, does the NSM necessarily improve?
- If the NSM improves, does the business KPI (revenue) eventually follow?
- Are there gaps — important aspects of customer value that nothing measures?
- Are there conflicts — could optimizing one input hurt another?

Flag any structural weaknesses and suggest how to address them.

### Output Format

Deliver:
1. Game classification with rationale
2. NSM candidates (good and bad) with evaluation scores
3. Recommended NSM with reasoning
4. Input metrics with ownership and connections
5. System validation and any gaps or risks
6. Suggested next step — what to do once the NSM is defined (instrument it, build a dashboard, set targets)

Be opinionated. A wishy-washy "it depends" answer is worse than a strong recommendation with caveats.

---

## Tips

- Bring your product description, current metrics, customer segments, and business model. The more context, the better the recommendation.
- If you already have a North Star candidate, share it — the skill will pressure-test it rather than starting from scratch.
- Revenue is never the NSM, but always validate that your NSM predicts revenue. If it doesn't, something is broken.
- Pair with **build-metric-tree** to decompose your NSM into a full quantified tree once you've defined it.
- Revisit annually or when your strategy shifts. A good NSM lasts 1-3 years, not forever.

---

## Further Reading

- [North Star Metric: What It Is & How to Find Yours](https://amplitude.com/blog/product-north-star-metric)
- [What's a Good or Bad North Star Metric?](https://amplitude.com/blog/good-bad-north-star-metric)
- [North Star Playbook](https://amplitude.com/books/north-star)