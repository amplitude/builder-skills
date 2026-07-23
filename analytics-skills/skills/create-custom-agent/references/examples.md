# Worked Examples

Four filled prompts, one per Agent Library category. Use them to model tone and specificity during the intake. Each maps the nine intake fields into the Step 2 template. Values in brackets are placeholders a real user replaces.

## 1. Funnel and activation

```
Create a custom agent for me with these details:

- Project: current project
- What to monitor: the signup-to-activation funnel
- Primary signal: Account Activated
- Guardrail signals: Signup Started, Signup Completed
- Segments/filters: exclude internal users; new users only
- What to flag: any step whose conversion drops more than 10% week over week
- Cadence: every Monday at 9am in the team's time zone
- Destination: Slack, the growth team channel
- Output format: funnel conversion by step, then the largest drop called out with a one-line hypothesis
```

## 2. Voice of customer

```
Create a custom agent for me with these details:

- Project: current project
- What to monitor: themes in incoming customer feedback
- Primary signal: Feedback Submitted
- Guardrail signals: feedback volume by source
- Segments/filters: paid plans only
- What to flag: any theme growing more than 25% week over week, and any new theme not seen before
- Cadence: weekly, Friday morning
- Destination: Notion, the product research page
- Output format: ranked themes with a representative quote and a count for each
```

## 3. Launch and experiment readout

```
Create a custom agent for me with these details:

- Project: current project
- What to monitor: the currently running pricing experiment
- Primary signal: Subscription Purchased
- Guardrail signals: Checkout Started, refund events
- Segments/filters: exclude internal users; target market only
- What to flag: when a variant reaches statistical significance, or when a guardrail metric moves against the winning variant
- Cadence: daily at 10am
- Destination: Slack, the experimentation channel
- Output format: variant comparison table, significance status, and a recommended decision
```

## 4. Account and churn intelligence

```
Create a custom agent for me with these details:

- Project: current project
- What to monitor: engagement decline in strategic accounts
- Primary signal: Weekly Active Users per account
- Guardrail signals: key-feature usage events, support ticket volume
- Segments/filters: named strategic accounts only
- What to flag: any account whose weekly active users fall more than 20% over two consecutive weeks
- Cadence: weekly, Monday
- Destination: the account owner by email, plus a Jira ticket for accounts that cross the threshold
- Output format: at-risk accounts ranked by drop size, each with the metric that fell and the week it started
```

## Turning a filled prompt into a link

Take the filled block, URL-encode it, and drop it into the route from the SKILL. Example, abbreviated:

```
https://app.amplitude.com/?aiQuery=Create%20a%20custom%20agent%20for%20me%20with%20these%20details%3A%0A%0A-%20Project%3A%20current%20project%0A...
```

Present it as a named markdown link, never as the raw encoded string.
