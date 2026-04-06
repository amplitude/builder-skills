---
name: launch-metrics
description: Set up measurement and tracking for product launches, run post-launch retros with data, and build a launch analytics system. Use this skill whenever someone asks to track a launch, set up UTM parameters, measure launch performance, run a launch retro, analyze launch results, or build a dashboard for a product release. Also trigger for "how do we know if the launch worked," "what should we track for this launch," "set up UTMs for the announcement," or any request about measuring or evaluating a product launch. Covers pre-launch tracking setup, UTM conventions, per-tier KPIs, benchmark expectations, and retro frameworks.
suggest_when: User asks to track a launch, set up UTMs, measure launch performance, run a launch retro, analyze launch results, "how do we know if the launch worked", "what should we track", "set up UTMs", or any measurement request tied to a product launch.
---
**User context:** $ARGUMENTS

> If the above is blank, ask the user to share the relevant context before proceeding.


# Launch Metrics

This skill covers how to measure product launches — what to set up before launch day, what to track during, and how to evaluate results afterward. Without consistent measurement, launches are guesswork. With it, each launch informs the next.

## Pre-launch setup

Measurement starts before launch day. Setting up tracking the day of the launch means you miss the first-wave data when traffic is highest.

### What to set up

1. **UTM parameters** — Tag every link in every distribution channel
2. **Analytics events** — Instrument the conversion funnel end-to-end
3. **Baseline capture** — Record current metrics before launch so you can measure lift
4. **Dashboard or view** — One place to watch all key metrics on launch day

### UTM conventions

UTM parameters track where traffic comes from. Use a consistent naming scheme across all launches so you can compare over time.

```
utm_source    = the platform (twitter, linkedin, email, producthunt, hackernews)
utm_medium    = the channel type (social, email, paid, referral)
utm_campaign  = the launch name (feature-name-launch, v2-launch, etc.)
utm_content   = the specific asset (tweet-thread, announcement-email, blog-post)
```

**Example URLs:**

- Twitter announcement: `?utm_source=twitter&utm_medium=social&utm_campaign=realtime-api-launch&utm_content=launch-tweet`
- Launch email: `?utm_source=email&utm_medium=email&utm_campaign=realtime-api-launch&utm_content=announcement-email`
- Product Hunt: `?utm_source=producthunt&utm_medium=referral&utm_campaign=realtime-api-launch&utm_content=ph-listing`

**Rules:**
- Always lowercase
- Use hyphens, not underscores or spaces, in values
- Campaign name should match across all channels for a single launch
- Create all UTMs from a spreadsheet before launch day so nothing is missing

### Instrumented events

Before launch, verify these analytics events exist and fire correctly:

| Event | Description |
|-------|-------------|
| `landing_page_view` | Landing page loaded with UTM params captured |
| `signup_started` | User begins registration |
| `signup_completed` | Account created |
| `first_action` | First meaningful product action (varies by product) |
| `cta_click` | Each CTA button clicked (with label) |
| `blog_post_view` | Launch blog post loaded |
| `email_open` | Launch email opened (from email platform) |
| `email_click` | Link clicked in launch email |

If these events don't exist and you don't have time to add them before launch, at minimum use UTMs to measure traffic and signups from whatever analytics platform you already have.

## KPIs by tier

What "success" looks like depends on launch tier. Don't compare a Tier 3 changelog tweet to a Tier 1 product launch.

### Tier 1 KPIs (full product launch)

| Metric | What it measures | Where to track |
|--------|-----------------|----------------|
| New signups (day 1, week 1) | Direct acquisition impact | Product analytics |
| Landing page visitors | Reach of the announcement | Web analytics |
| Landing page → signup conversion rate | Page effectiveness | Web analytics |
| Email open rate | List engagement | Email platform |
| Email click rate | Email copy effectiveness | Email platform |
| Social impressions + engagements | Awareness | Native platform analytics |
| Press mentions | PR reach | Manual + Google Alerts |
| Backlinks generated | SEO impact | Ahrefs, Search Console |
| Product Hunt rank (if applicable) | PH-specific reach | Product Hunt |

