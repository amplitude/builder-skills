# amplitude-builder-skills

**Open-source agent skills for "builders" — battle-tested for PMs, analysts, engineers, and marketers by the Amplitude team**

The best agent skills for product managers, analysts, engineers, marketers, and other AI-enabled "builders" as built or curated by the Amplitude team. Use this as your agent operating system when supercharging your workflows in Claude Code, Claude Cowork, Cursor, OpenAI Codex, and other agent harnesses.

---

## Plugins

Each folder is an independently installable plugin, organized by discipline. Install the whole repo or pick the ones you need.

### [product-skills](product-skills/) — Craft & ship products

Discovery, specs, experiments, readouts, and competitive strategy.

| Type | Name | What it does |
|------|------|-------------|
| Skill | [7-powers](product-skills/skills/7-powers/SKILL.md) | Analyze competitive advantage using Hamilton Helmer's 7 Powers framework |
| Skill | [amazon-working-backwards](product-skills/skills/amazon-working-backwards/SKILL.md) | Write a PR/FAQ to pressure-test a product idea before committing to build |
| Skill | [craft-spec](product-skills/skills/craft-spec/SKILL.md) | Turn messy ideas into a clear, structured PRD |
| Skill | [craft-experiment-design](product-skills/skills/craft-experiment-design/SKILL.md) | Write a hypothesis, define success metrics, and plan a holdout strategy |
| Skill | [craft-experiment-readout](product-skills/skills/craft-experiment-readout/SKILL.md) | Summarize results, call a winner, and draft a stakeholder-ready recommendation |
| Skill | [craft-discovery-synthesis](product-skills/skills/craft-discovery-synthesis/SKILL.md) | Extract themes and insights from raw user interviews and feedback |
| Skill | [create-user-stories](product-skills/skills/create-user-stories/SKILL.md) | Break a PRD into implementable user stories with acceptance criteria |
| Skill | [discover-opportunities](product-skills/skills/discover-opportunities/SKILL.md) | Discover product opportunities via Amplitude analytics, experiments, and feedback |
| Skill | [draft-spec](product-skills/skills/draft-spec/SKILL.md) | Draft a detailed spec with problem context, solution design, and strategic framing |
| Skill | [good-strategy-bad-strategy](product-skills/skills/good-strategy-bad-strategy/SKILL.md) | Evaluate or develop strategy using Rumelt's kernel — Diagnosis, Guiding Policy, Coherent Actions |
| Skill | [high-output-management](product-skills/skills/high-output-management/SKILL.md) | Diagnose team leverage, design processes, and make management decisions using Grove's framework |
| Skill | [jobs-to-be-done](product-skills/skills/jobs-to-be-done/SKILL.md) | Uncover functional, social, and emotional jobs driving customer behavior |
| Skill | [mom-test](product-skills/skills/mom-test/SKILL.md) | Design customer conversations that extract real signal, not polite lies |
| Skill | [playing-to-win](product-skills/skills/playing-to-win/SKILL.md) | Develop strategy using the Lafley/Martin cascade — Where to Play, How to Win |
| Skill | [pre-mortem](product-skills/skills/pre-mortem/SKILL.md) | Imagine launch failure and work backward to identify risks before you ship |
| Skill | [prioritize](product-skills/skills/prioritize/SKILL.md) | Take a list of ideas or initiatives and quickly rank them using RICE |
| Skill | [competitor-monitoring](product-skills/skills/competitor-monitoring/SKILL.md) | Visit competitor sites weekly and write a structured competitive intelligence report |
| Skill | [interview-scheduling](product-skills/skills/interview-scheduling/SKILL.md) | Find top Amplitude users, check calendar availability, and draft personalised Gmail outreach |
| Skill | [market-research-digest](product-skills/skills/market-research-digest/SKILL.md) | Synthesize Drive files, meeting notes, and web signals into a weekly research summary |
| Skill | [what-would-lenny-do](product-skills/skills/what-would-lenny-do/SKILL.md) | Answer product strategy and growth questions using Lenny Rachitsky's archive |
| Command | [write-prd](product-skills/commands/write-prd.md) | Guided PRD writing with conversational context gathering |
| Command | [run-discovery](product-skills/commands/run-discovery.md) | Full discovery workflow from research through experiment design |

### [analytics-skills](analytics-skills/) — Analyze with Amplitude

