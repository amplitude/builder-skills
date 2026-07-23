---
name: create-custom-agent
description: Guide an Amplitude user through building a custom agent by suggesting use cases grounded in their role and data, shaping the idea into a well-formed spec, and generating a ready-to-run Global Agent deeplink that creates it. Use to create, build, or set up a custom agent, automate a recurring analysis, or put a repeated report on a schedule.
suggest_when: User says "create a custom agent", "build an agent", "automate this analysis", "put this report on a schedule", or describes a recurring workflow they run by hand and want to hand off to an agent.
---

# Create a Custom Agent

Help someone build a custom agent in Amplitude. The job of this skill is to make that easy and specific: suggest strong ideas grounded in what you know about the person and their data, shape the chosen idea into a well-formed agent, then hand back a clickable Global Agent link that builds it (plus the same prompt as plain text).

The skill does not create the agent directly. There is no API for that. It produces a fully specified prompt and a deeplink; the person opens the link, reviews the draft in Global Agent, and Global Agent configures the agent.

Read `references/use-cases.md` and `references/best-practices.md` before suggesting, `references/prompting-instructions.md` for how to word the agent's instructions, and `references/examples.md` for worked prompts to model.

## How to behave (read this first)

- **Lead with suggestions, not a blank prompt.** The person invoked this skill because they want a custom agent. Open by proposing two or three concrete, specific ideas that fit them, then invite them to pick or adjust. Never open with a bare "what do you want it to do?"
- **Never present a multiple-choice menu.** Do not use a menu, numbered picker, or AskUserQuestion-style options list to gate the conversation. Talk inline, the way a colleague would, with real suggestions in prose.
- **Help, don't gatekeep.** Your default is to help them build. If the workflow they describe is exactly a built-in Specialized Agent, mention that as a helpful aside and keep going; do not refuse or dead-end them. A custom agent can still do a scoped, scheduled, or delivered variant of a built-in job.

## Step 1 - Open with grounded suggestions

Propose ideas grounded in whatever context you have, in this order of preference:

1. **What you already know about the person.** Their role, team, product area, and anything from the conversation or connected context. A PM, an engineer, a growth marketer, and a learning designer want different agents. Match the suggestion to them.
2. **Their Amplitude data, if you can reach it.** See Step 2. Pulling their real projects and top events lets you suggest an agent around events they actually collect, which lands far better than a generic idea.
3. **The use-case catalog.** `references/use-cases.md` lists strong agents by role and by Agent Library category. Use it to fill gaps, and shape every idea against the "what makes each of these good" checklist there.

Offer two or three specific ideas, each phrased as a real agent (a signal, a threshold, a cadence, a destination), not a vague theme. Then ask which is closest or what they'd change. If you genuinely have no context, either ask one open question about the workflow they repeat by hand, or offer the brainstorm link in Step 3 rather than guessing.

## Step 2 - Ground in their data (optional, when Amplitude MCP is available)

If Amplitude MCP tools are connected in this environment, use them to ground suggestions in real data. Keep it light: enough to name real events, not a full analysis.

- Call the context tool to list the person's projects, then the events tool to see their top or most recent events. Do not guess event names; read them.
- Suggest agents built on events they actually collect, and use the exact event names in the generated prompt later.
- If the MCP tools are not available, skip this step and rely on role context plus the use-case catalog, or offer the brainstorm link below. Never block on MCP.

## Step 3 - Offer a Global Agent brainstorm link (portable fallback)

When you can't reach their data directly, Global Agent can, because it runs inside their Amplitude org. Offer a deeplink that asks Global Agent to suggest custom agent use cases from their own data:

```
https://app.amplitude.com/?aiQuery=<URL-encoded brainstorm prompt>
```

A good brainstorm prompt: "Look at my most active events and dashboards and suggest three custom agents I could build to automate recurring analysis. For each, name the signal to watch, a guardrail signal, a flag threshold, a cadence, and where to deliver results." Encode it the same way as Step 5.

## Step 4 - Shape the chosen idea (the intake)

Once they pick a direction, fill in these nine fields, asking only for what you don't already have. Set expectations first. Tell them they don't need to answer everything precisely: they can give what they know and you'll fill the gaps with sensible defaults, flagging anything you're guessing at. And building an agent is iterative, so nothing here is final; they can adjust any of it in Amplitude whenever they want. Coach toward specifics: a vague input produces a vague agent, and the biggest driver of output quality is how concrete the instructions are.

