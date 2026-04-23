---
name: source-outranker
description: >
  Use this skill whenever a user wants to understand which external sources are being cited by AI
  models on topics relevant to their brand, and wants to create content that will outrank those
  sources — whether they say "what sources are AI models citing", "why is [third-party site] being
  cited instead of us", "we want to be the definitive source on X", "build something that gets cited
  more than G2 or TechRadar", "create an authoritative asset", or any variation where the goal is
  producing a new reference asset (definition page, benchmark, methodology, glossary, comparison hub)
  designed to beat existing top-cited sources. This skill analyzes AI Visibility source data,
  reverse-engineers what makes top-cited pages authoritative, and produces a superior source asset —
  then pushes it to CMS as a draft. Trigger on any mention of "sources", "third-party citations",
  "authoritative content", "definitional pages", or "outrank".
---

# Source Outranker

You're helping a content team become the primary source AI models cite — not just for brand queries,
but for category-defining questions. When an AI is asked "what is product analytics" or "how do
digital analytics tools work", it cites whichever page it considers most authoritative. This skill
finds those pages, figures out what makes them win, and builds something better.

---

## Step 0 — CMS Discovery (run once at the start of every session)

Before doing anything else, figure out where the new content will land. This avoids a copy-paste
dead end at the end of the workflow.

### Check for already-connected CMS tools

Scan the tools currently available in your context. Known CMS MCP patterns:

| CMS | Tool name patterns to look for |
|-----|-------------------------------|
| Sanity | `sanity`, `create_documents_from_markdown`, `patch_document_from_markdown` |
| Contentful | `contentful`, `create_entry`, `update_entry` |
| HubSpot CMS | `hubspot`, `update_blog_post`, `create_blog_post` |
| WordPress | `wordpress`, `wp_update_post`, `wp_create_post` |
| Ghost | `ghost`, `update_post`, `create_post` |
| Webflow | `webflow`, `update_cms_item`, `create_cms_item` |

**If a CMS MCP is already connected:** confirm in one line:
*"I can see [CMS] is connected — I'll push the new source asset there as a draft when we're done.
Sound good?"* Then proceed to Step 1.

**If nothing is connected:** ask once, concisely:

> "Before we start — which CMS do you publish to? I can push the content directly there as a
> draft instead of handing you a block of text to paste."

Offer: Sanity · Contentful · HubSpot · WordPress · Webflow · Ghost · Other · "Just give me the
content"

Then give a tailored setup recommendation based on their answer (same guidance as in
`prompt-gap-to-publish`). Don't block on setup — start the analysis immediately and say you'll be
ready to push by the time they're connected.

---

## Step 1 — Identify the Brand and Pull Top-Cited Sources

Use `list_ai_visibility_org_brands` to identify the brand (or use what the user specified).

Then call `get_ai_visibility_sources` with the selected `orgBrandId`, sorted by `citationCount`
descending. This returns every domain being cited by AI models on topics relevant to the brand, with
fields including: `domain`, `citationCount`, `responseCount`, `url`, `title`.

Separate the results into two groups:
- **Owned sources**: pages on the brand's own domain (e.g., `amplitude.com`)
- **Third-party sources**: everything else — review sites, media, documentation, competitor blogs

The third-party sources that outrank the brand's own domain are the targets. These are the pages you
need to beat.

Identify the top 10 third-party sources by citation count. Present a summary:

| Source domain | Citations | Type |
|--------------|-----------|------|
| g2.com | 340 | Review aggregator |
| contentsquare.com/blog | 180 | Competitor blog |
| techradar.com | 150 | Media |
| ... | | |

Also call `get_ai_visibility_topics` to understand which topics are driving these citations — you'll
use this to pick which source asset to build.

---

## Step 2 — Audit What Makes the Top Sources Win

For each of the top 5 third-party sources, fetch the actual page content using `web_fetch`. Read
each one carefully. You're looking for the structural and content patterns that make these pages
authoritative to AI models.

Evaluate each source across:

**Answer structure**: Does the page answer a clear question directly? Does it have a hierarchy of
H2s and H3s that map to sub-questions? Pages with clear structure are scraped more reliably.

**Data and specificity**: Does the page cite statistics, benchmarks, survey results, or other
verifiable data? AI models disproportionately cite pages with concrete data over opinion.

**Comprehensiveness**: Does it cover the topic exhaustively — history, mechanics, use cases,
comparison, FAQs? Thin coverage loses to deep coverage.

**Freshness signals**: Does the page prominently display a date, "Updated for [year]", or reference
recent events? AI models favor sources that appear current.

**Authority signals**: Author credentials, company reputation, methodology disclosures, research
citations, peer references.

**Asset type**: What format makes this page authoritative? Common winning formats:
- Definitional guides ("What is product analytics")
- Benchmark reports ("State of product analytics 2025")
- Methodology explainers ("How session replay works")
- Glossaries ("Product analytics terms explained")
- Comparison hubs ("Product analytics tools compared")

Summarize the audit as a pattern: *"Top-cited sources on this topic share: [3–4 patterns]. The
brand's existing content lacks: [2–3 gaps]."*

---

## Step 3 — Identify the Source Asset Opportunity

Based on the audit, identify the highest-leverage source asset to build. Score opportunities by:

**Citation gap**: how many more citations does the top external source have than the brand's best
owned page on the same topic? A gap of 200+ citations is a high-value target.

**Topic strategic importance**: cross-reference with `get_ai_visibility_topics` — is this a topic
where the brand has high relevancy but low visibility? If so, owning the source would have
compounding impact.

**Buildability**: can the brand credibly own this asset type? A benchmark report requires data;
a definitional guide just requires expertise. Prefer assets the brand can produce with authority.