### Tier 2 KPIs (major feature)

| Metric | What it measures |
|--------|-----------------|
| New signups from launch traffic | Acquisition |
| Feature adoption rate (existing users) | Activation |
| Blog post views | Content reach |
| Social engagement rate | Resonance |
| Email open + click rate | List engagement |

### Tier 3 KPIs (small improvement)

| Metric | What it measures |
|--------|-----------------|
| Changelog views | Awareness among existing users |
| Social post engagement | Reach |

## Benchmark expectations

These are rough benchmarks for a B2B/developer tool with an established audience. Use them to calibrate expectations, not as hard targets.

| Metric | Weak | Solid | Strong |
|--------|------|-------|--------|
| Email open rate (existing list) | < 20% | 30-40% | > 50% |
| Email click rate | < 2% | 4-8% | > 10% |
| Landing page → signup CVR | < 2% | 5-10% | > 15% |
| Twitter launch tweet impressions (10K followers) | < 5K | 10-30K | > 50K |
| HN front page (if hit) | — | 200-500 visits | 2,000+ visits |
| Product Hunt (featured) | < 100 upvotes | 200-500 | 500+ |
| Tier 1 launch: week-1 signups | < 100 | 200-1,000 | 1,000+ |

These vary enormously by audience size, product category, and launch quality. Treat them as directional.

## Launch day monitoring

On launch day, watch metrics in near real-time for the first 4-6 hours. This is when you can still adjust (reshare a post, send a follow-up tweet, extend a limited offer).

**What to watch:**
- Signups per hour (alert if significantly below expectation)
- Top traffic sources by signup conversion rate (not just volume)
- Email delivery issues (bounce rate, spam complaints)
- Social engagement velocity in the first 2 hours (predicts final reach)

**Don't do:**
- Obsessively refresh metrics while neglecting to engage with social comments
- Make major messaging changes mid-launch based on early data
- Panic if a specific channel underperforms — wait for 24-hour data

## Post-launch retro

Run the retro within 5-7 days of launch, when the data is fresh. For Tier 1, schedule this during launch prep. For Tier 2, a Slack thread async works.

### Retro data to pull

Before the retro, gather:
- Traffic by source (UTM breakdown)
- Signups by source
- Conversion rates by source (signups ÷ visitors)
- Email metrics (open, click, unsubscribe)
- Social metrics by platform
- Comparison to previous comparable launch (if available)

### Questions to answer

1. **What was the top-performing channel** (by conversion rate, not just volume)?
2. **What was the worst-performing channel** relative to effort invested?
3. **What was surprising?** (channels that over- or under-performed expectations)
4. **Did messaging land?** (qualitative: comments, replies, email responses)
5. **Where did the funnel leak?** (high traffic, low signups → landing page problem; low traffic → distribution problem)
6. **What would you do differently?**

### Retro output

The retro should produce exactly two things:
1. **Updated distribution priorities** — which channels to invest more/less in next time
2. **Checklist updates** — additions or removals to the launch checklist based on what you learned

Document in a shared place (Notion, Linear, Confluence) so it accumulates over launches. The value compounds: after 10 launches, you have a quantitative model of what works for your product and audience.

## Building a launch history

Track every launch in a single spreadsheet or database:

| Launch | Date | Tier | Top channel | Signups (D1) | Signups (W1) | Email open rate | Notes |
|--------|------|------|-------------|--------------|--------------|-----------------|-------|

After 5+ launches, patterns emerge:
- Which channels consistently convert for your audience
- What tier of launch drives what magnitude of signups
- How your benchmarks trend over time (growth in list size, social following)

This history is your most valuable launch asset. It makes future launch planning faster and more accurate than any external benchmark.

## Companion skills

- **launch-strategy** — defines the launch tier and checklist that determines what to track
- **launch-distribution** — each channel's UTM is set up before launch day
- **launch-email** — email open/click metrics feed back into the retro
- **launch-blog-post** — blog post UTMs and organic search performance over time
