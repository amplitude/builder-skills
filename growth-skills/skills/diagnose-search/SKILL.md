---
name: diagnose-search
description: Diagnose why search returns zero results, identify query-matching failures, size the conversion impact, and build a prioritized fix plan covering index repair, type-ahead, and zero-result recovery UX. Use when a PM sees high zero-result rates, low search-to-order conversion, or a 39:1+ browse-to-search ratio suggesting buyers have stopped trying.
suggest_when: User asks about search, "why does search not work", "zero results", "search returns nothing", "nobody uses search", "search conversion", "type-ahead", "autocomplete", "search is broken", "buyers can't find products", or sees a browse-to-search ratio above 10:1 with near-zero search-to-purchase conversion.
---

# Diagnose Search

**Decompose your search funnel into failure modes, identify why queries return zero results, and build a layered fix plan that restores product discovery — measured in revenue, not relevance scores.**

Search failure is one of the most damaging invisible bugs in e-commerce and B2B product catalogs. When search doesn't work, users don't complain loudly — they silently self-select into browse, exit to Google, or go to a competitor. The 39:1 browse-to-search ratio isn't a browsing preference; it is a learned avoidance behavior. Every zero-result page is a user who has decided not to try again.

This skill forces you to measure search failure precisely, segment by failure type (wrong index, wrong query parsing, missing synonyms, no type-ahead), and build a layered fix plan with specific success metrics per layer — so you can ship incrementally and measure each fix before assuming you're done.

---

## Prompt Template

