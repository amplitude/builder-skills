# Common Custom Agent Use Cases

Seed suggestions with these when you don't yet know the person's workflow, and sharpen them once you do. Grounded in Amplitude's Agent Library categories and the documented use cases. Lead with the two or three most relevant to what you know about the person (role, product area, connected data) rather than listing everything.

## By Agent Library category

- **Funnel and activation** (the largest category): signup-to-activation drop monitor, checkout drop-off investigator, onboarding completion watcher, feature adoption tracker, campaign-to-activation report.
- **Voice of customer and feedback**: customer feedback weekly report, theme-and-sentiment tracker, support-ticket clustering into ranked tickets.
- **Launch and experiment readouts**: release impact monitor, experiment significance watcher that drafts a decision doc, weekly experiment performance readout.
- **Account and churn intelligence**: strategic-account engagement-drop alert, newly dormant user win-back, retention monitor.

## By role

- **Product manager**: cluster customer feedback into themes and file ranked Jira or Linear tickets; detect experiments reaching significance and draft a decision doc; run a roadmap reality check against actual usage.
- **Engineering**: post-deploy release health check comparing funnel, error rate, and adoption against baseline, filing a regression ticket to the author; find feature flags stuck at full rollout and file cleanup tickets to the owning team.
- **Customer success and marketing**: flag strategic accounts with slipping engagement and alert the owner with the drop-off point; detect newly dormant users, build the cohort, and draft a win-back campaign for approval.
- **Data and analytics**: weekly metric-movement digest; anomaly flag on a core metric with a first-pass hypothesis attached.
- **Learning and education (Academy-style data)**: course drop-off monitor by module; new-content adoption tracker for a freshly launched course; knowledge-check pass-rate watcher; stalled-learner flag for outreach.

## What makes each of these good

Shape every suggestion against these, so what you propose is already close to a well-formed agent:

- One workflow, one agent.
- A named primary signal plus a guardrail signal.
- A concrete flag threshold, not "anything interesting."
- A segment and a timeframe.
- A destination and an output shape.

See `best-practices.md` and `prompting-instructions.md` for the full reasoning.
