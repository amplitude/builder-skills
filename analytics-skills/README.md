# analytics-skills

**Amplitude-powered analytics skills for builders.**

Use AI to analyze dashboards, charts, experiments, feedback, and account health — powered by the Amplitude MCP server.

## Skills

| Skill | What it does |
|-------|-------------|
| [analyze-account-health](skills/analyze-account-health/SKILL.md) | Summarize B2B account health: usage patterns, engagement, risk signals, expansion opportunities |
| [analyze-chart](skills/analyze-chart/SKILL.md) | Deep-dive into a specific chart to explain trends, anomalies, and likely drivers |
| [analyze-dashboard](skills/analyze-dashboard/SKILL.md) | Analyze dashboards end-to-end: surface concerns, identify anomalies, explain changes |
| [analyze-experiment](skills/analyze-experiment/SKILL.md) | Design, analyze, and interpret A/B tests with statistical rigor |
| [analyze-feedback](skills/analyze-feedback/SKILL.md) | Synthesize customer feedback into actionable themes and prioritized recommendations |
| [create-chart](skills/create-chart/SKILL.md) | Create Amplitude charts from natural language descriptions |
| [create-dashboard](skills/create-dashboard/SKILL.md) | Build comprehensive dashboards from requirements or goals |
| [monitor-experiments](skills/monitor-experiments/SKILL.md) | Monitor all active and recently completed experiments, triage by importance |

## Commands

| Command | What it does |
|---------|-------------|
| [daily-standup](commands/daily-standup.md) | Run a full daily standup: brief + experiment check + feedback scan |
| [weekly-review](commands/weekly-review.md) | Run a weekly product review: brief + opportunities + experiment readouts |

## Requirements

This plugin requires the [Amplitude MCP server](https://mcp.amplitude.com). The `.mcp.json` file is included — your MCP client should pick it up automatically.
