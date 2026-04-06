---
name: launch-landing-page
description: Design and build launch landing pages that convert visitors into users. Use this skill whenever someone asks to create a landing page for a product launch, build a feature page, design a signup page, or structure a product marketing page. Also trigger for "make a page for this launch," "I need a landing page," "help me design the product page," or any request to create a web page tied to a product release or feature announcement. Covers page structure, hero design, SEO integration, developer-first patterns, urgency mechanics, waitlist flows, and conversion optimization.
suggest_when: User asks to create a landing page, build a feature page, design a signup page, "make a page for this launch", "I need a landing page", "help me design the product page", set up a waitlist, or any web page request tied to a product launch.
---
**User context:** $ARGUMENTS

> If the above is blank, ask the user to share the relevant context before proceeding.


# Launch Landing Page

This skill helps design and build landing pages for product launches. A great landing page does two things: it communicates value fast, and it gets visitors to the "wow moment" as quickly as possible. Everything else is secondary.

## The two design questions

Before writing a single line of copy or code, answer these:

1. **"How can we get the visitor to experience the 'wow' moment as quickly as possible?"**
   The best landing pages let visitors *use* the product, not just read about it. For developer tools, this might mean an embedded playground. For SaaS, a live demo. For AI products, a widget that runs inference right on the page. The lower the friction between "I landed here" and "oh, this is great," the higher your conversion.

2. **"How can we make this page so well-designed that it becomes remarkable on its own?"**
   A landing page that people screenshot and share on social media extends the launch beyond the initial push. This doesn't mean over-designed — it means thoughtful, polished, and distinctive.

## Page structure

### Hero section
This is the only section that matters for most visitors. 60-80% of visitors never scroll past it.

**Components:**
- **Headline** — Your primary value prop from the messaging brief. One sentence, specific, benefit-focused. Should answer "what can I do with this?" not "what is this?"
- **Subheadline** — 1-2 sentences expanding on the headline. Add specificity — who it's for, how it works, or a key proof point.
- **Primary CTA** — One clear action. "Try it free," "Get started," "See it in action." Not two CTAs competing for attention.
- **Visual** — Product screenshot, demo video, or interactive widget. Never a stock photo. Show the actual product doing the thing the headline promises.

### Supporting sections (scroll depth)

Only include sections that earn their space. Each section should address a specific objection or expand on a secondary value prop.

**Common sections (pick the ones that matter for this launch):**

- **How it works** — 3-step or visual walkthrough. Reduces "is this too complicated?" objection.
- **Key features/capabilities** — 3-4 cards or columns. Each one a secondary value prop with a specific example or screenshot.
- **Social proof** — Customer logos, quotes, usage stats, benchmark results. Reduces "is this legit?" objection.
- **Comparison** — If you're entering a market with known alternatives, show a clear comparison. Be honest — cherry-picked comparisons erode trust.
- **Pricing** — If pricing is a competitive advantage, surface it early. If it's complex or enterprise-focused, link to a separate pricing page.
- **Technical details** — For developer and technical audiences. Code samples, API references, architecture diagrams.
- **FAQ** — For objections that don't fit elsewhere. Keep it short — 4-6 questions max.

### Footer CTA
Repeat the primary CTA at the bottom for visitors who scrolled the whole way. They're your most engaged audience — make it easy to convert.

## Developer-first patterns

For technical products and developer tools, these patterns consistently convert well:

### Reduce friction ruthlessly
The two biggest friction points for developers evaluating tools are **cost** and **access**. Address both on the landing page:
- Free tier or trial with no credit card required
- Instant access — no "request a demo" gate for individual users
- Clear, transparent pricing visible on the page

### Let them try before signing up
The most effective developer landing pages let visitors experience the product without creating an account. Examples:
- Embedded code playground or REPL
- API endpoint you can hit from the page
- Interactive demo with real output
- "Paste your data/code here and see results" widget

### Show real code
Developers want to see what integration actually looks like. Include:
- Install command (`npm install`, `pip install`, etc.)
- Minimal working example (5-10 lines that do something useful)
- Copy button on all code blocks

### Lead with capabilities, not features
"Process 10,000 documents per second" is more compelling than "Distributed processing engine." Developers care about what they can build and at what scale.

## SEO integration

A launch landing page is an SEO opportunity. The initial launch drives backlinks (from press, social, blog posts) that help the page rank long-term. Build for this from the start.

### Naming for search
If this is a new product or feature, consider search volume when choosing the name. The name should match what your target audience actually searches for. "Speech to Text API" might get more search traffic than "Audio Transcription Service" — or vice versa. Use keyword research to decide.

### On-page SEO basics
- **Title tag** — Include the primary keyword. Keep under 60 characters.
- **Meta description** — Compelling summary with keyword. 150-160 characters.
- **H1** — Should match or closely mirror the title tag.
- **Internal links** — Link from your docs, blog, and other pages to this landing page. Link from this page to relevant docs and tutorials.
- **Page speed** — Fast pages rank better and convert better. Optimize images, minimize JavaScript, use CDN.