| Field | What to capture | Coaching |
|---|---|---|
| **Project** | The `app_id`, or "current project" | The agent can only use data the person can already access. |
| **What to monitor** | The one workflow or metric this agent owns | One agent, one job. If they list three things, make three agents. |
| **Primary signal** | The exact event or metric name as it appears in the project | The real event name works; internal jargon and code names mislead the agent, since the data won't recognize "self-serve" when it's stored as "Starter Plan". The event should exist in the project before the agent relies on it. |
| **Guardrail signals** | Context events that keep the primary signal honest | e.g. pair completions with enrollments so a drop isn't misread. |
| **Segments / filters** | Who to include or exclude | The agent analyzes all users unless told otherwise, so always name the segment. Almost always exclude internal traffic. |
| **What to flag** | The condition worth surfacing | Give a threshold, not "anything interesting" - e.g. "week-over-week drop over 15%", "any zero-event day". |
| **Cadence** | How often it runs, plus day, hour, time zone | Match the rhythm of the decision it feeds. Daily or weekly. |
| **Destination** | Where results land | Amplitude runs page, Slack channel, email, Jira, Linear, or Notion. See the Slack note in Step 7. |
| **Output format** | The shape of the deliverable | e.g. "headline numbers then bullet takeaways", "table of top 5 movers". |

If they want the agent to pull a specific chart, dashboard, or cohort into its context, tell them to `@mention` that asset inside the instructions when they review the draft in Global Agent. For the wording of each field, `references/prompting-instructions.md` covers the gotchas that quietly produce wrong output.

## Step 5 - Assemble the prompt

Fill this template with the intake answers, keeping the field labels and replacing the bracketed parts.

```
Create a custom agent for me with these details:

- Project: app_id [APP_ID] (or "current project")
- What to monitor: [WORKFLOW OR METRIC]
- Primary signal: [EXACT EVENT OR METRIC NAME]
- Guardrail signals: [CONTEXT EVENTS]
- Segments/filters: [INCLUDE / EXCLUDE RULES]
- What to flag: [THRESHOLD OR CONDITION]
- Cadence: [FREQUENCY, DAY, HOUR, TIME ZONE]
- Destination: [WHERE RESULTS LAND]
- Output format: [SHAPE OF THE DELIVERABLE]
```

For any field they didn't answer, fill a sensible default and flag it in your message to them, so they know what to double-check, rather than leaving the agent underspecified. Only omit a line when a default would be meaningless. Restate that they can change any of this in Amplitude after the agent is built.

## Step 6 - Build the deeplink

Turn the filled prompt into a Global Agent link so opening it loads the prompt ready to run.

Route (the app root resolves the user's org on its own, so no org slug is needed; a logged-in user lands in Global Agent with the prompt already loaded in the composer):

```
https://app.amplitude.com/?aiQuery=<URL-encoded prompt>
```

URL-encode the whole filled prompt. Encode spaces as `%20`, newlines as `%0A`, quotes as `%22`, parentheses as `%28` and `%29`, `#` as `%23`, `/` as `%2F`, and `:` as `%3A`.

## Step 7 - Deliver

Return three things:

1. **The clickable link**, as a named markdown link whose text is a short plain-English description (for example, `[Build this agent in Amplitude](https://app.amplitude.com/?aiQuery=...)`). Never paste the raw encoded URL as the visible text.
2. **The plain-text prompt** from Step 5, so they can paste it into Global Agent or the `/create-custom-agent` command by hand.
3. **A one-line "what happens next"**: they open the link, review the draft agent Global Agent proposes, then publish it. Add these reminders only when they apply:
   - If the destination is Slack, invite the `Amplitude` Slackbot to the target channel first, or delivery silently fails.
   - Any action that affects end users (launching an experiment, creating a cohort) needs human approval before it runs.
   - The agent is private until they publish and share it.

## Specialized Agents (mention, don't gatekeep)

Amplitude ships four built-in Specialized Agents: Dashboard Agent (monitors a dashboard for meaningful changes), Session Replay Agent (friction patterns across replays), Website Conversion Agent (signup/checkout flows), and Customer Feedback Agent (themes qualitative feedback). If someone's idea matches one of these exactly, note it as a faster option they already have, then offer to build a custom variant if they want something scoped, scheduled, or delivered differently. This is an aside, never a reason to stop helping.
