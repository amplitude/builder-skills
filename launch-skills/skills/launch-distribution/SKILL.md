---
name: launch-distribution
description: Plan and execute multi-channel distribution for product launches across X/Twitter, Reddit, LinkedIn, Hacker News, and other platforms. Use this skill whenever someone asks to create a distribution plan, figure out where to post a launch, build a press list, set up internal amplification, or coordinate multi-channel promotion. Also trigger for "where should we post this," "how do we get the word out," or any request about promoting or distributing a product announcement. Covers channel strategy (with deep playbooks for Twitter, Reddit, and LinkedIn), post-launch retro, and building a repeatable distribution engine.
suggest_when: User asks to create a distribution plan, figure out where to post, set up internal amplification, coordinate multi-channel promotion, "where should we post this", "how do we get the word out", "help with Product Hunt", or any request about promoting a product announcement.
---
**User context:** $ARGUMENTS

> If the above is blank, ask the user to share the relevant context before proceeding.


# Launch Distribution

This skill covers the "where and how" of getting your launch in front of people. Great messaging and assets are wasted without distribution. The goal isn't to be everywhere — it's to be effective everywhere you show up, and to build a repeatable system that gets better with each launch.

## Distribution philosophy

Two principles:

1. **Go wide, then double down.** Post to every relevant channel on launch day. You won't know in advance which one will hit. After the launch, look at the data and invest more in what worked.

2. **Launch is day one, not the whole story.** The initial push drives awareness, but the long tail — SEO, word of mouth, community — drives sustained growth. Distribution planning should account for both.

## Channel playbook

The three highest-ROI channels for most product launches are X/Twitter, Reddit, and LinkedIn. Master these first, then layer on additional channels.

### X/Twitter (primary channel)

X is the default launch channel for tech products. It's where the initial wave of awareness starts, and strong performance here cascades into other channels (people screenshot tweets for LinkedIn, link to threads on Reddit, etc.).

