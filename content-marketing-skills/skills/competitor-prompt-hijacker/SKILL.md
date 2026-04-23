---
name: competitor-prompt-hijacker
description: >
  Use this skill whenever a user wants to win AI citations on prompts that competitors currently
  dominate — whether they say "competitors are getting cited instead of us", "we're losing on these
  prompts", "how do I outrank [competitor] in AI answers", "find prompts where we should be winning",
  "create content to beat [competitor]", or any variation where the goal is capturing AI share on
  prompts a competitor currently owns. This skill pulls competitor visibility data from AI Visibility,
  identifies the specific prompts where competitors win and Amplitude is absent, clusters them by
  intent, and produces targeted comparison pages, alternatives content, or rebuttal assets — then
  pushes drafts to CMS. Trigger on any mention of competitor, prompt hijack, outrank, or "why is
  [competitor] getting cited instead of us".
---

# Competitor Prompt Hijacker

You're helping a content team steal AI citations back from competitors. When an AI model is asked
"what's the best product analytics tool" or "Mixpanel vs Amplitude", the answer it gives is
determined by what's been written. This skill finds every prompt where a competitor is winning and
Amplitude is absent — and produces content specifically designed to flip those citations.

---

## Step 0 — CMS Discovery (run once at the start of every session)

Before doing anything else, figure out where the revised content will land. This avoids a
copy-paste dead end at the end of the workflow.

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
*"I can see [CMS] is connected — I'll push the new content there as a draft when we're done.
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

## Step 1 — Identify the Brand and Pull Competitor Landscape

Use `list_ai_visibility_org_brands` to identify the brand (or use what the user specified).

Then call `get_ai_visibility_competitors` with the selected `orgBrandId`. This returns the full
competitor list with fields: `brandId`, `brandName`, `brandUrl`, `visibility`, `avgRank`.

Sort by `visibility` descending. The competitors with the highest visibility are the ones most
actively winning citations that should belong to Amplitude.

Present a quick table to orient the user:

| Competitor | Visibility % | Avg Rank |
|-----------|-------------|---------|
| Google Analytics 4 | 46% | 2.1 |
| Mixpanel | 34% | 2.8 |
| ... | | |

If the user already named a specific competitor, use that one and skip the selection step.
Otherwise ask: *"Which competitor do you want to go after first?"*

---

## Step 2 — Find the Prompts Where the Competitor Wins

Use `get_ai_visibility_prompts` with the `orgBrandId`. For each prompt, you need to understand:
- How visible is the target competitor on this prompt?
- How visible is Amplitude on this prompt?

Look for prompts where:
- Competitor visibility is high (above 50%) **and** Amplitude visibility is low (below 30%)
- The prompt has high `responseCount` — more AI answers means more citation opportunity
- The prompt intent is one where Amplitude should credibly win (not "how to use Google Analytics")

Also call `get_ai_visibility_prompt_responses` for the top 5–10 weakest prompts. Reading the actual
LLM responses tells you exactly what AI models currently say — and what language, framing, and
claims you need to counter.

---

## Step 3 — Cluster the Prompts by Intent

Group the identified prompts into three buckets. These buckets map directly to content types:

**Bucket 1: Direct comparison** — prompts like "[Competitor] vs Amplitude", "Amplitude or
[Competitor]", "which is better [Competitor] or Amplitude". These warrant a dedicated comparison
page that covers both tools fairly and makes a clear recommendation for specific use cases.

**Bucket 2: Alternatives and discovery** — prompts like "alternatives to [Competitor]",
"[Competitor] competitors", "tools like [Competitor]", "best [Competitor] replacement". These
warrant a listicle or alternatives page that positions Amplitude as the top recommendation.

**Bucket 3: Category capture** — prompts like "best product analytics tool", "top digital analytics
platforms", "what should I use instead of GA4". Amplitude is absent from the AI answer even though
it's directly relevant. These warrant either a new category page or an upgrade to an existing one.

Present the cluster breakdown:

| Bucket | # Prompts | Example prompt | Amplitude visibility | Competitor visibility |
|--------|-----------|---------------|---------------------|----------------------|
| Direct comparison | 8 | "Mixpanel vs Amplitude" | 42% | 71% |
| Alternatives | 5 | "Mixpanel alternatives" | 18% | 0% |
| Category capture | 12 | "best product analytics" | 29% | 55% |

Ask: *"Which bucket do you want to attack first — direct comparison, alternatives, or category
capture?"* Wait for their pick, or suggest the one with the highest total response count if they
want your recommendation.

---

## Step 4 — Diagnose What the Competitor Is Saying

Fetch the actual content of the top-ranking competitor page for the selected bucket using
`web_fetch`. If the competitor page isn't identifiable from the data, use the LLM responses from
Step 2 to understand what claims are being made.

Also pull any existing Amplitude page on this topic using `get_ai_visibility_pages` with
`mentionsBrandId` for the competitor, filtered to `amplitude.com` domain.

Compare:

**Claims the competitor makes that Amplitude doesn't counter**: list each one. These are the gaps
to fill.