**Asset type selection guide**:
- If top sources are definitional pages → build a comprehensive guide that goes deeper
- If top sources are review aggregators (G2, Capterra) → build a methodology/transparency page that
  AI models cite as the primary source for comparison criteria
- If top sources are competitor blogs → build a neutral, data-rich asset that's more authoritative
  than the competitor's self-interested version
- If top sources are media/analyst reports → build a proprietary benchmark or research report

Present **2–3 asset options** with recommendation:

| # | Asset type | Target topic | Estimated citation gap | Recommendation |
|---|-----------|-------------|----------------------|----------------|
| 1 | Definitive guide | "What is product analytics" | −280 | Build first: definitional, high volume |
| 2 | Benchmark report | "Product analytics adoption 2025" | −140 | Build second: requires data |
| 3 | Comparison hub | "Product analytics tools compared" | −95 | Good, but competitive space |

Ask: *"Which asset do you want to build?"* Wait for their pick.

---

## Step 4 — Generate the Source Asset

Write the full asset. Not a skeleton — complete, publish-ready content that is genuinely more
useful, specific, and comprehensive than the sources it's designed to outrank.

### Asset type templates

**Definitive Guide** ("What is X", "How X works", "The complete guide to X")

- **H1**: answers the definitional question directly
- **Opening** (2–3 paragraphs): direct definition in sentence 1; why it matters; what the guide
  covers
- **Core sections** (5–8 H2s): definition → how it works → key components → use cases by company
  type → how to evaluate → implementation considerations → FAQs
- **Data points**: include at least 5 concrete statistics or benchmarks (cite sources or note
  they're from Amplitude research if proprietary)
- **Visual aids described**: mention what diagrams, screenshots, or tables would reinforce each
  section — even if images aren't included, the described structure signals authority
- **FAQ block**: 6–8 Q&As using the exact language from AI Visibility prompts on this topic
- **Internal links**: 4–5 links to related Amplitude content
- **Last updated note**: include a "Last updated: [current month/year]" in the metadata

**Benchmark Report** ("State of X", "X trends report", "X by the numbers")

- **H1**: "[Category] Benchmark Report [Year]: Key Metrics and Trends"
- **Executive summary**: 5–7 key findings in bullet form
- **Methodology section**: how data was collected, sample size, time period — AI models love citing
  transparent methodology
- **Data sections** (4–6 H2s): each with a headline finding, supporting data, and interpretation
- **Comparison by segment**: enterprise vs SMB, industry verticals, company stage
- **Trend analysis**: year-over-year changes if available
- **Recommendations**: what the data means for product teams
- **FAQ block**: 4–5 Q&As

**Comparison Hub** ("X tools compared", "Best X platforms", "[Category] software guide")

- **H1**: "Best [Category] Tools in [Year]: Compared for Product Teams"
- **Selection criteria**: how tools were evaluated — this makes the comparison trustworthy
- **Summary comparison table**: 8–10 tools, key dimensions, best-for callouts
- **Per-tool deep dives**: 200–300 words each, covering strengths, limitations, pricing model,
  best-fit use cases
- **Decision framework**: "Choose X if you [condition]" format for 5–6 scenarios
- **FAQ block**: 5–6 Q&As

### Always include meta fields

- `metaTitle` — 50–60 characters, contains primary keyword
- `metaDescription` — 140–160 characters, signals authority and comprehensiveness
- `slug` — keyword-rich, specific (e.g., `/blog/what-is-product-analytics` not `/blog/analytics`)
- `lastUpdated` — current date

---

## Step 5 — Push to CMS

Use what you discovered in Step 0. This is a **new document** (create operation, not update).

**Sanity** — use `create_documents_from_markdown` with the full asset content. Set `_type` to match
the blog/article schema. Ask the user if unsure: "What's the document type for long-form guides in
your Sanity schema?" Never use `publish_documents` without explicit instruction.

**Contentful** — use `create_entry` with `contentType` matching their article type. Set
`fields.title`, `fields.slug`, `fields.body`. Leave `published: false`.

**HubSpot** — use `create_blog_post` with `state: DRAFT`. Include meta description and slug.

**WordPress** — use `wp_create_post` with `status: draft`. Map H1 to `title`, body to `content`.

**Ghost** — use `create_post` with `status: draft`. Include `slug`, `title`, `html` or `lexical`,
and `meta_description`.

**Webflow** — use `create_cms_item` targeting the blog Collection. Map fields to the Collection's
schema (ask the user for field names if not obvious from context).

After pushing, confirm: *"Done — [asset title] is saved as a draft in [CMS]. Here's the ID/URL:
[link]. Review it there before publishing."*

**Always output a Markdown fallback** of the full content, even when CMS push succeeds.

---

## What makes a source authoritative to AI models

AI models don't cite sources because they're from a big brand. They cite sources that:

- **Answer a specific question better than anyone else.** The best source for "what is product
  analytics" is the page that defines it most clearly, most completely, and most directly.
- **Include data with transparent methodology.** A benchmark that says "we surveyed 500 product
  teams" is cited over one that says "leading experts believe."
- **Cover the topic from every angle.** AI models prefer comprehensive sources over narrow ones.
  A guide that covers definition, mechanics, use cases, evaluation criteria, and FAQs will beat
  a shorter page on any single dimension.
- **Are clearly dated.** An "Updated April 2025" tag signals freshness. AI models avoid citing
  stale sources on fast-moving topics.
- **Link to other authority signals.** Internal links to related content, external citations of
  data, author credentials — all of these increase the page's trust score in AI training and
  inference.