**Timing and mechanics:**
- Post the launch tweet early in the day (morning, your audience's timezone)
- The algorithm rewards early engagement heavily — the first 60-90 minutes determine reach
- Have 5-10 people with relevant audiences ready to retweet or quote-tweet within the first hour
- Engage actively with every reply for the first 2-3 hours. Don't just like — respond substantively

**Maximizing reach:**
- Pin the launch tweet to your profile for the full launch week
- Quote-tweet your own launch with different angles over the next 2-3 days (different value props, use cases, metrics)
- If the launch tweet gets traction, post a follow-up thread going deeper within 24 hours
- Monitor who's engaging — reply to anyone with a meaningful audience, they may reshare

**See launch-tweet** skill for crafting the actual posts (first line hooks, thread structure, media rules).

### Reddit (highest-quality discussions)

Reddit is underrated for launches. The discussion quality is high, the audience is technical and opinionated, and a good Reddit post has a much longer shelf life than a tweet. Subreddit posts surface in search results for months.

**Finding the right subreddits:**
- Identify 2-4 subreddits where your target audience hangs out. Think beyond the obvious — niche subreddits with 10K-100K members often convert better than giant ones.
- Read each subreddit's rules carefully. Many ban or restrict self-promotion. Some have specific days or threads for launches. Some require a minimum account age or karma.
- Lurk before you launch. If you've never participated in a subreddit, your launch post will feel (and be flagged as) drive-by spam.

**Post framing:**
- Best format: "I built X to solve Y" — genuine story about the problem and what you built. Community contribution, not advertisement.
- Show vulnerability: what you got wrong, what's still rough. Reddit rewards honesty and punishes polish.
- Write a substantive text post with the link embedded, not a link-only post.

**Engagement:**
- Engage with every comment, even critical ones. Don't get defensive — acknowledge valid points, explain trade-offs.
- Check back 12 and 24 hours later — Reddit threads have a longer active period than tweets.

### LinkedIn (strongest for B2B)

LinkedIn is the highest-performing channel for B2B and enterprise product launches. The audience is buying-decision-makers, and the organic reach for strong posts is remarkably high compared to other platforms.

**Amplification mechanics:**
- Have 3-5 team members or allies post comments within the first hour. LinkedIn's algorithm treats early comments as a strong quality signal.
- Encourage team members to reshare with their own commentary (not just clicking "repost"). A reshare with original commentary gets 3-5x the reach of a plain repost.
- Tag relevant people and companies, but only if they'd genuinely care. Gratuitous tagging looks desperate.
- Founder/personal accounts consistently outperform company page posts by 3-10x. Use a personal account as the primary post.

**See launch-tweet** skill for LinkedIn post format, hook structure, and tone.

### Hacker News

- "Show HN" for new products; regular submission for significant updates
- Title: factual and specific, no marketing language. "Show HN: [Name] – [plain description of what it does]"
- Best times: weekday mornings (US Eastern)
- Be present in the comments. Answer every question, especially technical ones. Honesty and depth go a long way; marketing-speak kills HN posts
- HN front page drives massive traffic but modest signups — expect a lot of lookers. Don't count on it as a reliable channel, but when it hits, the backlinks and awareness are worth it

### Other channels

**BlueSky / Threads** — Smaller audiences but growing. Lower competition means higher visibility per post. Worth posting to — minimal effort, occasional outsized results.

**Product Hunt** — PH can drive 1,000+ visitors in 24 hours and provide useful social proof (badges, rankings). However, the editorial team now manually curates the homepage, making success less predictable. AI products face extra scrutiny. Budget 50-120 hours for a serious PH launch, so it's best reserved for Tier 1 moments when you have the bandwidth. If you do launch: Tuesday or Wednesday at 12 AM PST, respond to every comment, and don't ask for upvotes directly.

**Email** — Tier 1: full list announcement. Tier 2: segmented to relevant users. Tier 3: include in changelog digest. Send emails after social posts (gives social a head start on engagement). See **launch-email** skill for subject lines, structure, and segmentation.

**Press and journalists** — Only for Tier 1 launches. Build your own contact list over time. Reach out 1-2 weeks before launch with an exclusive or early look. Give journalists data, trend context, or a contrarian take — not just a press release. Don't expect coverage; press is a bonus, not a distribution strategy.

**Blog / content** — Publish a blog post for Tier 1 and Tier 2 launches (see **launch-blog-post** skill). Cross-post or syndicate to dev.to, Medium, Hashnode for technical products. Include a tutorial within the first week. Link from docs to the blog post and vice versa.

## Internal amplification

This is the most underused distribution lever. Your team has a collective social reach that likely exceeds your company account.

### Set up an #amplify channel
Create a dedicated Slack/Teams channel where you post launch assets and copy that team members can share on their personal accounts. Make it easy:
- Pre-written copy they can customize
- Direct links to the posts to like/retweet/comment on
- Clear ask: "Please share this in the next 2 hours"

### Make it cultural
The #amplify channel only works if leadership uses it and participation is normalized. It shouldn't feel like an obligation — frame it as "here's something cool we shipped, help us get the word out." Celebrate team members who drive engagement.

### Network and influencer asks
For Tier 1 launches, personally reach out to 10-20 people with relevant audiences and ask for a reshare. These should be genuine connections, not cold outreach. A quote-tweet with personal commentary from someone respected in your space is worth more than 100 company retweets.

## Distribution sequence

On launch day, timing matters. Here's a typical sequence:

**Early morning (6-8 AM, audience timezone):**
- Post on X/Twitter
- Submit to Hacker News (if applicable)

**Mid-morning (9-11 AM):**
- Post on LinkedIn
- Post on Reddit (target subreddits)
- Post on BlueSky, Threads
- Send #amplify channel notification
- Publish blog post

**Late morning / early afternoon:**
- Send email announcement
- Reach out to press contacts (if applicable)
- Personal DMs to key influencer contacts asking for reshares

**Throughout the day:**
- Monitor and engage on all channels
- Respond to every comment, question, and mention
- Share interesting replies/discussions in #amplify

## Post-launch retro

Run the retro within a week of launch (see launch-strategy for the full retro framework). For distribution specifically, capture:

1. **Channel performance** — Which channels drove the most traffic? Most signups? Most engagement? Track with UTM parameters.
2. **Surprises** — Did an unexpected channel work well? Did a "sure thing" channel underperform?
3. **Network effects** — Which reshares or mentions drove the most downstream traffic? These are your best amplification partners for next time.
4. **Timing** — Was the sequence right? Should anything have gone earlier or later?
5. **Effort vs. impact** — Where did you spend the most time? Was it worth it? This informs how you allocate for the next launch.

Update your distribution checklist based on findings. The goal is to make each launch easier and more effective than the last.

## Building the distribution engine

Distribution isn't a one-time plan — it's a system. Over successive launches:

- **Grow your #amplify culture** so team participation is automatic
- **Build your press and influencer Rolodex** with every launch
- **Track channel performance** over time to know your reliable channels vs. lottery tickets
- **Develop platform-specific intuition** — what works on X vs. Reddit vs. LinkedIn vs. HN is different, and you learn by doing
- **Reuse and templatize** — your launch sequence, email templates, social formats should get refined, not reinvented each time

The best distribution is a habit, not a heroic effort.

## Companion skills

- **launch-strategy** — defines the launch tier and checklist that drives which channels to activate
- **launch-tweet** — crafting the actual social copy for each platform
- **launch-email** — email subject lines, structure, and segmentation
- **launch-blog-post** — the long-form content that social and email point to
- **launch-video** — the visual assets (demo video, GIFs, screenshots) embedded in posts
- **launch-metrics** — UTM setup and post-launch channel performance analysis