Dashboards, charts, experiments, feedback, and account health — powered by the Amplitude MCP server.

| Type | Name | What it does |
|------|------|-------------|
| Skill | [analyze-account-health](analytics-skills/skills/analyze-account-health/SKILL.md) | Summarize B2B account health: usage, engagement, risk, expansion |
| Skill | [analyze-chart](analytics-skills/skills/analyze-chart/SKILL.md) | Deep-dive into a chart to explain trends, anomalies, and drivers |
| Skill | [analyze-dashboard](analytics-skills/skills/analyze-dashboard/SKILL.md) | Analyze dashboards: surface concerns, identify anomalies, explain changes |
| Skill | [analyze-experiment](analytics-skills/skills/analyze-experiment/SKILL.md) | Design, analyze, and interpret A/B tests with statistical rigor |
| Skill | [analyze-feedback](analytics-skills/skills/analyze-feedback/SKILL.md) | Synthesize customer feedback into themes and prioritized recommendations |
| Skill | [create-chart](analytics-skills/skills/create-chart/SKILL.md) | Create Amplitude charts from natural language |
| Skill | [create-dashboard](analytics-skills/skills/create-dashboard/SKILL.md) | Build dashboards from requirements or goals |
| Skill | [monitor-experiments](analytics-skills/skills/monitor-experiments/SKILL.md) | Monitor all experiments, triage by importance, deep-analyze top ones |
| Skill | [churn-lost-deal-analysis](analytics-skills/skills/churn-lost-deal-analysis/SKILL.md) | Read CRM loss data, cluster by theme, and surface product gaps with ARR-weighted recommendations |
| Skill | [support-feedback-prioritization](analytics-skills/skills/support-feedback-prioritization/SKILL.md) | Pull Intercom + Slack signals, enrich with CRM data, and rank by customer value into a tiered report |
| Command | [daily-standup](analytics-skills/commands/daily-standup.md) | Daily brief + experiment check + feedback scan in one workflow |
| Command | [weekly-review](analytics-skills/commands/weekly-review.md) | Weekly brief + opportunities + experiment readouts in one workflow |

### [execution-skills](execution-skills/) — Stay on top of your product

Briefings, meeting processing, stakeholder comms, and idea stress-testing.

| Type | Name | What it does |
|------|------|-------------|
| Skill | [meeting-synthesis](execution-skills/skills/meeting-synthesis/SKILL.md) | Turn meeting transcripts or notes into concise takeaways and action items with DRIs |
| Skill | [stakeholder-update](execution-skills/skills/stakeholder-update/SKILL.md) | Write a weekly stakeholder update — metrics, bets, customer signal, highlights |
| Skill | [yes-and](execution-skills/skills/yes-and/SKILL.md) | Build on an idea constructively — extend what's working, surface risks with mitigations |
| Skill | [pm-weekly-brief](execution-skills/skills/pm-weekly-brief/SKILL.md) | Read Slack, calendar, and Drive activity from the past 7 days and write a personal PM summary |
| Skill | [release-notes-generator](execution-skills/skills/release-notes-generator/SKILL.md) | Read completed tickets and write polished, user-facing release notes grouped by product area |
| Skill | [update-knowledge-base](execution-skills/skills/update-knowledge-base/SKILL.md) | Cross-reference shipped tickets with your help center to detect outdated or missing docs |
| Command | [daily-brief](execution-skills/commands/daily-brief.md) | Multi-phase daily briefing — gathers Amplitude context, scans for anomalies, trends, risks, and wins |
| Command | [weekly-brief](execution-skills/commands/weekly-brief.md) | Multi-phase weekly summary — gathers Amplitude context, synthesizes trends, wins, risks, and inflection points |
| Command | [yc-office-hours](execution-skills/commands/yc-office-hours.md) | Interactive stress-test of a product idea with branching modes and forcing questions before committing to build |

### [design-skills](design-skills/) — Design & research

User research, journey mapping, usability analysis, and design critique. *Coming soon.*

### [engineering-skills](engineering-skills/) — Build & ship

Technical design docs, code review, incident analysis, and architecture decisions. *Coming soon.*

### [launch-skills](launch-skills/) — Launch & announce

Plan, message, and execute product launches at any scale — from major products to incremental improvements.

