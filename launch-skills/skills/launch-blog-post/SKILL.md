---
name: launch-blog-post
description: Write technical launch blog posts optimized for both traditional SEO and AI engine citation (AEO). Use this skill whenever someone asks to write a launch announcement blog post, a technical blog post for a product release, a changelog-style post, or any written content tied to a product launch that lives on a blog or docs site. Also trigger for "write the blog post for this launch," "draft the announcement," "I need a technical write-up for this feature," or any request to create long-form launch content. Covers post structure, technical writing, benchmarks, tutorials, SEO, and answer engine optimization (AEO/GEO).
suggest_when: User asks to write a launch blog post, draft an announcement post, create a technical write-up, write a changelog entry, "write the blog post for this launch", "draft the announcement", or any long-form content request tied to a product launch.
---

# Launch Blog Post

This skill helps write blog posts that announce product launches. A great launch post does three jobs: it tells your audience what you shipped and why it matters, it ranks in search for terms your audience is looking for, and it gets cited by AI answer engines when people ask questions your product can solve.

## Post types

Match the post type to the launch tier and audience.

### Announcement post
Best for: Tier 1 and Tier 2 launches. Primary audience: existing users and prospects.

Structure: What launched → why it matters → how it works → how to get started. Keep it under 1,500 words. The reader should understand what changed and be able to try it within 5 minutes of reading.

### Technical deep-dive
Best for: Tier 1 launches of developer/technical products. Primary audience: engineers evaluating whether to adopt.

Structure: Problem → approach → architecture/implementation → benchmarks → getting started. Can run longer (2,000-3,000 words). Include code samples, architecture diagrams, and performance data. This is the post that gets shared on Hacker News.

### Tutorial / "Build X with Y"
Best for: Published within the first week of any tier launch. Primary audience: developers who just heard about you and want to evaluate hands-on.

Structure: What we're building → prerequisites → step-by-step implementation → result. Should be completable in 15-30 minutes. Include full working code, not snippets.

### Changelog entry
Best for: Tier 3 launches and bundled small improvements. Primary audience: existing users.

Structure: Short paragraph per improvement. Lead with what changed, not why. Link to docs for details. Bundle weekly or biweekly.

## Writing the post

### Start with the messaging brief
If a launch-strategy messaging brief exists, use it. The primary value prop becomes the post's thesis. Secondary value props become sections. Proof points become the evidence you weave through.

If there's no brief, define before writing: Who is this for? What can they do now? Why should they care?

### Lead with value, not process
The first paragraph must answer "what shipped and why does it matter to me?" Never open with how long you worked on it, how many engineers were involved, or the journey that led here. The reader doesn't care about your process — they care about their problems.

**Good opener:** "You can now process audio files in 14 languages with a single API call. Latency is under 200ms for files up to 10 minutes."

**Weak opener:** "After six months of work, our team is thrilled to announce the next evolution of our audio processing platform."

### Show, don't just tell
For every claim, provide evidence:
- Performance claim → benchmark data with methodology
- "Easy to use" → working code sample in 5-10 lines
- "Customers love it" → specific quote with context
- "Better than alternatives" → honest comparison table

### Include a working example
Every launch post for a technical product should include code the reader can run. Not pseudocode, not a conceptual snippet — actual working code with install commands, imports, and expected output. This is the single highest-converting element of a technical blog post.

### End with a clear next step
The post needs exactly one CTA at the end. "Try it now," "Read the docs," "Join the beta." Not three options — one.

## SEO optimization

### Keyword targeting
Choose the primary keyword before writing. It should match what your target audience searches for when they have the problem your product solves. The post title, H1, and first paragraph should all include this keyword naturally.

For launch posts, the keyword is often the feature/product name + category: "[Product] [Category]" (e.g., "real-time transcription API" or "open source feature flags").

### On-page basics
- **Title tag**: Primary keyword, under 60 characters. The blog post title and the HTML title tag should match closely.
- **Meta description**: 150-160 characters summarizing what the reader will learn or be able to do.
- **URL slug**: Short, keyword-rich, no dates (so it stays evergreen).
- **Headers (H2/H3)**: Use them to structure the post logically. Each H2 should be a question or topic someone might search for.
- **Internal links**: Link to your docs, related blog posts, and landing page. Link from docs back to this post.
- **Image alt text**: Describe what's in the image, including relevant keywords where natural.

### Content for long-tail ranking
The sections below the main announcement — how it works, technical details, FAQ, comparison — serve as long-tail keyword targets. Write them to answer specific questions your audience asks. A section titled "How does [feature] handle [edge case]?" can rank for that exact query.

