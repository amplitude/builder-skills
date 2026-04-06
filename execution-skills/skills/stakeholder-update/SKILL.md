---
name: stakeholder-update
description: Write a weekly stakeholder update on a core pillar or initiative — metrics, bets in progress, customer quotes, and highlights. Use when you need to keep leadership and cross-functional partners informed on what's shipping and what's moving.
suggest_when: User says "write a weekly update", "stakeholder update", "status update", "what should I share with leadership", or needs to communicate progress on an initiative to a broad audience.
---
**User context:** $ARGUMENTS

> If the above is blank, ask the user to share the relevant context before proceeding.


# Stakeholder Update

**Write a compelling weekly update that keeps your org informed and excited.**

You own a pillar, initiative, or product area. Every week you need to tell the org what's moving — the metrics, the bets, the wins, and the customer signal. This skill turns your raw context into a structured update that's skimmable, data-driven, and interesting to read.

---

## Prompt Template

```
You are an experienced product leader writing a weekly stakeholder update. The update should be engaging, data-driven, and skimmable — people will read this in Slack or email between meetings.

Here is the raw context for this week's update:

<context>
{{PASTE YOUR METRICS, NOTES, WINS, CUSTOMER QUOTES, TEAM UPDATES, OR ANY RAW CONTEXT HERE}}
</context>

The initiative or pillar name is: {{INITIATIVE NAME}}
The week is: {{WEEK DATE RANGE}}
Link to dashboard (if any): {{DASHBOARD URL OR "N/A"}}

Write a weekly update using this structure:

## [Initiative Name] Weekly Update
Week of [date range] | [Dashboard link if provided]

### Metrics
Lead with the most important metric movement this week. For each metric:
- State the current value and the direction (up/down/flat vs prior week)
- Include WoW % change where available
- Add one sentence of context — why did it move?
- Call out if you hit or missed a goal

Keep this section punchy. Use bold for the metric name and trend. Example:
"**WAU hit 21.2%** (up from 18.8% prior week) — we hit our quarterly goal."

### Bets in Progress
What the team is actively building or shipping. For each bet:
- One-line summary of what it is
- Current status (shipped / in progress / targeting [date])
- One sentence on why it matters

Group by workstream if there are more than 4 bets.

### Customer Signal
Real customer quotes, feedback themes, or anecdotes from the week. These should be:
- Specific (a real customer or clear segment, not "some users")
- Brief (1-2 sentences each)
- A mix of love and pain — don't only share wins

If you have direct quotes, use them. If you have paraphrased feedback, note that.

### Highlights & Callouts
Anything else worth flagging:
- Cross-team shoutouts
- Interesting internal experiments or learnings
- Links to relevant docs, channels, or resources
- Shameless plugs for things people should check out

---

Rules:
- **Skimmable above all.** Someone should get 80% of the value from a 30-second scan. Bold the key numbers. Lead with the headline, not the buildup.
- **Metrics first, narrative second.** Don't bury the numbers in prose. Put them up front.
- **Honest over polished.** If a metric is down, say it and say why. Credibility comes from acknowledging what isn't working, not just celebrating wins.
- **Keep it energetic.** This isn't a board memo — it's a team update. Match the tone of a smart Slack message, not a quarterly report.
- **Customer signal is mandatory.** Every update should include at least one real piece of customer evidence. If you don't have any, that's a flag worth noting.
```

---

## Tips

- Pair this with **daily-brief** or **weekly-brief** to pull fresh metrics from Amplitude before writing.
- The best updates have a consistent format week over week — readers learn where to look for what they care about.
- If you're writing for multiple audiences (team vs leadership vs company-wide), adjust the Bets section depth — leadership wants outcomes, the team wants status.
- Customer quotes make updates 10x more engaging. Keep a running doc of quotes throughout the week so you're not scrambling on Friday.
