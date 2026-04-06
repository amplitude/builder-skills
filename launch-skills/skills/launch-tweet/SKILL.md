---
name: launch-tweet
description: Craft launch tweets, announcement threads, and social posts for product launches across X/Twitter, LinkedIn, BlueSky, and Threads. Use this skill whenever someone asks to write a launch tweet, draft an announcement thread, create social copy for a product release, or repurpose launch messaging for different platforms. Also trigger for "write the tweet for this launch," "help me announce this on Twitter/X," "draft a LinkedIn post for our new feature," or any request to write social media content tied to a product ship. Handles single tweets, multi-tweet threads, and cross-platform adaptation.
suggest_when: User asks to write a launch tweet, draft an announcement thread, create social copy, "write the tweet", "help me announce this on Twitter", "draft a LinkedIn post", or any social media content request tied to a product launch.
---
**User context:** $ARGUMENTS

> If the above is blank, ask the user to share the relevant context before proceeding.


# Launch Tweet

This skill helps craft social media announcements for product launches. The principles here are platform-aware — what works on X doesn't copy-paste to LinkedIn — but the core goal is the same: stop the scroll, communicate value, and drive action.

## Single launch tweet

The single tweet is your most important launch asset. Even if you're doing a full thread, this tweet needs to work on its own because most people will only see it.

### Structure

```
[Strong first line — what you launched, framed as value]

[1-2 sentences expanding on what it does / why it matters]

[Media: video, GIF, or screenshot — attached, not linked]
```

### Rules

1. **First line does all the work.** It must make clear you're launching something and why anyone should care. No "excited to announce" or "after months of hard work" — lead with the product value.

2. **Media in the first tweet.** Always. A tweet with a video or image gets dramatically more engagement than text alone. Attach the media directly — don't link to YouTube or an external page.

3. **No link in the first tweet.** Platform algorithms penalize external links. Put your link in a reply or the second tweet of a thread. If you must include a link and want the preview card to render, keep the entire tweet (including URL) under 280 characters.

4. **Specificity over hype.** "Now you can build voice apps in 5 lines of code" beats "Revolutionary new API." Numbers, concrete use cases, and before/after comparisons stop the scroll.

### Examples

**Good first lines:**
- "Introducing [Product]: [concrete thing it does]"
- "[Product] now does [specific capability]. Here's what that means →"
- "You can now [action] with [product]. No [previous friction point] required."
- "We just shipped [feature]. [One-line proof point or result]."

**Weak first lines (avoid):**
- "Excited to announce..." (buries the value)
- "After months of hard work..." (nobody cares about your timeline)
- "Thread 🧵" (penalized, provides no value)
- "Big news!" (empty hype)

## Launch threads

Threads work for Tier 1 and some Tier 2 launches where you have enough substance to fill 4-8 tweets without padding.

### Thread structure

**Tweet 1: The hook**
Same rules as the single tweet. This must work standalone. Include your best media (video or key screenshot). No link.

**Tweets 2-4: Value props and proof**
Each tweet covers one value prop or proof point. Include supporting media — screenshots, GIFs, short demo clips. Visual breaks every 2-3 tweets keep people scrolling.

**Tweet 5-7 (optional): Social proof or use cases**
Customer quotes, benchmarks, comparisons, example use cases. This is where you make the value concrete.

**Final tweet: Call to action + link**
This is where the link goes. Be specific about what happens when they click: "Try it free →", "See the docs →", "Watch the full demo →".

### Thread principles

- **5-8 tweets is the sweet spot** for launch content. Threads over 15 see sharp engagement drop-off.
- **Each tweet must provide value on its own.** People drop off at every tweet — don't build toward a punchline at tweet 7.
- **Visual breaks matter.** Alternate between text-heavy and media-heavy tweets.
- **No filler tweets.** If you can't fill 5 tweets with substance, do a single tweet instead.

## Cross-platform adaptation

The same announcement needs different treatment on each platform. Don't just copy-paste.

### X/Twitter
- Concise, punchy, visual-first
- Thread format for bigger launches
- Hashtags: use sparingly (1-2 max) or skip entirely
- Best engagement: mornings and early afternoon (audience-dependent)

### LinkedIn
- Longer-form, more narrative
- Open with a hook but can be more contextual than X
- Works well for B2B launches and technical products
- Include 3-5 line breaks for readability (LinkedIn truncates after ~3 lines, so the first 3 lines must earn the "see more" click)
- Tag relevant people and companies
- No hashtag stuffing — 3 max, at the end

### BlueSky
- Similar to X in format and tone
- Slightly more technical/niche audience (as of 2025-2026)
- Threads work well here
- Less algorithmic amplification — rely more on community sharing

### Threads
- More casual, conversational tone
- Shorter posts tend to work better
- Cross-posting from Instagram helps distribution
- Less business/tech-native audience — frame for broader appeal

### Hacker News
- Not a "post" in the social media sense — it's a submission with a title
- Title should be factual and specific, not hype-y: "Show HN: [Product] – [what it does in plain terms]"
- The discussion thread matters more than the submission itself
- Be ready to answer technical questions honestly and in detail
- Don't ask people to upvote — it will backfire

## Writing process

When drafting launch social copy, follow this sequence:

1. **Start with the messaging brief** (from launch-strategy). If there's no brief, ask for: product/feature name, target audience, primary value prop, and 2-3 secondary value props.

2. **Write the X/Twitter version first.** The character constraint forces clarity. If the value prop doesn't fit in a tweet, the messaging isn't sharp enough.

3. **Expand to a thread** if the launch warrants it (Tier 1 or substantial Tier 2). Map each secondary value prop to a tweet.

4. **Adapt for other platforms.** LinkedIn gets more context and narrative. BlueSky stays concise. Hacker News gets a factual title.

5. **Draft multiple first-line options.** The first line is the highest-leverage sentence. Write 3-5 variants and pick the one that best balances clarity, specificity, and scroll-stopping power.

## Common mistakes

- **Linking in the first tweet.** It tanks reach. Always put links in a reply or later in the thread.
- **No media.** Text-only launch tweets underperform dramatically. Even a screenshot is better than nothing.
- **Burying the value.** Three sentences of preamble before saying what you launched. Lead with the product.
- **Same copy everywhere.** Each platform has different norms. Copy-paste looks lazy and performs poorly.
- **Thread padding.** If you're adding tweets just to make the thread longer, cut them. Short and strong beats long and diluted.
- **Forgetting the CTA.** Every launch post needs a clear next step for the reader. What do you want them to do?

## Companion skills

- **launch-strategy** — messaging brief that feeds the social copy
- **launch-email** — email subject lines follow the same "first line" craft as tweets
- **launch-video** — the demo video or GIF that goes in the tweet (attached, not linked)
- **launch-distribution** — when and where to post, and how to amplify
- **launch-metrics** — track which social posts drive signups via UTMs