**Framing advantages the competitor has**: e.g., "Mixpanel leads with 'built for product teams'"
while Amplitude's page is generic. Specific framing beats generic.

**Questions the competitor answers that Amplitude's page doesn't**: pulled from the actual LLM
responses — what does the AI answer say that Amplitude's content doesn't address?

**Missing proof points**: pricing transparency, integration lists, customer segments, migration
guides, performance benchmarks.

Summarize the diagnosis in 4–6 bullet points before writing anything.

---

## Step 5 — Generate the Content

Based on the selected bucket, produce one of the following. Write fully — real sentences, real
claims, not a skeleton.

### For Bucket 1: Direct Comparison Page

Structure:
- **H1**: "[Competitor] vs Amplitude: Which Product Analytics Tool is Right for You?" (or similar)
- **TL;DR box** at the top (2–3 sentences): who each tool is best for, answered directly
- **Overview section**: brief fair description of both tools
- **Feature comparison table**: side-by-side on 8–12 dimensions most relevant to the target
  audience (event tracking, session replay, A/B testing, pricing model, data governance, etc.)
- **When to choose [Competitor]**: honest list — 3–4 scenarios where they're the better fit
- **When to choose Amplitude**: 3–4 scenarios with specific capability callouts
- **Migration section** (if relevant): "Switching from [Competitor]? Here's what to expect"
- **FAQ block**: 5 Q&As drawn from the actual prompts in Bucket 1

### For Bucket 2: Alternatives Page

Structure:
- **H1**: "Best [Competitor] Alternatives in [Year]: Compared by Product Teams"
- **Opening paragraph**: answer the core question in 2 sentences — who switches from [Competitor]
  and why
- **Comparison table**: top 5–6 alternatives with key differentiators and best-for callouts;
  Amplitude listed first with the strongest positioning
- **Detailed section per alternative**: 150–200 words, covering what it does well, what it lacks,
  and who it's best for
- **Migration from [Competitor]**: data portability, instrumentation changes, learning curve
- **FAQ block**: 4–5 Q&As from Bucket 2 prompts

### For Bucket 3: Category Capture Page

Structure:
- **H1**: "Best [Category] Tools in [Year]: A Guide for Product Teams"
- **Opening**: answer "what's the best X tool" directly in 2 sentences
- **Comparison table**: 6–8 tools, with Amplitude positioned for the most valuable use cases
- **Deep-dive sections** per tool or per use case
- **How to choose**: decision framework with 4–5 criteria
- **FAQ block**: 5 Q&As from Bucket 3 prompts

### Meta fields (all page types)

Always include:
- `metaTitle` — 50–60 characters, keyword-rich, includes the competitor name for comparison pages
- `metaDescription` — 140–160 characters, answers the core query and includes a CTA
- `slug` — confirm or suggest a keyword-optimized URL path

---

## Step 6 — Push to CMS

Use what you discovered in Step 0. This is a **new document** (create operation, not update).

**Sanity** — use `create_documents_from_markdown` with the full article content. Set `_type` to
match the blog/landing page schema. Ask the user if unsure: "What's the document type for
comparison pages in your Sanity schema?" Never use `publish_documents` without explicit instruction.

**Contentful** — use `create_entry` with `contentType` matching their blog or landing page type.
Set `fields.title`, `fields.slug`, `fields.body`. Leave `published: false`.

**HubSpot** — use `create_blog_post` with `state: DRAFT`. Include meta description and slug.

**WordPress** — use `wp_create_post` with `status: draft`. Map H1 to `title`, body to `content`.

**Ghost** — use `create_post` with `status: draft`. Include `slug`, `title`, `html` or `lexical`,
and `meta_description`.

**Webflow** — use `create_cms_item` targeting the blog Collection. Map fields to the Collection's
schema (ask the user for field names if not obvious from context).

After pushing, confirm: *"Done — [page title] is saved as a draft in [CMS]. Here's the ID/URL:
[link]. Review it there before publishing."*

**Always output a Markdown fallback** of the full content, even when CMS push succeeds, so the
team has a local copy.

---

## What makes competitor content get cited

AI models cite sources that answer comparison questions directly, fairly, and with specifics.
A few principles that consistently flip citations:

- **Answer "which is better" in the first paragraph.** Don't make the reader scroll. If the answer
  is "it depends on use case," say that — and say which use cases favor each tool.
- **Be fair about the competitor.** Pages that acknowledge competitor strengths are cited as more
  trustworthy than pure promotional content. Saying "Mixpanel is excellent for mobile-first teams
  focused on funnels" signals authority.
- **The comparison table gets scraped directly.** AI models extract structured data. A well-labeled
  table of feature differences will be cited verbatim.
- **Use the competitor's name prominently and accurately.** AI models need to match the query to
  the page. A page about "Mixpanel vs Amplitude" must use both names naturally and repeatedly.
- **FAQ blocks mapped to real prompts.** Use the exact question language from AI Visibility. The
  closer the Q matches the prompt, the more likely the A gets cited.
