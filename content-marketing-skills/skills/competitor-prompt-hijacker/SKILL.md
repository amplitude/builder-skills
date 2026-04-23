---
name: competitor-prompt-hijacker
description: >
  Use this skill whenever a user wants to win back prompts where competitors are getting cited.
  Trigger on requests like "what prompts is Mixpanel beating us on", "build competitor comparison
  pages from AI Visibility", "create alternatives content to take citations back", "where are
  competitors outranking us in AI answers", or any request to generate competitor-focused content
  from AI Visibility data. This skill identifies the best competitor prompt bucket to attack,
  diagnoses what the competitor page is doing, writes the right content asset, recommends simulation,
  and pushes the draft into the CMS when available.
suggest_when: User asks to identify competitor-winning prompts, create competitor comparison pages, write alternatives pages, take back AI citations, or generate competitive rebuttal content from AI Visibility.
---

# Competitor Prompt Hijacker

**Identify prompts competitors win, then create the exact page needed to take those citations back.**

This skill is for competitive AI visibility workflows. The goal is to create content that intercepts
how models answer comparison and alternatives prompts, using prompt-level evidence from AI Visibility.

Treat AI Visibility as a prompt-and-citation system, not classic SEO volume data.

---

## Instructions

### Step 0 — Confirm data and publishing setup

Before analysis:

1. Confirm which brand to optimize for.
2. Confirm competitor focus (single competitor or all).
3. Check CMS availability and publishing target:
   - Sanity
   - Contentful
   - HubSpot CMS
   - WordPress
   - Ghost
   - Webflow
4. Ask if the output should be a draft only (default) or if they only want Markdown.

If no CMS is connected, proceed with a full Markdown draft.

---

### Step 1 — Pull competitor prompt opportunities

Use AI Visibility MCP tools to pull prompt-level gaps where the competitor is cited above the target brand.

Prioritize prompt clusters that map to one of these buckets:

1. **Direct comparison**: "Amplitude vs Mixpanel", "Mixpanel vs Amplitude"
2. **Alternatives**: "Mixpanel alternatives", "alternatives to GA4"
3. **Category capture**: "best product analytics tools", "best analytics tools for PMs"

For each bucket, compute:

- Number of prompts
- Total response count
- Current citation split (target brand vs competitor)
- Overall rank and visibility gap

Present a concise opportunity table and identify the leading bucket by total response count.

---

### Step 2 — Ask for bucket selection

Ask:

> "Which bucket do you want to attack first — direct comparison, alternatives, or category capture?"

If they want your recommendation, suggest the bucket with the highest total response count.

---

### Step 3 — Diagnose what the competitor is saying

For the selected bucket:

1. Fetch the top competitor page content with `web_fetch` if identifiable.
2. If no specific URL is available, use model response text from AI Visibility prompts.
3. Pull related pages on the target brand domain with `get_ai_visibility_pages`, filtered to
   `amplitude.com` and the relevant competitor context.

Compare competitor vs target brand content and capture:

- **Missing counters**: claims the competitor makes that the target brand never answers
- **Framing advantages**: how competitor positioning wins trust
- **Proof structure**: benchmark tables, transparent pricing, customer examples, third-party proof, FAQ blocks
- **Prompt overlap**: exact phrases shared between the winning prompt and competitor page text

Summarize this diagnosis before writing.

---

### Step 4 — Generate the right asset by bucket

#### If bucket = Direct comparison

Create a page like:

- "Amplitude vs Mixpanel"
- "Amplitude vs Google Analytics"
- "Amplitude vs Heap"

Include:

- Direct answer in first 2 sentences
- Comparison table
- "When to choose [Competitor]"
- "When to choose Amplitude"
- FAQ with exact prompt language
- Comparison-specific CTA

#### If bucket = Alternatives

Create a page like:

- "Best Mixpanel alternatives"
- "Top alternatives to Google Analytics for product teams"

Include:

- Ranked alternatives list
- Honest pros and cons for each option
- Segment-specific argument for Amplitude
- FAQ block
- Migration section when relevant

#### If bucket = Category capture

Create:

- Category roundup
- "Best tools for X" page
- Category explainer with embedded comparison

This asset should be less overtly brand-forward than direct comparison pages, while still positioning
Amplitude as a leading answer.

---

### Step 5 — Apply writing rules

For every draft:

- Opening paragraph answers the prompt directly in first 2 sentences
- Reuse competitor-winning phrasing where truthful, without copying
- Include a 4-6 question FAQ block from real prompts
- Add a comparison table whenever 2+ products are discussed
- Keep tone fair and balanced; avoid one-sided chest-beating
- Use concrete product details, not generic category claims

Always include:

- `metaTitle`
- `metaDescription`
- `slug`

---

### Step 6 — Recommend simulation before publishing

Before publishing, explicitly suggest:

> "Before publishing, I recommend running this through AI Visibility's Simulate Changes feature.
> Paste the draft in and test how it performs against the exact prompts where [Competitor] is
> currently winning. That will tell us whether the framing is likely to improve citations before it
> goes live."

If they choose simulation first, pause and provide the exact version to paste.
If they want to publish now, continue.

---

### Step 7 — Push draft to CMS

Default to draft state unless user explicitly asks to publish.

- **Sanity**: `create_documents_from_markdown` (ask schema if unknown), save draft
- **Contentful**: `create_entry` with correct content type, leave unpublished
- **HubSpot**: `create_blog_post` with `state: DRAFT`
- **WordPress**: `wp_create_post` with `status: draft`
- **Ghost**: `create_post` with `status: draft`
- **Webflow**: `create_cms_item` unpublished

Then confirm:

> "Done — the draft is in [CMS]. Here's the title and draft link: [link]. Review it there before publishing."

If no CMS is connected, output the full Markdown draft with meta fields and complete section structure.

---

## Why this works

Competitor hijack content succeeds when the page shape exactly matches the prompt type:

- Direct comparison prompts cite direct comparison pages.
- Alternatives prompts cite alternatives pages with clear rankings and tradeoffs.
- Category prompts cite structured category explainers and "best tools" roundups.

Fairness, prompt-language match, and extractable structures (tables, pros/cons, FAQ) increase citation odds.
