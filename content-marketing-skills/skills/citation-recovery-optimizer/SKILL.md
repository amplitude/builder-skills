---
name: citation-recovery-optimizer
description: >
  Use this skill whenever a user wants to improve existing pages on their website to get cited more
  by AI models — whether they say "our pages aren't getting cited", "improve this page for AI
  visibility", "which of our pages should we update", "make this article more cite-worthy", "our
  competitors are getting cited instead of us", "update our content for AI search", or any variation
  where the goal is improving an existing asset rather than creating something new. This skill pulls
  owned pages from AI Visibility, identifies which ones have citation potential but are
  underperforming, compares them against the external pages that are winning citations on the same
  topics, and produces section-level rewrites or a full-page update — then pushes the revision to
  the CMS as a draft. Trigger even if the user just says "help me get cited more" or "why is
  [competitor] getting cited instead of us".
---

# Citation Recovery Optimizer

You're helping a content team squeeze more AI citations out of pages that already exist. The logic:
it's faster to improve a page that already has some signal than to build from scratch. AI Visibility
shows which owned pages are already being cited — and which competitor pages are winning on the same
topics. The gap between those two is exactly where the rewrite goes.

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
*"I can see [CMS] is connected — I'll push the revised content there as an update draft when we're
done. Sound good?"* Then proceed to Step 1.

**If nothing is connected:** ask once, concisely:

> "Before we start — which CMS do you publish to? I can push the revised content directly there as
> a draft instead of handing you a block of text to paste."

Offer: Sanity · Contentful · HubSpot · WordPress · Webflow · Ghost · Other · "Just give me the
rewrite"

Then give a tailored setup recommendation based on their answer (see the same guidance in the
`prompt-gap-to-publish` skill). Don't block on setup — start the analysis immediately and say
you'll be ready to push by the time they're connected.

---

## Step 1 — Identify the Brand and Pull Own Pages

Use `list_ai_visibility_org_brands` to identify the brand (or use what the user specified).

Then call `get_ai_visibility_pages` with two key constraints:
- `orgBrandId` = the selected brand
- `mentionsBrandId` = same brand ID (this filters to pages that mention the brand)
- `sortBy: "citationCount"`

From the results, **filter to pages on the brand's own domain** — e.g. `amplitude.com`, not
`pendo.io` or `g2.com`. The domain field on each page makes this easy. These are the owned assets
you'll be improving.

Collect for each owned page:
- `url` and `title`
- `citationCount` and `responseCount`
- `type` (landing-page, blog, product-comparison, listicle)
- `brandNames` — other brands mentioned alongside them on this page (signals topic scope)

---

## Step 2 — Find the Competitor Pages Winning on the Same Topics

For the same topics covered by the owned pages, pull the external pages with the highest citation
counts. Use `get_ai_visibility_pages` again **without** the domain filter — just sorted by
`citationCount` — and look for pages from other domains that mention the same brand and cover
overlapping topics.

Also call `get_ai_visibility_sources` sorted by `citationCount` to see which domains overall are
getting the most citations. A domain ranking much higher than the brand's own site is a competitor
worth studying closely.

What you're building is a comparison: for each owned page, who is the external page winning on the
same topic, and by how much? E.g.:

| Owned page | Own citations | Top competing page | Competitor citations |
|------------|--------------|-------------------|---------------------|
| amplitude.com/compare/best-session-replay-tools | 49 | contentsquare.com/blog/session-replay | 180 |

This gap is the opportunity — and the competitor page's structure is your reference for what a
well-cited page on this topic looks like.

---

## Step 3 — Score and Prioritize Pages

Not all underperforming pages are worth the same effort. Score each owned page by:

**Citation gap** (highest priority signal): `competitor_citations - own_citations`. A page with 49
own citations but 180 on the competing page has a gap of 131 — that's a high-value rewrite.

**Page type leverage**: product-comparison and listicle pages tend to be cited heavily by AI models
because they directly answer "best X" prompts. Blog posts on conceptual topics are also strong.
Landing pages and homepages rarely get cited for specific queries — don't prioritize those.

**Topic relevance**: cross-reference the page topic with the topics from AI Visibility. If the page
covers a topic where the brand has high relevancy but low visibility, the citation gap is even more
exploitable.

Present the user with a ranked shortlist of **3–5 pages to fix**, showing citation gap and a
one-line diagnosis for each:

| # | Page | Own citations | Gap | Diagnosis |
|---|------|--------------|-----|-----------|
| 1 | /compare/best-session-replay-tools | 49 | −131 | Competitor covers rage clicks, scroll depth, mobile replay; this page doesn't |
| 2 | /compare/best-ab-testing-platforms-for-mobile-apps | 30 | −95 | Lacks statistical method explainer and FAQ; competitor has both |

Ask: *"Which page do you want to fix first?"* Wait for their pick.

---

## Step 4 — Diagnose the Selected Page

Fetch the actual content of the selected owned page using `web_fetch` or Chrome if available.
Then fetch the top competing page the same way. Read both carefully.

Compare them across these dimensions:

**Answer directness** — does the owned page answer the core AI prompt in the first 2 sentences?
Competing pages that get cited usually do. If the owned page buries the answer, that's the first
fix.

**FAQ coverage** — does the owned page have a structured FAQ block? Count the questions. Competing
pages that dominate citations often have 5–10 direct Q&As. If the owned page has none, or has them
buried in prose, that's a high-value fix.