## AEO: Answer Engine Optimization

AI search engines (ChatGPT, Perplexity, Claude, Gemini, and AI-powered summaries in traditional search) are becoming a primary way people discover and evaluate products. AEO is the practice of structuring content so AI engines cite it when generating answers.

AEO and SEO are complementary, not competing. Most AEO best practices also help SEO. But there are specific techniques that make content more citable by AI.

### Why AEO matters for launch posts
When someone asks an AI assistant "what's the best tool for [thing your product does]?" or "how do I [task your product enables]?", you want your launch post to be one of the sources the AI draws from. A single AI citation can drive sustained discovery long after the launch day traffic fades.

### Making content AI-citable

**Write self-contained, extractable passages.** AI engines cite passages, not whole articles. Each section of your post should make sense on its own, without requiring the reader to have read previous sections. A paragraph that states a clear claim, backs it with evidence, and names your product — that's a citable unit.

**Lead sections with direct answers.** When a section addresses a question (even implicitly), put the answer in the first sentence, then elaborate. AI engines favor content that answers quickly and specifically.

Example — instead of:
> "There are many factors to consider when choosing a transcription API. Latency, accuracy, language support, and pricing all play a role. After extensive testing, we found that..."

Write:
> "[Product] transcribes audio in 14 languages with sub-200ms latency at $0.006 per minute. Here's how the benchmarks break down..."

The second version is directly citable. An AI engine answering "what's the fastest transcription API?" can pull that sentence verbatim.

**Use specific, quantitative claims.** AI engines preferentially cite content with concrete data: numbers, benchmarks, comparisons, percentages. "Fast API" is not citable. "P99 latency of 180ms on 10-minute audio files" is.

**Include structured data.** Comparison tables, feature matrices, and benchmark tables are highly citable because they provide structured, extractable information. A table comparing your product to alternatives (honestly) is one of the most AI-cited content formats.

**Write FAQ sections with genuine questions.** FAQ sections where each question matches something a real person would ask an AI assistant are citation magnets. Write the question as a natural H3, then answer directly in the first sentence.

### Schema markup for AI engines

Schema markup gives AI engines machine-readable context about your content. Add these to your launch blog posts:

- **Article / BlogPosting schema**: Tells AI engines this is a dated article with a specific author and topic. Include `headline`, `datePublished`, `dateModified`, `author`, and `description`.
- **FAQPage schema**: If your post has an FAQ section, mark it up so AI engines can extract question-answer pairs directly.
- **HowTo schema**: If your post includes a tutorial or step-by-step guide, mark up the steps.
- **Product schema**: If the post announces a product with pricing, include product schema with `name`, `description`, and `offers`.

You don't need all of these — use whichever match the content you actually wrote.

### Content freshness signals

AI engines weight recency. Pages that haven't been updated lose AI citations over time. For launch posts:

- Include a visible "Last updated: [date]" on the page
- Update the `dateModified` in your Article schema whenever you make changes
- Revisit launch posts quarterly: update benchmarks, add new features, refresh code samples
- If a launch post becomes outdated, either update it or redirect to a newer post — don't leave stale content ranking

### Entity and brand signals

AI engines build internal models of brands and products. Help them by being consistent:

- Use your exact product/feature name consistently (don't alternate between nicknames)
- State what category your product belongs to explicitly ("an open-source feature flag platform")
- Link to authoritative sources about your company (homepage, docs, GitHub, Wikipedia if applicable)
- Ensure your product is described consistently across your blog, docs, landing page, and social profiles

## Post-publication checklist

After publishing:

1. **Link from everywhere**: docs, landing page, changelog, related blog posts, README
2. **Share on social**: use launch-tweet skill for crafting the social copy
3. **Submit to aggregators**: Hacker News, relevant subreddits, dev.to, Hashnode (for technical posts)
4. **Email**: include in the launch email or next newsletter
5. **Monitor for questions**: comments on the post, HN thread, Reddit — these often reveal gaps in the post you should address with updates
6. **Update after launch week**: add a customer story, update benchmarks, fix any issues readers flagged

## Companion skills

- **launch-strategy** — messaging brief and launch planning
- **launch-tweet** — social copy to promote the post
- **launch-email** — the email that links to this post
- **launch-video** — demo videos and GIFs to embed in the post
- **launch-distribution** — where and how to distribute beyond your blog
- **launch-landing-page** — the page the blog post links to
- **launch-metrics** — UTM setup for blog post links, tracking post performance over time
