---
name: prompt-gap-to-publish
description: >
  Use this skill whenever a user wants to turn AI Visibility data into published content — whether
  they say "find content gaps", "what should we write about", "which topics have low visibility",
  "help me get cited by AI models", "create a blog post from our AI Visibility gaps", "we're losing
  to competitors on these prompts", or any variation where they want to go from AI visibility
  weakness to a draft article, landing page, or FAQ. This skill connects directly to Amplitude AI
  Visibility data (topics, prompts, visibility scores, citations, competitor data, full LLM responses
  and sources) and produces a publish-ready content brief plus full article draft. If the user
  mentions CMS (WordPress, Webflow, Contentful, Sanity, HubSpot, Ghost, Shopify), also trigger this
  skill to push the draft directly. Trigger even if they just say something vague like "what content
  should we create?" in an AI Visibility context.
---

# Prompt Gap to Publish

You're helping a marketing or content team turn AI Visibility gaps into real published content. The
core insight: when AI models answer questions in your product category, your brand's presence is
measurable — visibility %, average rank, citation count. Where you're weak is where you should
write. This skill finds those gaps and produces a publish-ready article draft — and pushes it
straight into the user's CMS as a draft.

---

## Step 0 — CMS Discovery (run once at the start of every session)

Before pulling any data, figure out where content will land. This saves the user from a copy-paste
dead end at the finish line.

### Check for already-connected CMS tools

Look at the tools currently available in your context. Known CMS MCP patterns to check for:

| CMS | MCP tool name patterns to look for |
|-----|-------------------------------------|
| Sanity | `sanity`, `create_documents_from_markdown`, `publish_documents` |
| Contentful | `contentful`, `create_entry`, `publish_entry` |
| HubSpot CMS | `hubspot`, `create_blog_post`, `update_blog_post` |
| WordPress | `wordpress`, `wp_create_post` |
| Ghost | `ghost`, `create_post` |
| Webflow | `webflow`, `create_cms_item` |

**If a CMS MCP is already connected:** Great — confirm with the user in one sentence:
*"I can see you have [CMS] connected — I'll push the article there as a draft when we're done. Sound good?"*
Then proceed to Step 1.

**If no CMS MCP is detected:** Ask the user directly. Keep it short and warm — this is a one-time
setup moment:

> "Before we dive in — which CMS do you publish to? Once I know, I can push the article there as a
> draft automatically instead of handing you a block of Markdown to paste."

Offer these options (or let them type their own):
- Sanity
- Contentful
- HubSpot CMS
- WordPress
- Webflow
- Ghost / Shopify / Other
- "Just give me Markdown for now"

### Recommend the integration based on their answer

Once you know their CMS, give them a short, specific setup recommendation — then offer to continue
anyway while they set it up:

**Sanity:**
> "The Sanity MCP connector is available in the Cowork marketplace. Go to Settings → Plugins →
> search 'Sanity' and connect it with your project ID and token. Takes about 2 minutes. Want me to
> continue finding your content gaps while you do that? I'll be ready to push the draft when you're
> connected."

**Contentful:**
> "There's a Contentful MCP connector available. Go to Settings → Plugins → search 'Contentful'
> and add your Space ID and Content Management API token. Continue finding gaps now?"

**HubSpot CMS:**
> "HubSpot may already be connected via Glean. If not, search 'HubSpot' in Settings → Plugins.
> I'll create a blog post draft there when we're done."

**WordPress:**
> "WordPress can connect via MCP (search 'WordPress' in Settings → Plugins, you'll need your site
> URL and an Application Password from WordPress admin). Alternatively, I can use Chrome to draft
> the post directly in your WordPress admin — just share the URL. Which works better?"

**Webflow:**
> "Webflow's CMS API is the cleanest path — search 'Webflow' in Settings → Plugins and connect
> with your API key and Collection ID. I can also automate it via Chrome if you prefer not to set
> up a plugin."

**Ghost:**
> "Ghost has a well-documented Admin API. Search 'Ghost' in Settings → Plugins and add your Admin
> API key and site URL. Quick to set up."

**"Just Markdown for now":**
> "No problem — I'll give you a clean Markdown file at the end, formatted to paste straight into
> any CMS. You can always connect your CMS later and we'll push directly."

After giving the recommendation, **don't wait for them to finish the setup** — say something like:
*"I'll start pulling your content gaps now. By the time I have the article ready, you'll be all
set."* Then proceed to Step 1.

Store which CMS they named and whether it's connected — you'll use this in Step 6.

---

## Step 1 — Identify the Brand

Use `list_ai_visibility_org_brands` to fetch available brands, then:

- If the user mentioned a specific brand name, match it.
- If there's only one brand in the list, use it without asking.
- Otherwise, present the list and ask the user to pick.

Note the `orgBrandId` — you'll need it throughout.

---

## Step 2 — Pull the Latest Report's Topic Data

Use `get_ai_visibility_topics` with the selected `orgBrandId` (omit `reportId` to get the latest).
For each topic capture: `topicId`, `topicName`, `visibilityPercentage`, `averageRank`,
`relevancyScore`, and citation counts.

