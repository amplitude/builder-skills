---
name: citation-recovery-optimizer
description: Use this skill whenever a user wants to improve existing pages that underperform in AI citation results. Trigger on requests like "why did citations drop," "how do we recover lost AI citations," "optimize this page for AI answers," "improve pages that rank poorly in AI Visibility," "refresh this article to get cited," or any request focused on revising existing content to recover citation share. This skill audits weak pages with AI Visibility data, identifies structural and evidence gaps, rewrites high-impact sections, and pushes revised drafts to CMS in draft mode.
suggest_when: User asks to recover lost citations, improve AI answer citations on an existing page, optimize underperforming content, refresh pages based on AI Visibility, or update existing articles for stronger citation performance.
---

# Citation Recovery Optimizer

Recover citation share by systematically upgrading pages AI models already see but do not trust enough to cite.

Use this when the user already has published content and wants to improve citation performance rather than create net-new pages.

---

## Instructions

### Step 0 - Confirm tooling and publishing path

Start by checking what systems are available:

1. Confirm Amplitude AI Visibility MCP access.
2. Detect CMS connections (Sanity, Contentful, HubSpot, WordPress, Ghost, Webflow, Shopify, or other connected CMS MCPs).
3. Ask whether output should be:
   - CMS draft update (preferred), or
   - Markdown-only draft if no CMS is connected.

If CMS is connected, default to draft mode. Do not publish live without explicit user instruction.

---

### Step 1 - Identify pages that need recovery

Use AI Visibility page-level and prompt-level data to find underperformers:

- Pull the user's brand pages and associated citation performance.
- Prioritize pages with one or more of:
  - Citation decline over recent period
  - High prompt relevance but weak citation rate
  - Lower rank vs topic peers
  - Competitive replacement (competitor cited where this page used to win)

For each candidate, summarize:

- URL / page title
- Topic or prompt cluster
- Current citation/rank signals
- Why this page is a strong recovery target

Pick 1 primary page unless user asks for a batch optimization.

---

### Step 2 - Diagnose why the page is losing citations

Inspect the current page content and compare it to winning answers for the same prompt set.

Run a structured gap diagnosis:

1. **Answer-directness gap**  
   Does the page answer the key user prompt in the first 1-2 sentences?

2. **Extractability gap**  
   Is content scannable and quote-ready (clear headings, concise paragraphs, lists, tables, FAQ)?

3. **Evidence gap**  
   Are there concrete proof points (benchmarks, examples, customer evidence, explicit claims with details)?

4. **Prompt-language gap**  
   Does the page use the same phrasing users/models use, or only internal jargon?

5. **Comparative context gap**  
   If competitor pages win, does this page fail to provide fair comparisons or alternatives context?

6. **Freshness gap**  
   Is content outdated, missing recently relevant capabilities, or stale in framing?

Summarize findings as:

## Citation Recovery Diagnostic
- What is working
- What is weak
- What must change first

---

### Step 3 - Produce a targeted optimization plan

Before rewriting, outline a concise edit plan:

- Proposed new intro (direct answer style)
- New/updated sections to add
- Section(s) to remove or compress
- Required proof assets to include
- FAQ questions to add from real prompt language
- Structured element recommendations (table, checklist, comparison block)

If user asks for quick turnaround, prioritize highest-impact sections:
intro, FAQ, comparison/table, and proof block.

---

### Step 4 - Rewrite the page for citation performance

Generate a full revised draft or section-level patch, depending on user preference.

Writing requirements:

- First paragraph answers the core prompt directly.
- Use plain, specific claims and concrete details.
- Preserve factual accuracy; do not invent benchmarks or customer quotes.
- Add structured elements that are easy for AI models to quote.
- Add a 4-6 question FAQ aligned to real prompt phrasing.
- Keep tone fair and useful; avoid hype language.

Always include:

- `metaTitle`
- `metaDescription`
- `slug` (if creating a net-new URL) or canonical URL recommendation (if revising in place)

---

### Step 5 - Recommend simulation before publishing

Before handing off to CMS, recommend AI Visibility simulation:

"Before publishing, I recommend running this through AI Visibility's Simulate Changes workflow. Test this revised copy against the exact prompts where citation share dropped so we can validate lift before it goes live."

If user wants simulation first, pause and provide copy-paste-ready draft text.
If user wants to publish now, proceed to CMS draft creation/update.

---

### Step 6 - Push revised draft to CMS (draft mode)

Use connected CMS MCP tools and keep content unpublished:

- **Sanity**: `create_documents_from_markdown` (ask schema type if unknown), save draft.
- **Contentful**: `create_entry` with correct content type, leave unpublished.
- **HubSpot**: `create_blog_post` with `state: DRAFT`.
- **WordPress**: `wp_update_post` or `wp_create_post` with `status: draft`.
- **Ghost**: `create_post` with `status: draft`.
- **Webflow**: `create_cms_item`, unpublished.

When complete, confirm:

"Done - revised draft is in [CMS]. Here's the title and draft link: [link]. Review in CMS before publishing."

If no CMS is connected, return full revised Markdown with metadata and section structure preserved.

---

## What makes citation recovery work

- **Relevance alone is not enough.** Pages can be topically relevant but still lose citations if answers are not direct and extractable.
- **Evidence beats generic positioning.** AI models prefer concrete, supportable details.
- **Structured content wins retrieval.** Tables, FAQs, and concise comparisons are easier to cite.
- **Prompt-language alignment improves matching.** Pages should reflect how users actually ask questions.
- **Fairness improves trust.** Honest tradeoffs and clear fit guidance are more cite-worthy than one-sided claims.
