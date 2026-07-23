# Writing the Agent's Instructions

The instructions field is a standing prompt the agent re-runs on every scheduled run. The habits that make a one-off Global Agent question accurate are the same ones that make an agent's instructions accurate, and the mistakes below are the ones that quietly produce wrong output run after run. Coach the person toward these while filling the "What to monitor", "Primary signal", and "Segments/filters" fields.

## Name things the way Amplitude does, not the way the team talks

The agent behaves like a capable new hire who knows analytics but not the company's internal shorthand. Acronyms, code names, and phrases like "self-serve customers" mean nothing to it unless the data itself uses those terms. An instruction that says "watch self-serve churn" leaves the agent guessing; "watch churn for Starter Plan accounts" does not. Spell out the official event, metric, and segment names as they appear in the project.

## Always state the segment and the timeframe

Left unspecified, the agent analyzes all users. A number pulled from all users reads as wrong to anyone who lives in one segment: an Americas manager expecting an average order size of 24 sees 13 and stops trusting the agent. Every instruction should name the population it covers (region, plan, platform, cohort) and the window it measures.

## Break a multi-step goal into ordered steps

A single leap from question to answer compounds errors at each hidden stage. When the workflow has several analytical moves, such as defining the metric, finding the affected segment, and comparing periods, the instruction should lay them out in the order a person would follow them. For a run that recommends a high-stakes action, the instruction can add a checkpoint that asks for review before the agent proceeds.

## Move up the specificity ladder

The same goal can be stated vaguely or precisely. Precise wins every time. Use this ladder as a model when phrasing what the agent watches for:

| Vague | Better | Best |
|---|---|---|
| Monitor onboarding | Monitor onboarding completion | Flag any week where mobile onboarding completion falls more than 10% against the prior week |
| Watch for churn | Watch new-user churn | Flag new users from the last 30 days who churn within their first week, ranked by acquisition channel |
| Track the experiment | Track the pricing experiment | Report the pricing experiment daily and flag when a variant reaches significance or a guardrail metric moves against it |

## Remember the agent is only as good as the data it can reach

An agent synthesizes whatever the account holds: analytics, session replay, experiments, guides, and surveys. Sparse tracking or a thin taxonomy leaves it little to work with. An instruction that depends on an event the org does not collect will fail no matter how well it reads, so confirm the signal exists in the project before building the agent around it.

## Sources

Grounded in Amplitude's own guidance: "Three Tips for Better Prompts in Amplitude Global Agent" (jargon, human-in-the-loop, segmentation), "Understand How AI Thinks Like an Analyst" (the specificity ladder), and the "Move faster with Amplitude Agents" Academy course (agents draw on the data already in the account).
