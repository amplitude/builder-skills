---
name: diagnose-acquisition
description: Diagnose where users come from, measure channel efficiency, identify organic vs. paid mix health, calculate CAC by segment, and find the highest-leverage acquisition channels. Use when a PM needs to understand acquisition economics, optimize channel mix, or figure out why growth is stalling at the top of the funnel.
suggest_when: User asks about acquisition, "where do our users come from", "CAC", "cost per acquisition", "channel mix", "organic vs paid", "top of funnel", "signup volume", "traffic sources", "growth channels", "viral coefficient", "referrals", or sees stalling user growth despite stable retention.
---

# Diagnose Acquisition

**Map where users come from, measure the true cost and quality of each channel, and find the highest-leverage acquisition plays — and the channels that are quietly burning money.**

You need more users but don't know where to invest. Acquisition diagnosis forces you to decompose signup volume by channel, measure the true cost and downstream quality of each channel (not just volume), and identify whether your growth is structurally healthy (diversified, with organic leverage) or fragile (dependent on paid spend or a single channel). The goal is not "more traffic" — it is a quantified understanding of which channels produce users who activate, retain, and pay.

---

## Prompt Template

```
You are a growth analyst who evaluates acquisition channels by downstream quality, not vanity volume. You know that a channel producing 10,000 signups with 5% activation is worse than one producing 2,000 signups with 40% activation. You follow the unit economics, do the math, and challenge any strategy that optimizes for signup volume alone.

Here is what I'm working with:

<context>
$ARGUMENTS
</context>

> If the above is blank, ask the user: "{{DESCRIBE YOUR PRODUCT, CURRENT SIGNUP VOLUME, ACQUISITION CHANNELS (ORGANIC, PAID, REFERRAL, CONTENT, PARTNERSHIPS, ETC.), ANY DATA ON CAC, CHANNEL BREAKDOWN, ACTIVATION RATES BY CHANNEL, OR AMPLITUDE/ANALYTICS DASHBOARDS}}"

Help me diagnose acquisition. Follow these steps precisely:

### Step 1: Decompose Acquisition Volume

Break total signups into their component channels. For each channel:

- **Size it:** Absolute signups per month and percentage of total.
- **Trend it:** Is it growing, flat, or declining? Over what timeframe?
- **Classify it:**
  - **Organic (scalable):** SEO, word-of-mouth, direct/branded search, community, open-source adoption. These compound over time and have near-zero marginal cost.
  - **Paid (linear):** Paid search, paid social, display, sponsorships. These scale linearly with spend and stop when you stop paying.
  - **Viral/referral (compounding):** User invites, sharing, referral programs. These have a multiplier effect on other channels.
  - **Content/inbound (semi-scalable):** Blog, documentation, templates, tools. These have upfront cost but long-tail returns.
  - **Sales/outbound (linear, high-touch):** SDR outreach, partnerships, events. High CAC but potentially high LTV.

Present the channel mix as a table:

| Channel | Signups/mo | % of Total | Trend | Type | CAC |
|---------|-----------|------------|-------|------|-----|
| ... | ... | ... | ... | ... | ... |

**Assess mix health:** A healthy acquisition mix is diversified with >40% organic/viral. If >60% of signups come from paid channels, growth is fragile — any budget cut or CPM increase will crater volume. If >80% comes from a single channel, you have concentration risk.

### Step 2: Measure Channel Quality (Not Just Volume)

Volume is vanity. Quality is what matters. For each channel, measure downstream performance:

- **Activation rate by channel:** What percentage of signups from each channel reach your activation milestone? A channel with 50% lower volume but 3x activation rate may produce more activated users.
- **Retention by channel:** D30/D60 retention by acquisition source. Some channels attract curious browsers (low retention); others attract users with real need (high retention).
- **Monetization by channel:** Conversion to paid and ARPU by channel. The channel with the cheapest signups often has the lowest LTV.
- **Calculate quality-adjusted CAC:** True CAC = Spend / Activated Users (not Spend / Signups). Then calculate CAC relative to LTV by channel. Present the full unit economics:

| Channel | Signups | Activated | Activation Rate | CAC (signup) | CAC (activated) | Est. LTV | LTV:CAC |
|---------|---------|-----------|-----------------|-------------|-----------------|----------|---------|
| ... | ... | ... | ... | ... | ... | ... | ... |

**Flag channel-quality mismatches:** Channels that look great on volume but terrible on quality-adjusted CAC. These are money pits. Conversely, identify underinvested channels where quality-adjusted economics are strong but volume is low.

### Step 3: Assess Organic and Viral Leverage

Sustainable growth comes from channels that compound. Diagnose each:

**Organic leverage:**
- What percentage of signups come from organic sources (direct, branded search, word-of-mouth)?
- Is organic growing proportionally with paid, or is paid propping up a declining organic base?
- What drives organic discovery? Product visibility (public pages, shared outputs, embeds), SEO (documentation, blog, templates), community (forums, social proof, developer ecosystem)?
- Identify untapped organic surfaces — places your product creates value that could be made visible to non-users.

**Viral/referral leverage:**
- Calculate the **viral coefficient (K-factor):** Average invites sent per user x acceptance rate. K > 1 means self-sustaining viral growth. K = 0.3-0.7 is a useful amplifier on other channels. K < 0.1 means virality is not a real channel.
- Identify the **natural sharing moments** in your product — when do users have a reason to involve someone else? (Collaboration, sharing outputs, requesting feedback, team onboarding.)
- Measure the **referral funnel** if one exists: users who could refer → users who do refer → invites sent → invites accepted → referred users who activate. Size each step and find the biggest drop-off.
- If no viral loop exists, assess whether one is structurally possible given your product's use case. Not every product has natural virality — single-player tools with no sharing surface will not go viral, and that's fine.

### Step 4: Identify Acquisition Bottlenecks

Diagnose what is actually constraining growth at the top of the funnel:

- **Awareness bottleneck:** Target users don't know you exist. Signals: low branded search volume, low direct traffic, competitor brand searches dwarf yours.
- **Interest bottleneck:** Users find you but don't sign up. Signals: high website traffic but low signup conversion rate (<2% for B2B, <5% for consumer). The problem is positioning, landing page, or perceived value — not traffic.
- **Channel saturation:** Your primary channel is approaching diminishing returns. Signals: rising CAC over time, declining conversion rates at similar spend levels, plateauing volume despite budget increases.
- **Wrong audience:** You are acquiring users who don't match your ICP. Signals: high signup volume but low activation, specific channels with dramatically worse downstream metrics, high early churn.

For each bottleneck identified, estimate the addressable impact: "If we improve landing page conversion from 3% to 5% on current traffic of X visitors/month, that is Y additional signups/month at zero incremental CAC."

### Step 5: Recommend the Acquisition Play (and Anti-Plays)

Recommend 2-3 specific acquisition investments ranked by quality-adjusted ROI (not volume).

For each recommendation, specify:
- The channel or tactic, with a concrete description (not "invest in content" but "create comparison pages targeting competitor brand searches")
- The expected volume AND quality impact with math
- Time to impact (paid = immediate, content/SEO = 3-6 months, viral = depends on product changes)
- How to measure success — leading indicators to watch weekly, not just lagging signup numbers

**Where NOT to focus — common anti-plays:**
- Scaling paid spend on channels with poor quality-adjusted CAC — you are buying signups that will never activate or pay
- "We need more top-of-funnel" when the real problem is activation — use **diagnose-activation** and **build-metric-tree** to check whether acquisition or activation is the actual bottleneck
- Launching a referral program when your product has no natural sharing moment — incentivized referrals without product-driven virality produce low-quality signups who came for the incentive, not the product
- Investing in brand awareness campaigns before product-market fit is proven — you will attract users into a product that doesn't retain them
- Optimizing landing pages when traffic volume is the constraint, or buying traffic when landing page conversion is the constraint — diagnose which side of the equation is broken
- Diversifying into new channels before maximizing your best-performing channel — go deep before going wide, unless you have concentration risk

### Output Format

Deliver:
1. Channel decomposition table with volume, trend, type, and CAC
2. Channel quality analysis with activation, retention, monetization, and quality-adjusted CAC
3. Organic and viral leverage assessment with K-factor and referral funnel if applicable
4. Bottleneck diagnosis with addressable impact sizing
5. Ranked acquisition recommendations with quality-adjusted ROI math
6. Anti-plays — where not to invest
7. Open questions — what data is missing, what hypotheses need validation

Be direct. Be quantitative. If the acquisition mix is unhealthy or a high-volume channel is actually a money pit, say so clearly.
```

---

## Tips

- Bring your channel-level data. Even rough estimates of signups by source unlock the quality analysis.
- Use **build-metric-tree** first to confirm acquisition is actually the bottleneck. If activation or retention is broken, more users at the top just means more users churning.
- Pair with **diagnose-activation** to understand channel-specific activation rates — this is critical for calculating quality-adjusted CAC.
- Use **create-chart** to build acquisition funnel charts segmented by source in Amplitude.
- Use **craft-experiment-design** to design tests for new channels or landing page optimizations.
- The single most important metric in this analysis is quality-adjusted CAC (cost per activated user), not cost per signup. Optimizing for signup volume without quality adjustment is one of the most common and expensive growth mistakes.
