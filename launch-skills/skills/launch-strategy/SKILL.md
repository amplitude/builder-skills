---
name: launch-strategy
description: Plan and execute product launches using a tiered framework — from major new products down to small improvements. Use this skill whenever someone asks to plan a launch, create a launch checklist, define launch tiers, write launch messaging, or coordinate a product release. Also trigger when someone says "we're launching X" or "how should we announce this feature" or "what's our launch plan" — even if they don't use the word "strategy." Covers messaging, naming, launch assets, timelines, and post-launch retros. This is the master launch skill; it references the companion skills (launch-tweet, launch-landing-page, launch-distribution, launch-email, launch-video, launch-metrics) for specific execution.
suggest_when: User asks to plan a launch, create a launch checklist, define launch tiers, write messaging, coordinate a release, "we're launching X", "how should we announce this", "what's our launch plan", "plan the GTM", "launch playbook", or any product release planning request.
---

# Launch Strategy

This skill helps plan and execute product launches using a structured, repeatable framework. The core insight: most teams only do big splashy launches. By treating *every* ship as a potential launch moment — scaled to its significance — you build consistent awareness, acquisition, and activation. The goal is a launch engine, not a one-off event.

## Launch tiers

Every release maps to one of three tiers. The tier determines how much effort goes into messaging, assets, and distribution.

### Tier 1: Major new product or platform shift
Full launch. This is your marquee moment — a new product, a major rebrand, a platform expansion. Expect 2-4 weeks of preparation.

**Typical assets:** launch video (motion design or founder narrative), dedicated landing page, blog post, press outreach, social campaign (all platforms), email to full list, internal amplification push.

### Tier 2: Major new feature
A meaningful addition that changes what users can do. Enough to warrant its own announcement, but not a full media push. Expect 1-2 weeks of prep.

**Typical assets:** launch tweet/thread, blog post or changelog entry, updated landing page section, email to relevant segment, social posts across 2-3 platforms.

### Tier 3: Smaller improvements and iterations
Bug fixes, UI polish, incremental improvements. Still worth announcing — they signal momentum and care. Prep time: a few hours to a day.

**Typical assets:** changelog entry, single social post, optional email mention in a digest.

### Choosing the tier

Ask: "If a potential customer saw this announcement, would it change their perception of what the product can do?" If yes → Tier 1 or 2. If it's more about quality and reliability → Tier 3.

When in doubt, tier up. Under-launching is more common than over-launching. A Tier 2 launch that should have been Tier 3 costs a few extra hours. A Tier 1 launch treated as Tier 3 is a missed growth opportunity.

## Messaging framework

Messaging comes before everything else. Don't build assets until messaging is locked. A mediocre video with great messaging outperforms a beautiful video with confused positioning.

### The messaging brief

For every launch (any tier), define:

1. **Name** — What are you calling this? For features with SEO potential, use search data to choose. Check what people actually search for (e.g., "speech to text" vs. "transcription API" — pick the one with more volume if the audience matches). Tools like Google Trends and keyword research platforms help here.

2. **Audience** — Who specifically benefits? Be precise. "Developers" is too broad. "Backend engineers building real-time voice apps" gives you something to write toward.

3. **Primary value prop** — One sentence. What can they do now that they couldn't before, or what's dramatically better? This becomes the headline everywhere.

4. **Secondary value props** — 2-3 supporting points. These fill out the blog post, landing page sections, and thread tweets.

5. **Proof points** — Numbers, benchmarks, comparisons, customer quotes. Anything that makes the value props concrete rather than aspirational.

### Messaging test

Read your primary value prop out loud. If it could describe a competitor's product just as well, it's too generic. The best value props are specific enough that someone in the target audience immediately knows whether this is for them.

## Launch checklist system

Create a master checklist with every possible launch action, organized by tier. For each new launch:

1. Copy the master checklist into a new instance (new tab, new ticket, new page)
2. Delete rows that don't apply to this tier/launch
3. Assign owners and due dates to remaining rows
4. Use it as the single source of truth through launch day

### Tooling

Pick one system and commit. The specific tool matters less than consistent use.

- **Spreadsheet** (Google Sheets, Notion table) — Simplest. Works well for small teams. One master sheet, one tab per launch. Downside: no built-in assignments or notifications.
- **Project management tool** (Linear, Asana, Notion) — Better for teams. Create a launch template project. Each launch gets a copy with assignable tasks and due dates. Linear labels or Asana sections can map to the tier columns below.
- **Docs + checklist** (Notion, Google Docs) — Middle ground. A template doc with checkboxes. Easy to copy, harder to track status across launches.

Whichever tool you use, keep the master template updated after every retro. The template is a living document — it gets better with each launch.

### Checklist template structure

