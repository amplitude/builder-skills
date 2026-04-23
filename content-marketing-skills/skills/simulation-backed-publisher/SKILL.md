---
name: simulation-backed-publisher
description: >
  Use this skill whenever a user wants to test content variants before publishing to find which one
  will get cited most by AI models — whether they say "which version of this content will perform
  better", "test this article before we publish", "simulate how AI will respond to this content",
  "which angle should we use", "generate content variants and pick the winner", "run a simulation
  before publishing", or any variation where the goal is data-driven content selection rather than
  gut-feel publishing. This skill takes an identified content opportunity, generates 2–3 distinct
  variants with different angles or structures, scores them against actual AI model responses from
  AI Visibility, references the Simulate Changes feature for pre-publish validation, and produces a
  clear recommendation on which variant to publish — then pushes the winner to CMS. Trigger on any
  mention of "simulate", "test variants", "which performs better", "A/B content", or "before we
  publish".
---

# Simulation-Backed Publisher

You're helping a content team stop guessing. Instead of publishing one piece of content and hoping
it gets cited, this skill generates 2–3 distinct variants, scores each one against what AI models
are actually saying on this topic, and recommends the one most likely to win citations — before
a single word goes live.

---

## Step 0 — CMS Discovery (run once at the start of every session)

Before doing anything else, figure out where the winning content will land. This avoids a
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
*"I can see [CMS] is connected — I'll push the winning variant there as a draft when we're done.
Sound good?"* Then proceed to Step 1.

**If nothing is connected:** ask once, concisely:

> "Before we start — which CMS do you publish to? I can push the winning variant directly there as
> a draft instead of handing you a block of text to paste."

Offer: Sanity · Contentful · HubSpot · WordPress · Webflow · Ghost · Other · "Just give me the
content"

Then give a tailored setup recommendation based on their answer (same guidance as in
`prompt-gap-to-publish`). Don't block on setup — start the analysis immediately and say you'll be
ready to push by the time they're connected.

---

## Step 1 — Identify the Opportunity to Simulate

Use `list_ai_visibility_org_brands` to identify the brand (or use what the user specified).

The user may arrive here with an opportunity already in hand (e.g., from running
`prompt-gap-to-publish` or `competitor-prompt-hijacker`). If so, use that opportunity directly.

If not, use `get_ai_visibility_topics` with the selected `orgBrandId` to surface the top 3–5
opportunities using the standard scoring heuristic: topics with relevancy > 60% and
visibility < 40%. Present them briefly and ask which one to simulate.

Confirm the opportunity with the user before building variants:

> "I'll generate variants for: [opportunity title]. The target prompts are: [2–3 example prompts].
> Does that match what you want to test?"

---

## Step 2 — Load the LLM Response Context

For the selected opportunity, pull the actual AI model responses using:
- `get_ai_visibility_prompts` with the relevant `topicId` to get the prompt list
- `get_ai_visibility_prompt_responses` for the top 5–8 prompts with the highest `responseCount`

Read each response carefully. This is the ground truth — it's exactly what AI models currently say
when asked questions in this space. Your variants will be scored against this context.

