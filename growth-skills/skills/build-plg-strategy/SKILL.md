---
name: build-plg-strategy
description: Design a product-led growth strategy for your product — classify your PLG motion, define activation and monetization architecture, choose distribution channels, plan the PLG-to-sales bridge, and build defensibility. Incorporates AI-era shifts in distribution, pricing, and user expectations. Use when building or overhauling a growth strategy.
suggest_when: User asks about product-led growth, PLG strategy, "how should we grow", go-to-market strategy, growth architecture, self-serve motion, freemium strategy, "should we do PLG", distribution strategy, pricing model, or is planning a growth overhaul.
---

# Build a PLG Strategy

**Design the growth architecture for your product — from how users discover you, to how they activate, retain, pay, and expand. Grounded in what actually works in the current market, not the 2018 playbook.**

Product-led growth means your product is the primary engine for acquisition, activation, retention, and expansion. But PLG is not one thing — it is an architecture of interlocking decisions about distribution, activation, monetization, and defensibility. This skill helps you design that architecture from scratch or pressure-test an existing one.

---

## Domain Context

### PLG Fundamentals That Still Hold

These principles have not changed and are the foundation of any PLG motion:

- **The product is the best salesperson.** Users want to try before they buy. Self-serve discovery is more trusted than a pitch. If your product cannot demonstrate its own value, no marketing will save it.
- **Product-qualified signals beat marketing-qualified leads.** Companies using product-qualified leads achieve 25-30% conversion rates vs. 5-10% for marketing-qualified leads. PLG companies acquire customers at roughly one-tenth the cost of sales-led approaches.
- **Time-to-value is everything.** Only about 33% of signups reach their aha moment. Top PLG companies get that to 65%+ by compressing time-to-value to minutes, not hours.
- **Activation drives everything downstream.** Activated users show 2-5x higher long-term retention, and 70-80% of fully activated users convert to paid. Most companies that think they have retention or monetization problems actually have activation problems.

### What Has Changed

Several forces have reshaped how PLG works in practice:

- **The activation bar is higher.** Users now benchmark onboarding against products that deliver value in under 60 seconds. Multi-step setup wizards feel broken. The best products collapse setup and value delivery into a single interaction.
- **Traditional distribution channels are eroding.** SEO traffic is declining as users get answers from AI assistants instead of websites. Social platforms restrict outbound links. Campaign lifecycles that ran for months now burn out in days. New channels — AI assistant recommendations, product-native virality, community — are replacing the old ones.
- **Real costs change freemium economics.** AI features have real cost-of-goods-sold per user. The old model of generous free tiers with near-zero marginal cost does not work when free users actively burn cash. Pricing strategy must balance generosity with sustainability.
- **Product-market fit is a treadmill, not a destination.** Competitive landscapes shift weekly. Feature adoption curves that played out over quarters now compress into weeks. Measurement cadence must match market speed.
- **Innovation beats optimization.** When competitors can ship comparable features in days, incremental A/B test wins do not compound into durable advantages. The winning teams ship fundamentally new experiences rather than polishing existing funnels.

### When PLG Is Not Right

PLG is not the right primary motion if:
- Your product cannot deliver a self-serve aha moment (requires extensive custom setup, data migration, or integration before users see value)
- Your buyer and user are so disconnected that product usage signals do not reach the purchasing decision-maker
- Your product addresses a problem customers do not know they have
- Your market consists exclusively of enterprise buyers with formal procurement

Even then, borrowing PLG elements defensively (interactive demos, self-serve activation for additional users within existing accounts, time-bound trials) still makes your sales motion faster.

---

## When to Use

- Designing a growth strategy for a new product
- Overhauling growth architecture for an existing product
- Evaluating whether PLG is the right motion (offensive or defensive)
- Planning distribution channels and go-to-market
- Designing pricing and packaging for a self-serve product
- Building the bridge from PLG to enterprise sales

---

## Prompt

You are a growth strategist who has studied how the fastest-growing product-led companies actually grow — not the theory, but the mechanics. You understand that PLG is an architecture of interlocking decisions, not a single tactic. You are direct about what works, what does not, and what has changed.

Given the following context about my product and growth goals: $ARGUMENTS

Work through these steps:

### Step 1: Classify Your PLG Motion