| Category | Action | Tier 1 | Tier 2 | Tier 3 | Owner | Due | Status |
|----------|--------|--------|--------|--------|-------|-----|--------|
| Messaging | Write messaging brief | ✓ | ✓ | ✓ | | | |
| Messaging | SEO keyword research for naming | ✓ | Optional | — | | | |
| Assets | Launch video | ✓ | Optional | — | | | |
| Assets | Landing page (new or updated) | ✓ | ✓ | — | | | |
| Assets | Blog post | ✓ | ✓ | Optional | | | |
| Assets | Changelog entry | ✓ | ✓ | ✓ | | | |
| Social | Launch tweet/thread | ✓ | ✓ | ✓ | | | |
| Social | LinkedIn post | ✓ | ✓ | Optional | | | |
| Social | Other platforms (BlueSky, Threads) | ✓ | Optional | — | | | |
| Distribution | Product Hunt submission | ✓ | Optional | — | | | |
| Distribution | Hacker News post | ✓ | Optional | — | | | |
| Distribution | Press/journalist outreach | ✓ | — | — | | | |
| Distribution | Influencer/network repost asks | ✓ | ✓ | — | | | |
| Email | Full list announcement | ✓ | — | — | | | |
| Email | Segment-specific email | Optional | ✓ | — | | | |
| Email | Changelog digest mention | — | Optional | ✓ | | | |
| Internal | #amplify channel post | ✓ | ✓ | Optional | | | |
| Internal | Team briefing | ✓ | Optional | — | | | |
| Tracking | Set up UTMs for all links | ✓ | ✓ | Optional | | | |
| Tracking | Verify analytics events fire | ✓ | Optional | — | | | |
| Tracking | Capture baseline metrics | ✓ | ✓ | — | | | |
| Post-launch | Schedule retro (1 week out) | ✓ | ✓ | — | | | |

## Launch timeline

### Tier 1 timeline (2-4 weeks)

**Weeks 3-4 out:** Lock messaging brief. Begin landing page and video production. Start press outreach (journalists need lead time).

**Weeks 1-2 out:** Finalize all assets. Write social copy. Prepare email. Brief internal team. Set up tracking (UTMs, analytics events). Do a dry run of the distribution sequence.

**Launch day:** Execute distribution in sequence — social first (morning), then email, then press embargo lifts. Monitor and engage with comments/replies all day.

**Week after:** Run retro.

### Tier 2 timeline (1-2 weeks)

**Week 2 out:** Lock messaging. Start blog post and landing page updates.

**Week 1 out:** Finalize copy. Write social posts. Prepare email segment.

**Launch day:** Post social, publish blog, send email. Engage with responses.

**3-5 days after:** Quick retro (async, e.g., a Slack thread).

### Tier 3 timeline (same day or next day)

Ship it. Write a changelog entry and a social post. Done. If it's part of a batch of small improvements, bundle them into a weekly digest.

## Post-launch retro

Don't skip this. The retro is what turns individual launches into a compounding launch engine.

### What to cover

1. **What worked?** Which channels drove the most traffic, signups, or engagement? What messaging resonated?
2. **What didn't?** Which assets underperformed? Where did the timeline slip?
3. **Surprises?** Did an unexpected channel blow up? Did a specific framing land better than expected?
4. **Numbers** — Traffic, signups, activation, social engagement, press mentions. Compare to previous launches if you have the data.
5. **Checklist updates** — Add or remove items from the master checklist based on what you learned.

### Retro format

Keep it lightweight. A Slack thread or 15-minute call works for Tier 2. Tier 1 deserves a short doc. The key output is specific changes to the checklist and process, not a retrospective essay.

## The "everything is a launch" philosophy

If you're shipping multiple times a month but only launching a few times a quarter, you're leaving growth on the table. Every ship is an opportunity to tell your story, remind people you exist, and show momentum.

This doesn't mean every bug fix gets a press release. It means every improvement gets *some* announcement, scaled to its significance. Tier 3 launches take minutes. The compound effect of consistent visibility is enormous.

Build the habit: when the PR merges, the launch checklist opens.

## Working with companion skills

This skill handles strategy and planning. For execution, point to:

- **launch-tweet** — Crafting the social copy (tweets, threads, LinkedIn, cross-platform)
- **launch-email** — Email subject lines, announcement structure, segmentation, changelog digests
- **launch-blog-post** — Writing the announcement post (structure, SEO, AEO)
- **launch-video** — Demo videos, GIFs, screenshots, and programmatic video with Remotion
- **launch-landing-page** — Building the landing page (structure, urgency mechanics, SEO, conversion)
- **launch-distribution** — Channel-by-channel distribution and launch day sequencing
- **launch-metrics** — UTM setup, KPIs by tier, benchmark expectations, retro data framework
