---
name: prompt-gap-to-publish
description: Use this skill whenever a user wants to turn AI Visibility gaps into new content they can publish. Trigger on requests like "what content should we create from AI Visibility", "find topics where we're weak", "turn our low-visibility prompts into articles", "generate pages from AI rankings", "use our AI Visibility MCP to create content", "create content for prompts where competitors beat us", or any variation where the goal is to identify weak AI visibility prompts/topics and turn them into publish-ready assets.
suggest_when: User asks what content to create from AI Visibility, wants low-visibility prompts turned into publishable assets, asks to generate pages from AI rankings, or wants to improve citation share against competitors.
---

# Prompt Gap to Publish

Find the highest-leverage AI Visibility gap, write the right content asset for that gap, and push a draft into the connected CMS.

## Instructions

### Step 0: Confirm data and publishing context

1. Confirm the user has Amplitude AI Visibility MCP connected.
2. Detect whether a CMS MCP is connected (WordPress, Webflow, Contentful, Sanity, HubSpot CMS, Ghost, Shopify, or equivalent).
3. Ask for publishing preference:
   - New page(s)
   - Update existing page(s)
   - Draft only with no CMS push

If no CMS is connected, continue and output full Markdown drafts.

### Step 1: Pull opportunity set from AI Visibility

Use Amplitude AI Visibility tools to collect prompts/topics where the brand is underperforming.

Prioritize signals this discipline actually exposes:
- prompts
- topics
- visibility
- average rank
- relevancy
- citations
- sources
- competitors
- page-level citations
- AI chat traffic
- recommendations
- analysis/simulation actions

Do not shift into classic SEO framing like monthly search volume. This workflow is visibility-first and prompt-first.

### Step 2: Rank opportunities and pick one

Score each candidate prompt/topic using:
1. Visibility gap severity (low share, weak rank, low citation rate)
2. Strategic relevance (ICP, product fit, revenue relevance)
3. Competitive pressure (competitor citations and source strength)
4. Content feasibility (can we credibly produce an answerable, evidence-backed asset now)

Present the top 3 options in a compact table and recommend one.
If the user does not choose, proceed with the recommended option.

### Step 3: Diagnose what the winning result is doing

For the selected opportunity:
1. Identify what source(s) AI models are currently citing.
2. Pull competitor/source page content via `web_fetch` where possible.
3. Pull any relevant existing brand page via AI Visibility page-level lookup.
4. Compare:
   - Claims cited sources make that we do not cover
   - Proof structures they use (tables, FAQs, benchmarks, examples, pricing clarity)
   - Prompt-language overlap between user prompt and cited page text
   - Weaknesses in current brand page framing or structure

Summarize diagnosis in 5-8 bullets before drafting.

### Step 4: Generate the right content asset

Choose content type that best matches the prompt:
- Direct answer page
- Category explainer
- Comparison page
- Alternatives page
- FAQ-heavy landing page
- Blog/tutorial-style educational page

Writing rules:
- First 2 sentences must directly answer the prompt/topic.
- Mirror winning prompt language where truthful and relevant.
- Include concrete details and evidence; avoid fluffy "leading platform" claims.
- Add structured sections AI systems can quote quickly (tables, bullets, FAQ).
- Include 4-6 FAQs mapped to real prompts from the AI Visibility dataset.

Always include these meta fields:
- `metaTitle`
- `metaDescription`
- `slug`

### Step 5: Recommend simulation before publishing

Before publishing, explicitly recommend AI Visibility simulation:

"Before publishing, I recommend running this through AI Visibility's Simulate Changes workflow. Paste the draft in and test it against the exact prompts where we're underperforming so we can validate likely citation lift before it goes live."

If user wants to simulate first, stop and provide the exact draft payload.
If user wants to publish now, continue.

### Step 6: Push draft to CMS

Create draft content in the connected CMS:
- **Sanity**: `create_documents_from_markdown` (save as draft)
- **Contentful**: `create_entry` (leave unpublished)
- **HubSpot**: `create_blog_post` with `state: DRAFT`
- **WordPress**: `wp_create_post` with `status: draft`
- **Ghost**: `create_post` with `status: draft`
- **Webflow**: `create_cms_item` unpublished

Do not publish live without explicit instruction.

If no CMS is connected, output complete Markdown with meta fields and section structure intact.

### Step 7: Final handoff format

Return:
1. Opportunity selected and why
2. Gap diagnosis summary
3. Final draft content (or CMS draft confirmation with link)
4. Simulation recommendation/next action

## Quality checklist

- Uses AI Visibility data, not generic SEO assumptions
- Targets one concrete prompt/topic cluster
- Opens with a direct answer
- Includes structured quote-friendly blocks (table + FAQ)
- Includes `metaTitle`, `metaDescription`, and `slug`
- Ends with simulation guidance before publication
