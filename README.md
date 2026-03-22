# amplitude-builder-skills

**Open-source AI skills for builders — battle-tested at Amplitude.**

Builders spend too much time on the mechanics of writing specs, synthesizing research, analyzing data, and drafting comms — and not enough time on the thinking behind them. These skills give AI the structure and context to handle the mechanical parts, so you can focus on the decisions that matter.

---

## Plugins

Each folder is an independently installable plugin, organized by discipline. Install the whole repo or pick the ones you need.

### [product-skills](product-skills/) — Craft & ship products

Specs, experiments, research synthesis, and readouts.

| Type | Name | What it does |
|------|------|-------------|
| Skill | [craft-spec](product-skills/skills/craft-spec/SKILL.md) | Turn messy ideas into a clear, structured PRD |
| Skill | [craft-experiment-design](product-skills/skills/craft-experiment-design/SKILL.md) | Write a hypothesis, define success metrics, and plan a holdout strategy |
| Skill | [craft-experiment-readout](product-skills/skills/craft-experiment-readout/SKILL.md) | Summarize results, call a winner, and draft a stakeholder-ready recommendation |
| Skill | [craft-discovery-synthesis](product-skills/skills/craft-discovery-synthesis/SKILL.md) | Extract themes and insights from raw user interviews and feedback |
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
| Skill | [daily-brief](analytics-skills/skills/daily-brief/SKILL.md) | Daily briefing of anomalies, trends, risks, and wins |
| Skill | [discover-opportunities](analytics-skills/skills/discover-opportunities/SKILL.md) | Cross-reference analytics, experiments, and feedback for opportunities |
| Skill | [monitor-experiments](analytics-skills/skills/monitor-experiments/SKILL.MD) | Monitor all experiments, triage by importance, deep-analyze top ones |
| Skill | [weekly-brief](analytics-skills/skills/weekly-brief/SKILL.md) | Weekly summary of trends, wins, risks, and inflection points |
| Skill | [what-would-lenny-do](analytics-skills/skills/what-would-lenny-do/SKILL.md) | Channel Lenny Rachitsky's product wisdom |
| Command | [daily-standup](analytics-skills/commands/daily-standup.md) | Daily brief + experiment check + feedback scan in one workflow |
| Command | [weekly-review](analytics-skills/commands/weekly-review.md) | Weekly brief + opportunities + experiment readouts in one workflow |

### [design-skills](design-skills/) — Design & research

User research, journey mapping, usability analysis, and design critique. *Coming soon.*

### [engineering-skills](engineering-skills/) — Build & ship

Technical design docs, code review, incident analysis, and architecture decisions. *Coming soon.*

### [growth-skills](growth-skills/) — Grow & optimize

Activation analysis, retention strategies, funnel optimization, and go-to-market planning. *Coming soon.*

## Skills vs Commands

- **Skills** are standalone prompt templates for a single task. They need your context (notes, data, ideas) and produce creative/analytical output.
- **Commands** chain multiple skills into guided workflows. They orchestrate the conversation, gather context step by step, and produce a comprehensive deliverable.

## How to Use

**As a Claude plugin:**
1. Add this marketplace to your Claude client
2. Install the plugin(s) you want
3. Skills and commands appear in your skill selector

**As prompt templates:**
1. Browse a plugin's `skills/` folder and find a skill
2. Open the `SKILL.md` and copy the prompt template
3. Paste it into your LLM, fill in the placeholders, and run it

## Contributing

- **Improve a skill** — open a PR with changes to any `SKILL.md` file
- **Add a new skill** — create a folder under the appropriate plugin's `skills/` directory
- **Add a command** — create a `.md` file in the appropriate plugin's `commands/` directory
- **Share feedback** — open an issue describing what worked, what didn't, or what's missing

---

Built by the builder team at [Amplitude](https://amplitude.com).