| Type | Name | What it does |
|------|------|-------------|
| Skill | [launch-strategy](launch-skills/skills/launch-strategy/SKILL.md) | Plan a launch with tiered framework, messaging brief, checklist, timeline, and retro |
| Skill | [launch-tweet](launch-skills/skills/launch-tweet/SKILL.md) | Craft launch tweets, threads, and social posts adapted for X, LinkedIn, BlueSky, and HN |
| Skill | [launch-email](launch-skills/skills/launch-email/SKILL.md) | Write launch emails — subject lines, announcement structure, segmentation, changelog digests |
| Skill | [launch-blog-post](launch-skills/skills/launch-blog-post/SKILL.md) | Write launch blog posts optimized for SEO and AI engine citation (AEO) |
| Skill | [launch-video](launch-skills/skills/launch-video/SKILL.md) | Plan and produce demo videos, GIFs, screenshots, and programmatic video with Remotion |
| Skill | [launch-landing-page](launch-skills/skills/launch-landing-page/SKILL.md) | Design launch landing pages with urgency mechanics, waitlists, and conversion optimization |
| Skill | [launch-distribution](launch-skills/skills/launch-distribution/SKILL.md) | Execute multi-channel distribution — Twitter, Reddit, LinkedIn, HN, Product Hunt, press |
| Skill | [launch-metrics](launch-skills/skills/launch-metrics/SKILL.md) | Set up UTMs, define KPIs by tier, run data-driven retros, and build a launch history |

### [growth-skills](growth-skills/) — Grow & optimize

Activation analysis, retention strategies, funnel optimization, and go-to-market planning.

| Type | Name | What it does |
|------|------|-------------|
| Skill | [build-metric-tree](growth-skills/skills/build-metric-tree/SKILL.md) | Decompose a top-line metric into a sized tree, identify where the real leverage is and where it isn't |
| Skill | [diagnose-activation](growth-skills/skills/diagnose-activation/SKILL.md) | Diagnose where new users fail to activate, identify the aha moment, and build a sized plan to move activation rate |
| Skill | [diagnose-retention](growth-skills/skills/diagnose-retention/SKILL.md) | Decompose your retention curve into cohorts, identify retention-predictive behaviors, and build a plan to bend the curve |
| Skill | [diagnose-monetization](growth-skills/skills/diagnose-monetization/SKILL.md) | Find revenue leaks, evaluate packaging and pricing, and size expansion revenue opportunities |
| Skill | [diagnose-acquisition](growth-skills/skills/diagnose-acquisition/SKILL.md) | Map where users come from, measure channel quality and CAC, and find the highest-leverage acquisition channels |
| Skill | [map-growth-loops](growth-skills/skills/map-growth-loops/SKILL.md) | Identify and measure self-reinforcing growth loops, find where loops break, and invest in compounding growth |

## Skills vs Commands

- **Skills** are standalone prompt templates for a single task. They need your context (notes, data, ideas) and produce creative/analytical output.
- **Commands** chain multiple skills into guided workflows. They orchestrate the conversation, gather context step by step, and produce a comprehensive deliverable.

## How to Install

**Step 1 — Add the marketplace** (one-time):
```bash
claude plugin marketplace add amplitude/builder-skills
```

**Step 2 — Install the plugin(s) you want:**
```bash
claude plugin install product-skills@builder-skills
claude plugin install analytics-skills@builder-skills
claude plugin install execution-skills@builder-skills
claude plugin install growth-skills@builder-skills
claude plugin install launch-skills@builder-skills
```

Skills are active globally across all Claude Code sessions. Invoke them naturally or by name (e.g. `/prioritize`, `/craft-spec`).

**Project-only install:** add `--scope project` to both commands to install into the current repo's `.claude/` instead of globally.

**Use as prompt templates (no install needed):** open any `SKILL.md`, copy the prompt template, replace `$ARGUMENTS` with your context, and paste into your LLM.

## Contributing

- **Improve a skill** — open a PR with changes to any `SKILL.md` file
- **Add a new skill** — create a folder under the appropriate plugin's `skills/` directory
- **Add a command** — create a `.md` file in the appropriate plugin's `commands/` directory
- **Share feedback** — open an issue describing what worked, what didn't, or what's missing

---

Built with ❤️ by the product, engineering, and design teams at [Amplitude](https://amplitude.com).
