# amplitude-builder-skills — Agent Guide

This repo contains AI skills for product managers and builders at Amplitude. Read this file first to understand how the skills work together and when to suggest them.

## Principles

1. **Specificity over vagueness.** "Everyone in healthcare" is not a customer. "Sarah, the ops manager running a 50-person team at a mid-market health tech company" is. Push for specifics in every skill.
2. **Behavior beats interest.** Waitlist signups and "that's interesting" aren't demand. Payment, panic when it breaks, and workflow dependency are. Challenge stated interest with behavioral evidence.
3. **Completeness over shortcuts.** When AI makes the marginal cost of thoroughness near-zero, always choose the complete version — full acceptance criteria, all edge cases, every open question surfaced.
4. **Challenge premises before solutions.** The best PM work questions whether the problem is worth solving before designing the solution. Skills should push back on weak thinking, not just format it nicely.

## Skill Lifecycle

Skills chain together in a natural product development flow. When a user finishes one step, suggest the next.

```
yc-office-hours            → stress-test the idea before committing
  ↓
craft-discovery-synthesis → synthesize raw research into themes
  ↓
jobs-to-be-done         → understand WHY customers need this
  ↓
discover-opportunities  → find opportunities in Amplitude data
  ↓
craft-spec              → write the PRD
  ↓
create-user-stories     → break the spec into sprint-ready stories
  ↓
pre-mortem              → identify risks before launch
  ↓
craft-experiment-design → design the A/B test
  ↓
craft-experiment-readout → read out results and recommend ship/kill/iterate
```

Not every project needs every step. Skip steps when the user already has that output.

## When to Suggest Skills

Proactively suggest a skill when the user's intent matches — don't wait for them to ask by name.

**Product-skills triggers:**
- User describes a new idea, says "is this worth building", "brainstorm", "stress-test this" → **yc-office-hours**
- User has raw interview notes, survey responses, feedback → **craft-discovery-synthesis**
- User asks about customer motivation, "why do they churn", "what do they really want" → **jobs-to-be-done**
- User asks about competitive advantage, moats, defensibility → **7-powers**
- User has rough notes and needs a spec, says "write a PRD", "spec this out" → **craft-spec** (or **write-prd** command for guided flow)
- User has a spec and needs stories, says "break this down", "hand off to eng" → **create-user-stories**
- User is about to launch, says "what could go wrong", "risk assessment" → **pre-mortem**
- User wants to test something, says "A/B test", "experiment", "should we test this" → **craft-experiment-design**
- User has experiment results, says "analyze this test", "did it win" → **craft-experiment-readout**
- User says "what should we build", "find opportunities", "where are we losing users" → **discover-opportunities**
- User asks product strategy questions, mentions Lenny Rachitsky → **what-would-lenny-do** (only if lennysdata MCP is connected)

**Analytics-skills triggers:**
- User asks "why did this metric move", "explain this chart" → **analyze-chart**
- User asks to review a dashboard, prep for a meeting → **analyze-dashboard**
- User asks about an experiment, A/B test status → **analyze-experiment**
- User asks about feedback, NPS, customer complaints → **analyze-feedback**
- User asks about account health, churn risk, renewal → **analyze-account-health**
- User says "create a chart", "show me" a metric → **create-chart**
- User says "build a dashboard" → **create-dashboard**
- User asks to check experiments, "what's running" → **monitor-experiments**

**Execution-skills triggers:**
- User says "morning update", "what happened today" → **daily-brief**
- User says "weekly update", "what happened this week" → **weekly-brief**

**Command triggers:**
- User wants a full daily check-in → **daily-standup** (chains brief + experiments + feedback)
- User wants a weekly review → **weekly-review** (chains brief + opportunities + readouts)
- User wants guided PRD creation → **write-prd** (conversational context gathering → spec)
- User wants to run discovery → **run-discovery** (research → assumptions → experiments)

## Plugin Structure

Each folder is an independently installable plugin:

- **product-skills/** — Core PM workflow: discovery, specs, experiments, readouts
- **analytics-skills/** — Amplitude-powered analysis (requires Amplitude MCP server)
- **execution-skills/** — Daily and weekly briefings
- **design-skills/** — Coming soon
- **engineering-skills/** — Coming soon
- **growth-skills/** — Coming soon

Skills live in `<plugin>/skills/<skill-name>/SKILL.md`. Commands live in `<plugin>/commands/<command-name>.md`. Skills are single-task templates; commands chain multiple skills into guided workflows.
