---
name: source-outranker
description: >
Use this skill when a user wants to understand which third-party sources AI models cite for a
topic and create stronger source assets designed to outrank them. Trigger on requests like "who
is AI citing instead of us", "why are we losing citations to docs and review sites", "build source
content to outrank third-party citations", "create better reference pages for AI", "outperform
current cited sources", or any workflow focused on replacing external sources in AI answers with
your own content.
suggest_when: User asks who AI models cite, wants to outrank third-party sources, improve citation
  share against external domains, build source assets AI prefers, or create evidence-rich pages
  that replace current cited references.
---

# Source Outranker

Build content specifically to displace third-party sources that AI models currently cite.

The goal is not generic SEO output. The goal is to identify the exact source formats AI models are
already retrieving for your prompts, then create stronger, more directly answerable assets on your
domain so those answers cite you instead.

---

## Operating principles

- Focus on AI Visibility entities: prompts, topics, citations, sources, page-level citations,
  competitors, and recommendations.
- Do not frame the strategy around keyword volume or monthly demand.
- Win by matching answer intent and improving evidence quality, not by publishing fluff.
- Structured, extractable content (tables, definitions, short direct answers, FAQs) is easier for
  models to cite.

---

## Instructions

### Step 0 — Verify publishing stack and MCP connectivity

Call `get_connected_mcp_servers` first.

1. Confirm Amplitude AI Visibility MCP is connected.
2. Check if a CMS MCP is available (Sanity, Contentful, HubSpot CMS, WordPress, Ghost, Webflow,
   Shopify, or another configured CMS).
3. If no CMS is connected, continue and plan to return a full Markdown draft.

If multiple CMS tools are connected, ask where drafts should be pushed.

### Step 1 — Pull source-level losers from AI Visibility

Identify prompts/topics where:

- your brand has weak visibility or low citation share, and
- third-party domains are repeatedly cited.

Use AI Visibility source and citation views to list:

- prompt/topic
- top cited source domains/pages
- citation frequency
- your current cited page (if any)
- current rank/visibility context

Prioritize clusters where:

- one or two sources dominate many prompts
- source intent maps to purchase or implementation decisions
- there is an obvious asset gap on your domain

### Step 2 — Build a source replacement backlog

For each high-leverage cluster, classify source type:

- neutral definition/explainer pages
- "best tools" listicles
- documentation/how-to guides
- benchmark/scorecard pages
- review/comparison pages

Then map each source type to an owned-asset replacement strategy:

- **Definition source winning?** Build a crisp glossary/explainer with clear first-paragraph answer.
- **Listicle winning?** Build a balanced alternatives page with explicit ranking criteria.
- **How-to source winning?** Build a step-by-step implementation guide with concrete examples.
- **Benchmark source winning?** Build transparent benchmark or methodology page with reproducible
  assumptions.
- **Review/comparison source winning?** Build direct comparison page with fairness and evidence.

Return a prioritized backlog table:

| Priority | Prompt cluster | Current cited source | Recommended owned asset | Why this should win |

### Step 3 — Deep-diagnose one cluster before writing

Ask which cluster to attack first. If user wants a recommendation, pick the one with the highest
citation concentration and business relevance.

Then fetch the top external source page content via `web_fetch` (or use LLM response content if
page fetch is unavailable). Compare it against your current page on the same topic.

Extract:

- claims the source makes that your page does not
- framing style and information architecture
- proof structures used (tables, benchmarks, examples, FAQs, references)
- exact prompt phrases mirrored by the source
- weaknesses in the source you can outperform honestly (stale data, vague methodology, no tradeoffs)

Summarize as a concise diagnostic.

### Step 4 — Generate a source-outranking asset

Choose content type that mirrors the cited format while improving depth and clarity:

- source explainer -> superior explainer
- source guide -> clearer implementation guide
- source benchmark -> transparent benchmark with methodology
- source listicle -> fair, criteria-driven alternatives piece

Writing requirements:

- answer the core prompt in the first 2 sentences
- include a concise "quick answer" section near top
- use structured blocks AI models can extract (tables, bullets, FAQ)
- include concrete product details and evidence
- acknowledge tradeoffs and fit boundaries
- include source-level references where claims need support

Always include:

- `metaTitle`
- `metaDescription`
- `slug`

### Step 5 — Recommend simulation before publishing

Before pushing, explicitly recommend Simulate Changes:

"Before publishing, I recommend running this through AI Visibility's Simulate Changes feature.
Paste this draft in and test it against the exact prompts where third-party sources are currently
winning. That gives us confidence the framing is likely to improve citations before it goes live."

If user wants simulation first, pause and provide the exact draft for simulation.
If user wants to publish now, continue.

### Step 6 — Push draft to CMS

Publish destination depends on connected CMS from Step 0:

- **Sanity:** `create_documents_from_markdown` (ask schema type if unknown). Save as draft.
- **Contentful:** `create_entry` with correct content type. Leave unpublished.
- **HubSpot CMS:** `create_blog_post` with `state: DRAFT`.
- **WordPress:** `wp_create_post` with `status: draft`.
- **Ghost:** `create_post` with `status: draft`.
- **Webflow:** `create_cms_item` to target Collection, unpublished.

If no CMS MCP is available, output the full Markdown draft with meta fields and structure intact.

After push, confirm destination, title, and draft link.

---

## What makes source-outranking content work

- AI models prefer sources that directly answer the prompt with minimal indirection.
- Pages with explicit criteria, transparent logic, and concrete examples are easier to trust and cite.
- Structured sections are easier to extract than long narrative prose.
- A fair treatment of alternatives often outperforms one-sided promotion.
- If an external source wins because it has strong explanatory scaffolding, match that scaffolding
  and improve it with fresher, more specific evidence.