**Is PLG offensive or defensive for you?**

- **Offensive PLG:** Your product is inherently built to drive its own growth. The product experience is the growth engine. Self-serve adoption is the primary path to revenue.
- **Defensive PLG:** Your product can be adapted to support some self-serve growth, but most revenue comes from other motions. You are using PLG elements to protect against PLG competitors entering from below.

Be honest about which one this is. The investment level and architectural decisions are different.

**Which game does your product play?**

- **Attention:** Success = time spent. Users come for content, entertainment, or ongoing engagement.
- **Transaction:** Success = transaction volume. Users come to buy, sell, or exchange value.
- **Productivity:** Success = work completed efficiently. Users come to get a job done faster or better.

The game determines your North Star Metric, your activation definition, and your natural monetization model. Do not try to play all three.

### Step 2: Design the Activation Architecture

Activation is the single highest-leverage investment in PLG. Get this right and everything downstream improves.

**Define the aha moment.** What is the specific action where a user first experiences your product's core value? This is not a login, not completing a profile, not finishing a tutorial. It is the moment the user thinks "this is actually useful." Be precise.

**Benchmark time-to-value.** How long does it currently take a new user to reach the aha moment? The current bar for strong PLG products is under 60 seconds for the first value moment. If yours is measured in days, identify where the delays are — is it data setup, configuration, learning curve, or waiting for other people?

**Design the first-run experience.** The best activation collapses setup and value delivery into a single interaction:
- What is the minimum the product needs to know to deliver value? (role, goal, one piece of context)
- Can the product deliver a result before the user has done any manual work?
- Does the first experience feel like using the product, or like filling out a form?

**Measure activation in layers.** Track three distinct stages separately:
1. **Setup:** Environment is ready (account created, data connected, etc.)
2. **Aha:** User experiences core value for the first time
3. **Habit:** User returns and repeats the aha moment on their natural frequency

Most teams conflate these. A user who completed setup but never reached aha is not activated.

**Think in teams, not just individuals.** If your product is collaborative, define team activation separately from individual activation. Track when teams successfully collaborate and get value together, not just when individual users sign up.

### Step 3: Design the Monetization Architecture

**Choose a pricing model that scales with value delivery:**

- **Per-seat:** Simple, predictable, but increasingly misaligned with how AI products deliver value. Works when each seat represents a distinct user who gets distinct value.
- **Usage-based:** Aligns cost with value but impacts sales comp, forecasting, and customer budgeting. Works when each unit of consumption delivers visible output.
- **Credit-based:** Give users access to all features, limit volume. The conversion trigger is volume, not capability — a much more natural upgrade path. The most common model among fast-growing AI products.
- **Hybrid:** Base subscription plus usage-based components. Provides predictability with value alignment.
- **Outcome-based:** Charge for results delivered (qualified leads, resolved tickets, closed deals). The frontier of pricing, but requires confidence in your product's ability to deliver measurable outcomes.

**Design the free-to-paid boundary.** The free experience must be compelling enough to deliver the aha moment but limited enough to create a natural upgrade trigger. Key principle: limit volume or frequency, not capability. Users who never experience the full product quality will never understand what they are paying for.

**Test for pricing clarity.** If you cannot explain your pricing in one sentence, it is too complex. Users should understand exactly what they get and what triggers an upgrade.

**Watch for underpricing.** The temptation to grow fast with low prices creates a structural deficit that is nearly impossible to reverse once users anchor on a number. Price for the value you deliver, not just for adoption speed.

### Step 4: Design the Distribution Architecture

Traditional channels are eroding. Design for where users actually discover products now.

**Audit your current channel mix.** For each channel, assess:
- Current volume and trend direction (growing, stable, declining)
- Cost per acquired user and quality (do these users activate and retain?)
- Defensibility (can this channel be disrupted or copied?)

**Evaluate emerging channels:**

- **AI assistant recommendations:** How does your product appear when users ask AI assistants for solutions in your category? Are you optimized for how AI systems evaluate and recommend products (clear structured content, authority signals, multi-format presence)?
- **Product-native virality:** Does using your product naturally create artifacts, outputs, or shared experiences that expose new users to it? This is now the most reliable distribution channel.
- **Community-led growth:** Active communities (forums, Slack/Discord groups, template libraries) drive adoption 2-3x faster than blog content. User-generated content and peer validation outperform brand marketing.
- **Multi-surface distribution:** Can your product's capabilities be accessed on the surfaces where users already spend time (Slack, Teams, AI assistants) rather than requiring them to visit your app?