### Content for long-term ranking
The sections you add below the hero (how it works, features, FAQ) serve double duty as indexable content. Write them for humans first, but use the language your audience uses when searching.

## Conversion optimization

### One primary CTA
Every page has one primary action you want visitors to take. Everything else is secondary. If you're asking visitors to "Sign up," "Book a demo," "Join the waitlist," AND "Read the docs" with equal visual weight, you're asking them to choose — and many will choose to leave instead.

### Reduce form fields
Every field you add to a signup form costs you conversions. Ask for the minimum needed to get them started. You can collect more information later.

### Speed matters
Page load time directly affects conversion rate. Every second of load time costs roughly 7% of conversions. For landing pages specifically: lazy-load below-fold content, optimize hero images, minimize third-party scripts.

### Mobile-first
40-60% of launch traffic often comes from mobile (people clicking links from social media on their phones). The hero section must work on a phone screen. Test the CTA button on mobile — can you tap it easily?

## Launch-specific patterns

Landing pages for launches have constraints that evergreen product pages don't — they're time-sensitive, they need to convert a wave of traffic in a short window, and they often serve an audience that's hearing about the product for the first time.

### Urgency and scarcity

For Tier 1 launches where you want to concentrate signups into a narrow window:

- **Launch pricing or early access window** — "Free for the first 1,000 users" or "50% off for launch week" gives a concrete reason to act now instead of bookmarking. Display the deadline or remaining spots visibly.
- **Countdown timer** — Use sparingly and only when the deadline is real (beta closes, pricing changes, access is limited). Fake urgency erodes trust.
- **Social proof in real-time** — "1,247 developers signed up today" or a live counter. This signals momentum and reduces "am I the only one trying this?" hesitation.

Don't stack all of these. Pick one urgency mechanism that's genuine and make it prominent.

### Waitlist flows

If the product isn't generally available yet, the landing page becomes a waitlist page. Waitlist pages convert at 2-5x the rate of standard signup pages because the scarcity is real.

- **Single field**: Email only. Every additional field costs you waitlist signups.
- **Position feedback**: "You're #847 on the waitlist" makes the signup feel concrete and gives you a re-engagement hook ("You're almost up!").
- **Referral mechanic** (optional): "Move up the waitlist by sharing with friends." Only add this if you can actually fulfill on it — broken referral mechanics damage trust.
- **Set expectations**: "We're letting in 200 users per week" or "Expect access within 2 weeks." Silence after signup kills interest.

### Pre-launch, launch day, and post-launch states

A launch landing page isn't static — it should evolve through three phases:

**Pre-launch (1-2 weeks before):**
- Teaser copy: what's coming, who it's for, when it launches
- Waitlist or "notify me" signup
- No product details beyond the primary value prop

**Launch day:**
- Full page: hero, demo, features, social proof, CTA
- Direct access: "Try it now" or "Get started free"
- Launch video or demo embedded in hero
- Any urgency mechanics active (countdown, launch pricing)

**Post-launch (1 week after → permanent):**
- Remove time-sensitive elements (countdown, "just launched" language)
- Add social proof that accumulated during launch (user count, testimonials, press logos)
- Optimize for SEO: this is now a permanent product page
- Update CTA to reflect the ongoing state ("Get started" vs. "Join the launch")

Plan for all three states before building. The pre-launch and post-launch states often get forgotten, leading to stale pages with expired countdowns or "just launched!" copy months after launch.

## Launch page vs. permanent product page

For Tier 1 launches, consider building a dedicated launch page *and* a permanent product page:

- **Launch page** — Optimized for the launch moment. Includes urgency mechanics, launch video, concentrated CTA. Temporary — plan to retire it.
- **Product page** — The permanent home for this product/feature. Optimized for ongoing discovery and SEO. Replaces the launch page after the launch window closes (typically 1-2 weeks).

**Transition plan**: Before launch, decide when and how the launch page becomes the product page. The simplest approach: build the product page first, add a temporary launch-specific hero and urgency section on top, then remove those elements post-launch. This avoids building two separate pages.

For Tier 2 and below, update the existing product page. Don't create separate pages for features — they fragment your SEO.

## Building the page

When actually implementing a landing page, keep in mind:

- **Start with copy, not design.** Write all the text first based on the messaging brief. The copy determines the structure — not the other way around.
- **Use a proven layout.** Hero → social proof → features → how it works → CTA. You can reorder, but don't reinvent the layout unless the product demands it.
- **Design for scanners.** Most visitors scan, not read. Headlines, subheadlines, and visuals should tell the story even if body text is skipped.
- **Test the 5-second rule.** Show someone the page for 5 seconds and ask what the product does. If they can't answer, the hero needs work.

## Companion skills

- **launch-strategy** — messaging brief that drives the page copy and structure
- **launch-video** — the demo video and screenshots that go on the page
- **launch-blog-post** — the post the page links to (and vice versa, for SEO)
- **launch-distribution** — driving traffic to the page
- **launch-metrics** — tracking page conversion rate and traffic sources via UTMs