Extract from the responses:
- **What language and framing do AI models use?** (vocabulary, question format, key terms)
- **What claims do they make?** (statistics, product capabilities, named tools)
- **What's missing or thin?** (areas where the AI response is vague, hedged, or cites weak sources)
- **Which brands appear in answers?** (competitors getting cited that shouldn't be)
- **What format do the responses use?** (bullet lists, prose, tables — your content should match)

This context is the scoring rubric for the variants you'll build.

Also call `get_ai_visibility_sentiment` to understand tone: is AI sentiment toward the brand
positive, neutral, or negative on this topic? Variants should be designed to reinforce positive
sentiment or counter negative framing.

---

## Step 3 — Generate 2–3 Variants

Build 2–3 distinct variants of the content. Each variant should take a meaningfully different angle
or structure — not just the same content with different intros. Small rewrites don't help you learn
anything; genuine alternatives do.

### Variant differentiation axes

Pick the axes most relevant to the opportunity:

**Angle**: Educational ("How does X work") vs. Competitive ("Amplitude vs alternatives") vs.
Use-case ("Best X for [specific segment]")

**Lead**: Data-first (open with a benchmark or statistic) vs. Problem-first (open with the pain
point) vs. Answer-first (open with the direct answer to the core question)

**Depth**: Comprehensive guide (long-form, covers everything) vs. Sharp and specific (focused
answer to one question) vs. Interactive/structured (heavy use of tables, comparison matrices, FAQs)

**Framing**: Brand-forward ("Here's how Amplitude does X") vs. Category-neutral ("Here's how
product analytics works — and where Amplitude fits") vs. Competitive ("The honest guide to X tools")

### Variant format

For each variant, write:
1. **Full H1 and opening paragraph** (the part AI models weigh most heavily)
2. **H2 outline** with a 1–2 sentence description of each section's content
3. **One fully written section** — the most important H2, written completely
4. **Full FAQ block** — 4–6 Q&As using the exact prompt language from Step 2
5. **Meta fields**: `metaTitle`, `metaDescription`, `slug`

Label them clearly: **Variant A**, **Variant B**, **Variant C**.

---

## Step 4 — Score Each Variant Against LLM Context

Now evaluate each variant against the actual AI model responses from Step 2. This is the simulation.
Score each variant on a 1–5 scale across these dimensions:

**Prompt alignment** (1–5): Does the variant's H1, opening, and FAQ directly match the language and
question format used in the AI Visibility prompts? Score 5 if the variant mirrors prompt language
closely; score 1 if it uses different terminology or buries the answer.

**Answer directness** (1–5): Does the variant answer the core question in the first 2 sentences?
Score 5 if yes; score 3 if the answer appears within the opening paragraph; score 1 if the reader
has to scroll.

**Specificity** (1–5): Does the variant make concrete, verifiable claims ("Amplitude captures
rage clicks, scroll depth, and heatmaps in sessions under 100ms") rather than generic ones? Score
5 if every major claim is specific; score 1 if claims are mostly generic.

**Gap coverage** (1–5): Does the variant cover the areas where the current AI responses are thin or
absent? Score 5 if it fills every identified gap; score 1 if it largely repeats what AI models
already say.

**Structure match** (1–5): Does the variant's format match how AI models are already presenting
this topic? Score 5 if the structure mirrors the response format (e.g., if AI models use bullet
lists, the variant uses them prominently).

Present the scores as a table:

| Dimension | Variant A | Variant B | Variant C |
|-----------|-----------|-----------|-----------|
| Prompt alignment | 4 | 5 | 3 |
| Answer directness | 3 | 4 | 5 |
| Specificity | 5 | 3 | 4 |
| Gap coverage | 4 | 4 | 3 |
| Structure match | 3 | 5 | 4 |
| **Total** | **19** | **21** | **19** |

State the recommendation clearly: *"Variant B scores highest (21/25). Its FAQ block mirrors the
exact prompt language from AI Visibility, and it answers the core question in sentence 1. Recommend
publishing Variant B."*

---

## Step 5 — Simulate Changes Checkpoint

Before pushing to CMS, reference AI Visibility's built-in Simulate Changes feature:

> "AI Visibility has a 'Simulate Changes' feature that runs your content against live AI model
> prompts and projects the citation improvement before you publish. Here's what to paste in:
> [the full text of the winning variant's opening + FAQ block]
>
> To run it: open AI Visibility → select your brand → go to Simulate Changes → paste the content
> → run the simulation. I'll wait, or push the draft now and you can simulate in parallel."

Let the user decide. If they want to simulate first, pause and provide the exact text to paste.
If they're ready to push, proceed to Step 6.

If the simulation comes back and changes their mind about which variant to use, generate the
revised variant in full before pushing.

---

## Step 6 — Build the Winner in Full

Once the variant is selected (with or without simulation results), write the complete article:

- Full H1 through final CTA — no placeholders, no "[add section here]"
- All H2 sections from the outline, written completely
- Full FAQ block (4–6 Q&As)
- Meta fields: `metaTitle`, `metaDescription`, `slug`
- "Last updated: [current month/year]" note in the metadata

Also save the **runner-up variants** as a Markdown block at the end — label them clearly as
alternates. These can be used for A/B testing after launch, or adapted for different channels.

---

## Step 7 — Push to CMS

Use what you discovered in Step 0. This is a **new document** (create operation, not update) unless
the user specifies they're updating an existing page.

**Sanity** — use `create_documents_from_markdown` with the winning variant. Set `_type` to match
the blog/article schema. Ask if unsure: "What's the document type for articles in your Sanity
schema?" Never use `publish_documents` without explicit instruction.

**Contentful** — use `create_entry` with `contentType` matching their article type. Set
`fields.title`, `fields.slug`, `fields.body`. Leave `published: false`.

**HubSpot** — use `create_blog_post` with `state: DRAFT`. Include meta description and slug.

**WordPress** — use `wp_create_post` with `status: draft`. Map H1 to `title`, body to `content`.

**Ghost** — use `create_post` with `status: draft`. Include `slug`, `title`, `html` or `lexical`,
and `meta_description`.

**Webflow** — use `create_cms_item` targeting the blog Collection. Map fields to the Collection's
schema (ask the user for field names if not obvious).

After pushing, confirm: *"Done — [article title] is saved as a draft in [CMS]. Here's the
ID/URL: [link]. The runner-up variants are below in Markdown — save them for future use or A/B
testing."*

**Always output a Markdown fallback** of the winning variant, plus the runner-up alternates, even
when CMS push succeeds.

---

## Why simulate before publishing

Every piece of content is a bet. Simulation-backed publishing turns that bet into a reasoned choice:

- **Prompt alignment is the single strongest predictor of citation.** Content that mirrors the
  exact language AI models use in prompts will be retrieved and cited far more reliably than content
  written in generic SEO language.
- **Answer directness compounds over time.** The first sentence of a page is disproportionately
  weighted by AI retrieval. A variant that answers in sentence 1 will consistently outperform one
  that takes three paragraphs to get there.
- **Gap coverage is the fastest citation win.** If AI responses on a topic are thin or vague on a
  specific sub-question, the first page to answer it concretely becomes the go-to citation.
- **Variants expose assumptions.** Writing 3 versions of the same content forces the team to
  articulate what they actually believe the audience needs — and the scoring often surprises them.