**Make your platform bet.** Pick the 2-3 channels where you will invest disproportionately based on where your users actually are, not where they were three years ago.

### Step 5: Design the PLG-to-Sales Bridge

Pure self-serve PLG works up to a point. Most successful PLG companies layer sales on top once they have product usage signals.

**Define product-qualified accounts (PQAs) and product-qualified leads (PQLs).**

- **PQA:** Account-level qualification based on product usage — volume, velocity, breadth, team size, integration depth. Tells you when an account is ready for sales engagement.
- **PQL:** The buyer persona within the account. Not all users are buyers. A PQA without a PQL is actually the biggest opportunity — the account is getting value but you have not connected with the decision-maker yet.

**Build behavioral scoring.** Combine product usage signals with firmographic data to generate a ranked list of accounts ready for sales. Do not hand sales a list of active users with no context — that wastes rep time and erodes trust in the PLG motion.

**Design the handoff.** When does a self-serve account become a sales conversation? The trigger should be a behavioral signal (team expansion, hitting usage limits, adopting enterprise features), not a time-based rule.

### Step 6: Design for Defensibility

In a market where competitors can ship comparable features quickly, your moat is not your code. Design defensibility from the start.

**Evaluate five moat strategies:**

1. **Data and context lock-in:** Users get a better experience because of the data they have stored in your system. The more they use it, the harder it is to leave.
2. **Deep workflow integration:** Embed into users' existing tools and workflows. The switching cost is not learning a new product — it is ripping out integrations.
3. **Community and content ecosystems:** User-generated templates, shared knowledge, peer networks. Competitors cannot replicate this by building a better product.
4. **Network effects:** Every additional user makes the product more valuable for existing users. Strong in collaborative and marketplace products.
5. **Behavioral intelligence:** Deep understanding of how users behave, what predicts retention, what triggers expansion. This compounds over time and cannot be copied.

For each, assess: does this apply to your product? How strong is it today? What would it take to strengthen it?

### Step 7: Build the Action Plan

Synthesize everything into a prioritized plan.

**Deliver:**

1. **PLG classification** — offensive vs. defensive, which game, whether PLG is the right primary motion
2. **Activation architecture** — aha moment definition, time-to-value target, first-run experience design, measurement layers
3. **Monetization architecture** — pricing model recommendation, free-to-paid boundary, packaging structure
4. **Distribution architecture** — channel assessment, emerging channel opportunities, platform bet recommendation
5. **PLG-to-sales bridge** — PQA/PQL definitions, behavioral scoring approach, handoff design
6. **Defensibility plan** — which moats to invest in and how
7. **Top 3 actions** — the highest-leverage things to do in the next 30 days, ordered by impact. Start each with a verb. Be specific enough that someone could start executing tomorrow.
8. **What to stop doing** — PLG anti-patterns the team should drop. Be direct.

Do not hedge. A wishy-washy strategy is worse than a wrong one you can test and iterate on.

---

## Tips

- Bring your current metrics (signups, activation rate, time-to-value, retention, conversion to paid, channel breakdown). The more data, the more specific the strategy.
- If you are adding PLG to an existing sales-led motion, be explicit about that — the strategy is different from building PLG-first.
- Pair with **north-star-metric** to define the metric system that tracks your PLG motion.
- Pair with **build-metric-tree** to decompose your growth model into sized, actionable levers.
- Pair with **diagnose-activation** if your data suggests activation is the bottleneck.
- Pair with **diagnose-monetization** if you need to redesign pricing and packaging.
- Pair with **map-growth-loops** to identify the self-reinforcing loops in your product.
- Revisit quarterly. PLG architecture is not set-and-forget — the market moves too fast.

---

## Further Reading

- [Product-Led Growth in the AI Era](https://amplitude.com/blog/product-led-growth) — Amplitude
- [North Star Playbook](https://amplitude.com/books/north-star) — Amplitude
- [2025 Product Benchmark Report](https://amplitude.com/blog/product-benchmark-report) — Amplitude
