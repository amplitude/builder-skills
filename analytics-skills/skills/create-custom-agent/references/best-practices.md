# Custom Agent Best Practices

Reference for the intake and review steps. These are the practices that separate an agent that earns its schedule from one people mute after two runs.

## Scope

- **One agent, one job.** A custom agent automates a single recurring workflow. When someone describes several outcomes, split them into separate agents. Narrow agents are easier to trust and tune.
- **Custom fits only when nothing built-in does.** Global Agent handles ad-hoc questions. The four Specialized Agents (Dashboard, Session Replay, Website Conversion, Customer Feedback) handle their domains better than a hand-built agent would. Custom is the right call when the workflow is recurring and unique to the team.
- **Start from a template when one is close.** The Agent Library ships forkable templates across funnel and activation, voice of customer, launch and experiment readouts, and account and churn. Adapting one beats a blank builder.

## Instructions

- **Specific beats short.** The strongest lever on output quality is concrete instructions. Add two or three detailed lines about the product area, the goal, and the metrics that matter.
- **Name real events.** Reference the actual event or metric by its name as it appears in the project. If unsure of the name, look it up first.
- **Pair a signal with its guardrail.** A metric alone misleads. Completions read differently next to enrollments; conversion reads differently next to traffic. Give the agent the context event that keeps the primary one honest.
- **Set a flag threshold.** Tell the agent what is worth surfacing ("week-over-week drop over 15%", "any zero-event day"). "Flag anything unusual" produces noise.
- **State the output shape.** Say what a good result looks like: headline numbers, ranked bullets, a table of top movers, a drafted ticket. The deliverable shape is part of the instruction.
- **Anchor to assets with `@mention`.** Instructions can pull a specific chart, dashboard, or cohort straight into the agent's context. This is more reliable than describing the data in prose.

## Tools and connectors

- **Give the minimum tools the job needs.** More tools mean more ways to wander. Add only what the workflow uses.
- **Connectors read and write.** Amplitude connects to Slack, Jira, Linear, GitHub, Notion, Confluence, Granola, and Sentry, among others. Read tools pull context in; write tools take action, like filing a ticket or posting a summary. If a tool is missing, a custom MCP connector can be added.
- **Every write is confirmed.** The agent asks before it writes to a connected tool, and it acts only with the permissions the person already has there.
- **Slack needs the Slackbot.** To deliver to a Slack channel, invite the `Amplitude` Slackbot to that channel. Without it, posting fails quietly.

## Capabilities

Turn on only what the workflow needs. Each has a cost or latency effect.

- **Memory** carries context across runs.
- **Customer Context** uses product and business context the person provides.
- **Long Conversations** supports extended, multi-step runs.
- **Extended Thinking** allows deeper reasoning on hard tasks.

## Schedule and delivery

- **Match cadence to the decision.** Run the agent as often as someone acts on it, and no more. Daily or weekly, with a set day, hour, and time zone.
- **Deliver where the work happens.** Route results to the Agent Inbox, Slack, or email so findings reach people without a trip into Amplitude.

## Guardrails and sharing

- **Humans approve user-facing actions.** Anything that touches end users (launching an experiment, creating a cohort) waits for human approval before it runs. Design agents to recommend and draft, leaving the action itself to a person.
- **Access is inherited.** An agent uses only the data its owner can access, following Data Access Controls and role permissions.
- **Private by default.** Agents start private to their creator. Publish to share insights with the org. Admins can audit agent input and output.

## After it ships

- **Read the first few runs.** Treat the early outputs as a draft. Tighten the instructions where the agent guessed wrong.
- **Close the loop.** If the org uses Agent Analytics, review the evaluator signals (task completion, response quality, friction) and iterate. Every agent improves with a round of tuning after it sees real runs.