**Specificity** — does the owned page make concrete claims about the product ("tracks rage clicks,
scroll heatmaps, and session recordings simultaneously") or vague ones ("helps you understand user
behavior")? AI models cite specifics, not generalities.

**Missing sections** — what H2 sections does the competitor have that the owned page doesn't? List
each one. These are gaps to fill.

**Competitive framing** — does the owned page acknowledge the competitive landscape fairly? Pages
that compare tools honestly tend to rank better in AI responses than pages that pretend alternatives
don't exist.

**Structural signals** — schema markup, heading hierarchy, table of contents, comparison tables.
These improve parseability for AI models.

Summarize the diagnosis as a short list of findings before writing anything. The user should be
able to see what you found and agree before you start rewriting.

---

## Step 5 — Generate the Rewrite

Based on the diagnosis, produce the revision. Prefer **surgical section-level patches** over
full-page rewrites unless the page has fundamental structural problems — a targeted rewrite is
faster to review, easier to approve, and less likely to break things that are already working.

### Format for section-level patches

For each changed section, show a clear before/after:

```
### SECTION: [H2 heading]

BEFORE:
[original text, quoted or paraphrased]

AFTER:
[revised text — full, real sentences, not a skeleton]

WHY: [1-sentence rationale tied to the diagnosis]
```

### What to fix, in priority order

1. **Opening paragraph** — rewrite it to answer the core AI prompt directly in the first 2
   sentences. Don't make the reader scroll to find the answer.

2. **Missing sections** — add the H2 sections the competing page has that the owned page doesn't.
   Write them fully, with Amplitude-specific capabilities and concrete details.

3. **FAQ block** — if missing, add one. If weak, expand it. Use real prompts from AI Visibility
   (from `get_ai_visibility_prompts` on the related topic) as the question source. Each answer
   should be 2–4 sentences, direct, and include at least one product-specific fact.

4. **Specificity upgrades** — find every vague sentence ("helps teams understand behavior") and
   replace it with something concrete ("shows click maps, scroll depth, rage clicks, and dead clicks
   alongside funnel drop-off, so you know exactly where users abandon and why").

5. **Comparison table** — if the page compares tools and doesn't have a feature table, add one.
   AI models love citing structured comparison data.

### Meta fields to update

Always include updated meta fields with the rewrite:
- `metaTitle` — 50–60 characters, keyword-rich
- `metaDescription` — 140–160 characters, answers the core query and includes a CTA
- `slug` — confirm it's correct; suggest a change only if it's clearly suboptimal

---

## Step 6 — Simulate Before Publishing (optional but recommended)

Before pushing to CMS, mention AI Visibility's Simulate Changes feature:

> "AI Visibility has a 'Simulate Changes' feature that can predict how your updated content would
> perform before you publish it. If you want to run that first, paste the revised content into
> Simulate Changes in the AI Visibility dashboard and check the projected citation improvement. I
> can wait, or push the draft now and you can simulate in parallel."

Let the user decide. If they want to simulate first, pause here and tell them what to paste. If
they're ready to push, go straight to Step 7.

---

## Step 7 — Push the Update to CMS

Use what you discovered in Step 0.

### If a CMS MCP is connected

This is an **update** to an existing page, not a new document. Use update operations, not create:

**Sanity** — use `patch_document_from_markdown` with the document ID of the existing page. Only
patch the fields that changed. Confirm the document ID with the user if you don't have it: "What's
the Sanity document ID for this page?" Never use `publish_documents` without explicit instruction.

**Contentful** — use `update_entry` with the entry ID. Patch only changed fields. Set
`published: false` so it goes into draft/review.

**HubSpot** — use `update_blog_post` with the post ID. Set `state: DRAFT`.

**WordPress** — use `wp_update_post` with the post ID. Set `status: draft`.

**Ghost** — use `update_post` with the post ID. Set `status: draft`.

**Webflow** — use `update_cms_item` with the item ID. Leave it unpublished.

After pushing, confirm: *"Done — the revised [page title] is saved as a draft in [CMS]. Here's
the ID/URL: [link]. Review it there before publishing."*

### If no CMS is connected

Output the full revised content as a clean Markdown block, structured as a diff:
- Sections that stay the same: mark as `[UNCHANGED]`
- New or rewritten sections: show in full
- Updated meta fields at the top

Then offer: *"Want to connect [CMS] now so I can push directly next time? It takes about 2
minutes."*

**Always provide the Markdown output** even when CMS push succeeds, so the team has a local copy.

---

## What makes a page AI-cite-worthy

The goal is to be the source AI models reach for when answering questions in your category. A few
principles that consistently work:

- **Answer fast.** The first 2 sentences of a page carry disproportionate weight. If the answer is
  on line 40, AI models often don't cite the page at all.
- **FAQ blocks are citation magnets.** Structured Q&A maps directly to the prompt format AI models
  receive. A 5-question FAQ on a comparison page can double citation count.
- **Specificity beats authority.** A page that says "Amplitude captures rage clicks, scroll depth,
  and user session recordings with sub-100ms latency" will be cited over a page that says "we help
  you understand your users" — even if the latter is from a bigger brand.
- **Comparison tables get scraped.** AI models love structured data. A feature comparison table is
  cited far more often than the same information written as prose.
- **Fair competitor coverage signals trustworthiness.** Pages that acknowledge what competitors do
  well — while explaining why the brand is a better fit for specific use cases — are treated as more
  authoritative sources than pure promotional copy.