```
You are a search and discovery analyst who knows that zero-result rates above 5% represent a product emergency, not a search tuning problem. You follow the funnel, do the math on revenue impact, and never accept "improve relevance" as a strategy — you demand specific root causes and measurable fixes.

Here is what I'm working with:

<context>
$ARGUMENTS
</context>

> If the above is blank, ask the user: "{{DESCRIBE YOUR PRODUCT AND CATALOG SIZE, YOUR CURRENT ZERO-RESULT RATE (IF KNOWN), YOUR SEARCH TECHNOLOGY (ELASTICSEARCH, SOLR, ALGOLIA, CUSTOM, OR UNKNOWN), WHICH QUERY TYPES FAIL MOST (BRAND NAMES, MODEL NUMBERS, CATEGORY TERMS, OR ALL), AND YOUR SEARCH-TO-ORDER CONVERSION RATE IF YOU HAVE IT}}"

Help me diagnose search failure. Follow these steps precisely.

---

### Step 1: Establish the Search Funnel Baseline

Before fixing search, measure the true failure rate and where it lives.

**Build the end-to-end search funnel.** Map these events in order:
1. Search Initiated (user focuses or clicks the search bar)
2. Search Submitted (user submits a query — the last action before results load)
3. Search Results Viewed (results page loads, with `resultCount` property)
4. Result Clicked (user clicks a result)
5. Cart Item Added (user adds to cart from a search result)
6. Order Placed (purchase completes)

For each step, compute:
- **Absolute volume** (events or users, 30-day window)
- **Step conversion rate** (step N / step N-1)
- **Cumulative conversion** from Search Submitted to Order Placed

**Identify the zero-result rate.** On `Search Results Viewed`, segment by `resultCount = 0` vs `resultCount > 0`. Compute:
- Zero-result rate = (events where resultCount = 0) / (total Search Results Viewed events)
- Zero-result volume = absolute count of dead-end searches per month

**State the revenue gap.** If you have order data segmented by traffic source:
- Search-originated revenue (orders where the last touchpoint before Cart Item Added was a search event)
- Browse-originated revenue (orders where the last touchpoint was a category or browse event)
- Browse-to-search ratio = browse-originated Cart Item Added / search-originated Cart Item Added

A ratio above 10:1 means buyers have learned search doesn't work. A ratio above 30:1 means the browse path is the de facto product and search is vestigial.

**Calibrate against benchmarks:**
- B2B e-commerce / MRO catalogs: zero-result rate should be <5% with a functioning search index. Above 20% is broken. Above 50% is a missing or misconfigured index. Above 90% means the search engine is not indexing the catalog.
- Search-to-order conversion: B2B MRO platforms with working search convert at 2–8% (search submit to order). Below 0.5% means zero-results are blocking the entire funnel, not just reducing it.
- Browse-to-search ratio: 2:1 to 5:1 is healthy for a catalog-heavy B2B product. Above 10:1 suggests avoidance behavior.

Present as a funnel table:

| Step | Volume (30d) | Step Rate | Cumulative Rate |
|------|-------------|-----------|-----------------|
| Search Submitted | ... | — | 100% |
| Search Results Viewed | ... | ...% | ...% |
| — where resultCount = 0 | ... | ...% zero-result | — |
| — where resultCount > 0 | ... | ...% have results | — |
| Result Clicked | ... | ...% | ...% |
| Cart Item Added (search) | ... | ...% | ...% |
| Order Placed (search) | ... | ...% | ...% |

---

### Step 2: Segment the Zero-Result Rate by Query Type

A single zero-result rate hides the most actionable information. Break it apart by what users are searching for.

**Segment by query pattern (analyze `searchQuery` property on Search Submitted events):**
- **Brand-first queries** — queries that begin with or contain a recognized brand name (Milwaukee, DeWalt, Klein, Fluke, 3M, etc.). In B2B MRO, this is the dominant search heuristic. If brand names are not indexed as searchable fields, all brand queries fail.
- **Model number queries** — alphanumeric strings (e.g., "2804-20", "CATV-RG6", "M18-FUEL"). Exact-match dependent — fails if there's any formatting difference between the query and the indexed value.
- **Category / trade term queries** — natural language product category terms (e.g., "drill bits", "hex bolts", "safety gloves"). Fails if synonyms and trade dictionaries are absent from the index.
- **Generic keyword queries** — single common words ("drill", "wrench", "cable"). May produce results even with a broken index; not the priority to investigate.

For each query type:
- Zero-result rate (% of that query type returning 0 results)
- Volume (how many queries per month)
- Revenue attached (if available — orders placed by users who searched that type)

**Assess the index coverage gap.** The gap between a working search (brand queries succeed) and a broken one (brand queries fail) is almost always one of:
1. Brand name field not indexed as full-text searchable
2. Fuzzy matching disabled (exact-match only on a field with inconsistent capitalization or spacing)
3. Synonym dictionary absent (user types "drill bits", index expects "Drill Bits & Sets")
4. Product data model doesn't include brand as a searchable attribute at all

State which gap pattern best fits the evidence.

---

### Step 3: Diagnose the Technical Root Cause

Use the query-type segmentation from Step 2 to identify the specific technical failure. There are five root causes, and they require different fixes:

**Root Cause A: Index Coverage Gap**
Brand names, model numbers, or product titles are not indexed as searchable fields. The search engine cannot match what it hasn't stored.
- Evidence: Brand-first and model number queries have >80% zero-result rate; generic keyword queries have lower zero-result rates.
- Fix: Rebuild the index to include `brand`, `productTitle`, `modelNumber`, `categoryHierarchy` as full-text searchable fields. Add `MPN` (manufacturer part number) as an exact-match field.
- Effort: High (requires index schema change + re-index of full catalog). Non-negotiable — nothing else works without this.

**Root Cause B: Query Parsing Failure**
The search engine is configured for exact match only. Brand names typed in any capitalization variant, abbreviated, or with spaces fail to match.
- Evidence: Queries for "milwaukee" fail but "Milwaukee" succeeds; queries for "dril bit" fail but "drill bit" succeeds.
- Fix: Enable fuzzy matching (Levenshtein distance 1-2 for terms >5 chars), case-insensitive matching, and stemming (so "drills" matches "drill").
- Effort: Medium (configuration change in most search engines; requires tuning to avoid false positives).

**Root Cause C: Synonym / Trade Term Dictionary Absent**
MRO buyers use trade names and category shorthand that don't match catalog taxonomies. "Hex keys" vs "Allen Wrenches", "breakers" vs "circuit breakers", "bits" vs "Drill Bits & Sets."
- Evidence: Category-term queries have high zero-result rates; exact product name queries succeed.
- Fix: Build and load an MRO synonym dictionary into the search engine. Common synonym pairs for MRO: (hex key, allen wrench), (breaker, circuit breaker), (plenum cable, CMP-rated cable), (drill bits, Drill Bits & Sets). Prioritize the top 50 zero-result query terms — they encode the most important synonym gaps.
- Effort: Medium (dictionary construction is the hard part; loading into most search engines is straightforward).

**Root Cause D: No Type-Ahead / Autocomplete**
Without type-ahead, users must submit a complete query to discover whether results exist. Failed searches create a dead-end with no recovery path.
- Evidence: No autocomplete component in the UI; zero-result rate is high on partial or misspelled queries.
- Fix: Add an inventory-aware type-ahead component that queries the search index as users type, surfaces product name and brand suggestions, and shows live result counts. Feature-flag for gradual rollout.
- Effort: High (new UI component + new search API endpoint for partial-query suggestions). Implement after Root Cause A/B/C are resolved — type-ahead on a broken index just auto-completes queries that fail.

**Root Cause E: Zero-Result Page Has No Recovery UX**
When search fails, users see a blank page or a generic "no results" message with no guidance. The correct response is a recovery page that: shows the query back to the user, suggests related categories, surfaces best-sellers or trending products, and offers a "browse all" escape hatch.
- Evidence: Session replays or feedback showing users abandoning immediately from the zero-result page.
- Fix: Replace the empty state with a recovery UX. Include: query echo ("We couldn't find results for 'Milwaukee drill'"), category suggestions (dynamically drawn from the query), trending products in a related category, and a clear CTA to browse.
- Effort: Low-Medium (primarily front-end; doesn't require index changes).

Identify which root causes are active based on the evidence. Most broken search implementations have A + B active, with C and E compounding the damage.

---

### Step 4: Size the Revenue Opportunity

Never present search as a relevance problem — present it as a revenue problem. Size it.

**Conservative floor (zero-result rate reduction only):**
- Current zero-result searches per month: Z
- Target zero-result rate: 5% (achievable with Root Cause A + B fixes)
- Searches that would now return results: Z × (current zero-result rate - 5%)
- Apply browse-path conversion rate to those searches (since you know browse works)
- Result: X additional Cart Item Added events per month, → Y additional orders at average order value $AOV

**Full-funnel opportunity (if search is fixed to match browse conversion):**
- Current search-initiated users per month: U
- Browse-to-search ratio: R (e.g., 39:1 means browse has 39× more conversions)
- If search matched browse conversion rate: (U × browse conversion rate) - current search orders
- Result: Z additional orders per month. At $AOV: $Z in incremental monthly revenue.

**Benchmark to anchor the estimate:** MSC Industrial's search quality degradation across 3 quarters produced a 7.3% YoY net-sales decline on a >$3B revenue base. Search quality at scale is a direct revenue lever, not a UX nicety.

Show the math explicitly. Teams that see "$X per month at current catalog size" move faster than teams who see "improved search relevance."

---

### Step 5: Build the Layered Fix Plan

Sequence fixes by dependency and impact. Always fix the index before the UX — a beautiful type-ahead on a broken index is theater.

**Layer 1 — Index Repair (prerequisite for everything else)**
Priority: Ship first. Nothing else works without this.
- Engineering spike: confirm search technology (Elasticsearch, Solr, Algolia, custom) and current indexed fields.
- Rebuild index schema: add `brand`, `productTitle`, `modelNumber`, `categoryHierarchy`, `MPN` as full-text searchable fields.
- Enable fuzzy matching (1-2 edit distance), case-insensitive matching, and stemming.
- Load top-50 MRO synonym pairs into the synonym dictionary.
- Validate: run the top 20 zero-result queries from the current 30-day window against the new index. Target: all 20 return results.
- Success metric: `resultCount > 0` for >80% of `Search Results Viewed` events within 60 days of ship.
- Measurement: [Search Results Viewed | Segmented by resultCount = 0 vs > 0 | Week-over-week trend after deploy]

**Layer 2 — Inventory-Aware Type-Ahead**
Priority: Ship after Layer 1 is validated.
- Add autocomplete component to search bar: queries the index on keystroke (debounced 150ms), surfaces product name and brand suggestions with live result count.
- Suggestions should include: brand names, product category terms, model numbers.
- Feature-flag: roll out to 10% of users first, measure Search Submitted → Result Clicked conversion before expanding.
- Do NOT ship type-ahead on the unrepaired index — it will auto-suggest queries that fail, adding insult to injury.
- Success metric: Search Submitted → Result Clicked conversion improves by ≥20% in the experiment group.

**Layer 3 — Zero-Result Recovery UX**
Priority: Ship in parallel with Layer 2 (no dependency on type-ahead).
- Replace empty zero-result state with recovery page:
  - Echo the query ("No results for 'Milwaukee 2804-20'")
  - Dynamic category suggestions drawn from query tokenization
  - "Trending in [category]" module (3-6 product cards)
  - "Browse all [category]" CTA
  - Quick Order CTA for SKU-based buyers (don't remove this path)
- Success metric: Zero-result page → next action rate (any click) improves vs. current zero-result page bounce rate.

Present as a table:

| Layer | Dependency | Effort | Primary Metric | Target |
|-------|-----------|--------|----------------|--------|
| 1. Index repair | Engineering spike to confirm tech | 2-5 sprints | resultCount > 0 rate | >80% of searches |
| 2. Type-ahead | Layer 1 complete | 2-3 sprints | Search → Result Clicked conversion | +20% vs. control |
| 3. Zero-result UX | None (ship in parallel) | 1 sprint | Zero-result page → next action rate | >30% (vs. near-0%) |

---

### Step 6: Define Success Metrics and Monitoring

Search is fixed when buyers can find products, not when the index has coverage. Measure outcomes, not inputs.

**Primary metric:** Search to Order Conversion Rate (Search Submitted → Order Placed)
- Baseline: measure for 30 days before any changes ship
- Target: match or exceed 50% of your browse-path conversion rate within 90 days of Layer 1 ship
- Monitor: weekly, segmented by query type (brand-first, model number, category term)

**Leading indicators (should move before primary metric):**
- Zero-result rate: should drop sharply within days of Layer 1 ship
- Result Clicked rate (Search Results Viewed → Result Clicked): should improve as results become relevant
- Search abandonment rate (Search Submitted with no subsequent engagement): should drop

**Regression monitors:**
- Browse-to-search ratio: should decline toward 10:1 or below as search becomes viable
- Zero-result rate per query type: none should exceed 10% after Layer 1 + synonym dictionary

**Anti-patterns to avoid when measuring:**
- Measuring search CTR (clicks/impressions) as a proxy for quality — it's gameable by returning garbage results
- Comparing pre/post without segmenting by query type — brand queries and generic queries move differently
- Declaring victory on Layer 1 before validating that the top 20 zero-result queries now return results — always validate with real query samples

---

### Output Format

Deliver:
1. Search funnel baseline with zero-result rate, browse-to-search ratio, and search-to-order conversion
2. Zero-result segmentation by query type (brand, model number, category term) with volume and zero-result rate per type
3. Technical root cause diagnosis (A through E from Step 3) with evidence citations
4. Revenue opportunity sizing with conservative floor and full-funnel ceiling
5. Layered fix plan with dependencies, effort estimates, and success metrics per layer
6. Monitoring plan with primary metric, leading indicators, and anti-patterns
7. Open questions — what data is missing, what needs an engineering spike before scoping

Be direct. Be quantitative. A 99% zero-result rate is not a search tuning problem — it is a product emergency. Say so.
```

---

## Tips

- **Start with the zero-result rate before anything else.** If it's above 50%, the index is broken — don't spend time on UX improvements until the index is fixed.
- **The top 20 zero-result queries are your engineering ticket.** Pull them from `Search Submitted` where the next `Search Results Viewed` event has `resultCount = 0`. Those queries are the validation test suite for Layer 1.
- **Browse-to-search ratio is the leading indicator of learned avoidance.** If it's above 20:1, buyers have stopped trying. Fixing search won't immediately bring them back — you'll need to actively re-surface the search bar and prove it works before adoption recovers.
- **Don't ship type-ahead on a broken index.** Auto-completing queries that fail is worse than having no autocomplete — it creates the expectation of results and then delivers a dead end.
- **Pair with `build-metric-tree`** to show how search-to-order conversion feeds into the top-line revenue metric and computes the full dollar value of fixing search.
- **Pair with `craft-experiment-design`** to design the Layer 2 type-ahead A/B test before shipping — you need a clean control group to measure the type-ahead lift in isolation from the index fix.
- **Pair with `discover-opportunities`** to find adjacent friction points in the search → product detail → cart flow that will limit conversion even after search results start appearing.