**Opportunity heuristic:** topics with relevancy > 60% and visibility < 40% are your goldmine —
AI models consider them core to the brand's category but barely mention the brand. Also flag topics
where a competitor leads by 20+ points.

---

## Step 3 — Drill into Prompts

For the top 3–5 opportunity topics, use `get_ai_visibility_prompts` with the `topicId`. Look for:

- Prompts where the brand has 0% or very low visibility
- Prompts where competitors dominate the response
- Prompts with high response counts (more AI answers = more citation opportunity)

If available, use `get_ai_visibility_prompt_responses` to read the actual LLM-generated answers for
the weakest prompts — this shows exactly what AI models currently say. It's the best possible brief
for writing a better answer.

---

## Step 4 — Rank and Present the Opportunities

Present a ranked shortlist of **3–5 content opportunities**:

| # | Topic | Representative prompt | Amplitude visibility | Top competitor | Content type |
|---|-------|----------------------|---------------------|----------------|--------------|
| 1 | ... | "..." | X% | Competitor Y% | Landing page |

**Content type guide:**
- **Blog post** — informational / comparison queries ("What is X?", "X vs Y", "How does X work?")
- **Landing page** — high-intent queries ("Best X tool", "X for [use case]")
- **FAQ page** — clusters of related questions on one topic
- **Product description** — feature-specific queries where the brand should be the definitive source

Ask: *"Which of these do you want to write first?"* Wait for their pick.

---

## Step 5 — Generate the Content Draft

Write a full, publish-ready draft for the chosen opportunity. Not a skeleton — real sentences,
real content. The user should be able to paste this into a CMS today.

### Always include

**Content brief (upfront):**
- Target prompt / question
- Search intent: informational / navigational / commercial
- Primary audience
- Competitor gap: what do competitors say that the brand doesn't?
- LLM insight: quote or paraphrase what AI models currently say on this topic

**Article fields:**
- `slug` — URL-friendly, keyword-rich
- `metaTitle` — 50–60 characters, contains the primary keyword
- `metaDescription` — 140–160 characters, summarizes the article with a CTA

**Article body:**
- **H1** — matches the target prompt closely
- **Introduction** (2–3 paragraphs) — hook, brand authority, article preview
- **Body** (3–6 H2 sections) — comprehensive answer; cite specific product capabilities with
  concrete details; include data or examples; each section should teach something independently
  useful
- **FAQ block** (3–5 Q&As) — pull closely related prompts from Step 3; 2–4 sentences per answer;
  these are the formats AI models cite most reliably
- **Internal links** (3–5 suggestions) — reference likely page names or URL patterns
- **CTA** — one clear next step

### Tips for content that gets cited by AI models

- Answer the exact question in the first 2 sentences. AI models quote sources that answer directly.
- Be specific about product capabilities. "Amplitude tracks X" beats "we help companies grow."
- Cover competitors fairly. Articles that acknowledge competition rank better than ones that pretend
  it doesn't exist.
- Use the exact phrases AI models use. Mirror the prompt language in your H1 and first paragraph.
- The FAQ block is your most powerful citation magnet — format it as direct Q&A, not flowing prose.

---

## Step 6 — Publish to CMS

Use what you learned in Step 0.

### If a CMS MCP is connected

Create a draft directly. Follow this sequence:
1. Show the user the slug, title, and first 100 words — ask *"Ready to push this to [CMS] as a
   draft?"*
2. Once confirmed, create the draft with status `draft` (never `published` without explicit
   instruction).
3. Report back with the draft URL or document ID so the user can find it immediately.

**Sanity** — use `create_documents_from_markdown` with the article content. Set `_type` to match
the user's blog post schema (ask if unsure: "What's the document type for blog posts in your Sanity
schema?"). Use `publish_documents` only if the user explicitly asks to publish.

**Contentful** — use `create_entry` with `contentType` matching their blog or article type. Set
`fields.title`, `fields.slug`, `fields.body`. Leave `published: false`.

**HubSpot** — use the blog post creation tool with `state: DRAFT`. Include meta description and
slug in the API call.

**WordPress** — use `wp_create_post` with `status: draft`. Map the H1 to `title` and article body
to `content`.

**Ghost** — use `create_post` with `status: draft`. Include `slug`, `title`, `html` or `lexical`,
and `meta_description`.

**Webflow** — use `create_cms_item` targeting the blog Collection. Map fields to the Collection's
schema (ask the user for field names if the schema isn't obvious from context).

### If no CMS is connected yet

If the user said "just Markdown" or hasn't connected a CMS yet:

> "Here's your full article in Markdown — ready to paste into [CMS]. When you're ready to connect
> [CMS], I can push future articles there automatically."

Output the complete article as a clean, well-structured Markdown block.

Also say: *"Want me to help you set up the [CMS] connection now? It takes about 2 minutes."*
If yes, walk them through the plugin setup from Step 0.

**Always output the Markdown fallback** — even when CMS creation succeeds — so the user has a
local copy they own.
