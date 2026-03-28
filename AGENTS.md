# amplitude-builder-skills — Agent Guide

The best agent skills for product managers, analysts, engineers, marketers, and other AI-enabled "builders" as built or curated by the Amplitude team. Use this as your agent operating system when supercharging your workflows in Claude Code, Claude Cowork, Cursor, OpenAI Codex, and other agent harnesses.

## Principles

1. **Specificity over vagueness.** "Everyone in healthcare" is not a customer. "Sarah, the ops manager running a 50-person team at a mid-market health tech company" is. Push for specifics in every skill.
2. **Behavior beats interest.** Waitlist signups and "that's interesting" aren't demand. Payment, panic when it breaks, and workflow dependency are. Challenge stated interest with behavioral evidence.
3. **Completeness over shortcuts.** When AI makes the marginal cost of thoroughness near-zero, always choose the complete version — full acceptance criteria, all edge cases, every open question surfaced.
4. **Challenge premises before solutions.** The best PM work questions whether the problem is worth solving before designing the solution. Skills should push back on weak thinking, not just format it nicely.

## When to Suggest Skills

Proactively suggest a skill when the user's intent matches — don't wait for them to ask by name.

**Product-skills triggers:**
- User has raw interview notes, survey responses, feedback → **craft-discovery-synthesis**
- User asks about customer motivation, "why do they churn", "what do they really want" → **jobs-to-be-done**
- User asks about competitive advantage, moats, defensibility → **7-powers**
- User has rough notes and needs a spec, says "write a PRD", "spec this out" → **draft-spec** for detailed specs with strategic framing, **craft-spec** for lighter structured PRDs (or **write-prd** command for guided flow)
- User has a spec and needs stories, says "break this down", "hand off to eng" → **create-user-stories**
- User is about to launch, says "what could go wrong", "risk assessment" → **pre-mortem**
- User wants to test something, says "A/B test", "experiment", "should we test this" → **craft-experiment-design**
- User has experiment results, says "analyze this test", "did it win" → **craft-experiment-readout**
- User says "what should we build", "find opportunities", "where are we losing users" → **discover-opportunities**
- User has a list of things and needs to decide, says "prioritize", "rank these", "what should we do first" → **prioritize**
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
- User shares a meeting transcript or notes, says "summarize this meeting", "action items" → **meeting-synthesis**
- User says "write a weekly update", "stakeholder update", "status update for leadership" → **stakeholder-update**
- User shares a draft or idea and wants feedback, says "what do you think", "make this better", "build on this" → **yes-and**

**Growth-skills triggers:**
- User wants to break down a metric, build a KPI tree, find growth levers → **build-metric-tree**
- User asks about activation, onboarding drop-off, aha moment, time-to-value, "why aren't new users sticking" → **diagnose-activation**
- User asks about retention, churn, cohort analysis, habit loops, "why are users leaving", D7/D30 retention → **diagnose-retention**
- User asks about monetization, pricing, conversion to paid, expansion revenue, ARPU, LTV, packaging → **diagnose-monetization**
- User asks about acquisition, "where do our users come from", CAC, channel mix, organic vs paid, top of funnel, signup volume, traffic sources → **diagnose-acquisition**
- User asks about growth loops, flywheel, viral loop, network effects, compounding growth, "how do we grow without just spending more" → **map-growth-loops**

**Launch-skills triggers:**
- User says "we're launching X", "plan the launch", "what's our launch plan", "how should we announce this" → **launch-strategy**
- User asks to write a launch tweet, announcement thread, social copy, "write the tweet for this" → **launch-tweet**
- User asks to write a launch email, announcement email, changelog digest, "email our users" → **launch-email**
- User asks to write a launch blog post, announcement post, technical write-up, "draft the blog post" → **launch-blog-post**
- User asks to create a demo video, product GIF, visual assets, "make a video for this launch" → **launch-video**
- User asks to create a landing page, feature page, waitlist page, "I need a landing page" → **launch-landing-page**
- User asks where to post, how to distribute, "how do we get the word out", "help with Product Hunt" → **launch-distribution**
- User asks to track a launch, set up UTMs, measure performance, "how do we know if it worked" → **launch-metrics**

**Command triggers:**
- User says "morning update", "what happened today" → **daily-brief** (multi-phase Amplitude briefing)
- User says "weekly update", "what happened this week" → **weekly-brief** (multi-phase Amplitude summary)
- User describes a new idea, says "is this worth building", "stress-test this" → **yc-office-hours** (interactive stress-test with branching modes)
- User wants a full daily check-in → **daily-standup** (chains brief + experiments + feedback)
- User wants a weekly review → **weekly-review** (chains brief + opportunities + readouts)
- User wants guided PRD creation → **write-prd** (conversational context gathering → spec)
- User wants to run discovery → **run-discovery** (research → assumptions → experiments)

## Plugin Structure

Each folder is an independently installable plugin:

- **product-skills/** — Core PM workflow: discovery, specs, experiments, readouts
- **analytics-skills/** — Amplitude-powered analysis (requires Amplitude MCP server)
- **execution-skills/** — Briefings, meeting processing, stakeholder comms, idea stress-testing (requires Amplitude MCP for briefs)
- **design-skills/** — Coming soon
- **engineering-skills/** — Coming soon
- **launch-skills/** — Launch planning, messaging, social copy, email, blog posts, video/visuals, landing pages, distribution, and metrics
- **growth-skills/** — Activation, retention, monetization, acquisition diagnosis, metric trees, growth loop mapping

Skills live in `<plugin>/skills/<skill-name>/SKILL.md`. Commands live in `<plugin>/commands/<command-name>.md`. Skills are single-task templates; commands chain multiple skills into guided workflows.
