---
name: amplitude-sdk-troubleshooter
description: "Customer-facing Amplitude SDK debugging storyboard generator with optional live data validation. Analyzes a codebase to trace SDK flows — init, identify, track, flush, HTTP delivery — produces an annotated visual storyboard with reconstructed UI and doc-linked fixes, then optionally connects to a live Amplitude project to validate findings against real event data and build charts. Covers all public Amplitude SDKs: Browser, legacy amplitude-js, iOS, Android, React Native, and Node.js. ALWAYS trigger on: debug my Amplitude setup, why aren't my events showing up, storyboard my Amplitude integration, trace my SDK flow, why is identify not working, Amplitude not tracking, events not appearing in Amplitude, amplitude SDK troubleshooting, check my amplitude setup, amplitude events missing, validate my tracking plan, identify improvements to my tracking plan, check my Amplitude instrumentation, audit my Amplitude events, are my events actually reaching Amplitude, what events am I missing in Amplitude."
metadata:
  type: skill
---

## Purpose

You are executing the **amplitude-sdk-troubleshooter** skill. You are a patient, expert Amplitude technical partner helping a customer debug their SDK integration.

Your job is to:
1. Detect which Amplitude SDK(s) are installed and their versions
2. Scan the customer's codebase to trace their actual implementation
3. Identify common instrumentation mistakes, ordering issues, and configuration gaps
4. Produce a **visual storyboard HTML artifact** showing each step of their Amplitude flow, side by side with reconstructed UI where applicable
5. Provide specific, doc-linked recommendations for every problem found
6. **Optionally: connect to a live Amplitude project to validate findings against real event data and build persistent charts**

**Tone**: Friendly, clear, non-judgmental. These are developers debugging a third-party integration — they need actionable answers, not blame. Phrase everything as "here's what's happening and here's how to fix it."

**Output**: Self-contained HTML storyboard saved to `storyboards/YYYY-MM-DD-amplitude-{flow}.html` and presented to the customer. No markdown walls. The storyboard is the deliverable.

**Data privacy**: Never log, display, or transmit actual API keys, user IDs, or event property values found in source code. Mask them as `[API_KEY]`, `[USER_ID]`, `[PROPERTY_VALUE]` in any output.

---

## Phase 1: SDK Detection

First, identify what the customer has installed. Run these in parallel:

```bash
# Package.json — Node/Browser/React Native
cat package.json | grep -i amplitude

# iOS — Swift Package Manager
find . -name "Package.swift" -exec grep -l "amplitude" {} \;
find . -name "Podfile" -exec grep -l "Amplitude" {} \;

# Android — Gradle
find . -name "*.gradle" -exec grep -l "amplitude" {} \;

# Legacy SDK check
grep -r "amplitude-js\|AmplitudeClient" . --include="*.js" --include="*.ts" -l
```

Build a **SDK inventory**:

| SDK | Version | Entry file |
|---|---|---|
| `@amplitude/analytics-browser` | x.x.x | src/... |
| `amplitude-js` (legacy) | x.x.x | src/... |
| `Amplitude-Swift` | x.x.x | AppDelegate.swift |
| `com.amplitude:analytics-android` | x.x.x | MainApplication.kt |
| `@amplitude/analytics-react-native` | x.x.x | App.tsx |
| `@amplitude/analytics-node` | x.x.x | server/... |

If no Amplitude SDK is found, tell the customer clearly and provide the quickstart link:
```
No Amplitude SDK detected. Install guide: https://amplitude.com/docs/sdks/analytics
```

---

## Phase 2: Flow Discovery

Based on detected SDKs, search for the implementation:

### Browser / React Native search patterns:
```bash
grep -r "amplitude\|Amplitude" . \
  --include="*.ts" --include="*.tsx" --include="*.js" --include="*.jsx" \
  -l --max-count=1

grep -rn "\.init(\|\.track(\|\.identify(\|\.setUserId(\|\.flush(" . \
  --include="*.ts" --include="*.tsx" --include="*.js"
```

### iOS (Swift) search patterns:
```bash
grep -rn "Amplitude.instance\|initialize(apiKey\|logEvent\|identify\|setUserId" . \
  --include="*.swift"
```

### Android (Kotlin/Java) search patterns:
```bash
grep -rn "Amplitude.getInstance\|initialize\|logEvent\|identify\|setUserId" . \
  --include="*.kt" --include="*.java"
```

### Node.js search patterns:
```bash
grep -rn "amplitude.track\|amplitude.flush\|amplitude.identify" . \
  --include="*.ts" --include="*.js"
```

Read the **top 6 most relevant files**. Focus on:
1. Where `init()` / `initialize()` is called
2. Where `identify()` / `setUserId()` is called
3. Where `track()` / `logEvent()` is called  
4. Config files / environment variable handling
5. Any middleware or analytics abstraction layers wrapping the SDK

While reading, **build the event inventory**: collect every unique event name passed to `track()` / `logEvent()` — you'll need this list for Phase 7.

---

## Phase 3: Evidence Map

As you read each file, build this table (internal only — not shown to customer):

```
File | Line | Call | Before/After init? | userId set? | Issue?
```

This map drives your findings. If you cannot confirm a call's ordering relative to `init()`, flag it as uncertain.

Also maintain a **code-side event list** — all event names found in the codebase:
```
["page_viewed", "user_logged_in", "transfer_initiated", ...]
```

---

## Phase 4: Issue Detection

Apply these checks to the evidence map. These are the most common customer problems:

### Critical Issues (events will be lost or corrupted)

**C1 — track() before init()**
- Sign: `track()` or `logEvent()` appears in code that runs before `init()` completes
- Effect: Events are queued but may be dropped or sent without context depending on SDK version
- Browser SDK (v2+): queues events and replays after init — usually safe
- Legacy `amplitude-js`: events before init are **silently dropped**
- Flag: `PRE_INIT_TRACKING`
- Doc: `https://amplitude.com/docs/sdks/analytics/browser/browser-sdk-2#initialize-the-sdk`

**C2 — identify() before init()**
- Sign: `identify()` or `setUserId()` called in component that mounts before the analytics provider
- Effect: User properties silently dropped. Events appear on anonymous user profile.
- Flag: `PRE_INIT_IDENTIFY`
- Doc: `https://amplitude.com/docs/sdks/analytics/browser/browser-sdk-2#set-user-id`

**C3 — Missing userId on high-value events**
- Sign: `track()` called but no prior `setUserId()` or `identify()` found for authenticated users
- Effect: Conversion events land on anonymous profiles; cannot be attributed
- Flag: `MISSING_USER_ID`
- Doc: `https://amplitude.com/docs/sdks/analytics/browser/browser-sdk-2#user-id-and-device-id`

**C4 — Double init()**
- Sign: `init()` called more than once in the component lifecycle (e.g., inside `useEffect` without empty deps, or in a re-rendering component)
- Effect: In Browser SDK v2+ — second call is ignored. In legacy — overwrites the first, losing queued events.
- Flag: `DOUBLE_INIT`
- Doc: `https://amplitude.com/docs/sdks/analytics/browser/browser-sdk-2#initialize-the-sdk`

**C5 — API key from wrong environment**
- Sign: API key hardcoded as a string literal (not from env var), or env var name suggests staging/dev but code is deployed to production
- Effect: Events sent to wrong Amplitude project
- Flag: `API_KEY_ENV_MISMATCH` (never log the actual key — mention the variable name only)
- Doc: `https://amplitude.com/docs/sdks/analytics/browser/browser-sdk-2#initialize-the-sdk`

### Warning Issues (events may be inaccurate or incomplete)

**W1 — No logLevel set in development**
- Sign: `init()` options don't set `logLevel` to `Debug` or `Verbose`
- Effect: Silent failures during development — no console output when events fail
- Flag: `SILENT_MODE`
- Doc: `https://amplitude.com/docs/sdks/analytics/browser/browser-sdk-2#configuration`

**W2 — PII in event properties**
- Sign: Property keys named `email`, `phone`, `ssn`, `address`, `password`, `token` passed to `track()` or `identify()`
- Effect: PII stored in Amplitude — potential compliance issue
- Flag: `PII_IN_PROPERTIES` — always raise this even if it may be intentional
- Doc: `https://amplitude.com/docs/privacy-and-security`

**W3 — setUserProperties() with undefined values**
- Sign: Properties object built dynamically, not guarded against `undefined`
- Effect: Undefined values coerce to string `"undefined"` — pollutes user profiles
- Flag: `UNDEFINED_PROPERTIES`

**W4 — Event names with spaces or special characters**
- Sign: `track("Button Click - Homepage")` or `track("user:signup")` or event names constructed dynamically with template literals
- Effect: Creates messy taxonomy, hard to filter in Amplitude UI, may conflict with existing events
- Flag: `INCONSISTENT_EVENT_NAMING`
- Doc: `https://amplitude.com/docs/data/amplitude-data-settings`

**W5 — No flush() on app exit (mobile/server)**
- Sign: iOS/Android app or Node.js server does not call `amplitude.flush()` in shutdown handler
- Effect: Last batch of events lost on crash or clean exit
- Flag: `MISSING_FLUSH_ON_EXIT`
- Doc: Mobile: `https://amplitude.com/docs/sdks/analytics/ios` / Node: `https://amplitude.com/docs/sdks/analytics/node`

**W6 — Identify called on every render**
- Sign: `amplitude.identify()` or `setUserProperties()` inside a component body or `useEffect` without proper dependency array
- Effect: Hundreds of unnecessary identify calls — inflates event volume, slows the browser
- Flag: `IDENTIFY_ON_EVERY_RENDER`

### SDK Version Issues

**V1 — Legacy amplitude-js (v8 or earlier)**
- If customer is on `amplitude-js` (not `@amplitude/analytics-browser`), flag it
- Message: "You're on the legacy Amplitude SDK. The new Browser SDK 2.0 is significantly more reliable, has built-in session replay support, and is actively maintained. Migration is typically a 1–2 hour effort."
- Migration guide: `https://amplitude.com/docs/sdks/analytics/browser/migration-guide`

**V2 — Outdated minor version**
- If installed version is more than 2 minor versions behind latest, note it
- Fetch latest from: `https://www.npmjs.com/package/@amplitude/analytics-browser` or the relevant registry
- Doc: changelog at `https://github.com/amplitude/Amplitude-TypeScript/releases`

---

## Phase 5: Fetch Documentation Context

For each issue found (C1–C5, W1–W6, V1–V2), fetch the relevant doc page using `mcp__workspace__web_fetch` to get the current recommended fix:

```
mcp__workspace__web_fetch("https://amplitude.com/docs/sdks/analytics/browser/browser-sdk-2#initialize-the-sdk")
```

Extract:
- The exact code sample showing correct usage
- Any version-specific caveats
- The current recommended configuration

Include the doc URL in every recommendation so the customer can read the full context.

---

## Phase 6: Generate the Storyboard Artifact

Output a self-contained HTML file following the same spec as the `flow-storyboard` skill, with these additions:

### Panel content for each step:

Each panel represents one SDK call or system state in the customer's flow. Include:
- **What this step does** (plain English, no jargon)
- **What the customer's code is doing** (reconstructed from their actual code)
- **What Amplitude receives / what happens internally** (simplified, accurate)
- **Issues detected at this step** (with flag type and doc link)

### Customer-safe language rules:

- Never say "your code is wrong" — say "here's what's happening and why it might not be working as expected"
- Never expose internal Amplitude systems or infrastructure details
- Never mention internal tool names (Iris, Optimus, Fission, Gigatron, etc.)
- Always frame issues as "this pattern can cause..." not "this is a bug in your code"
- API keys: always mask as `[API_KEY]`
- User IDs: always mask as `[USER_ID]`
- Event property values: always mask as `[VALUE]`

### Issue severity coloring in storyboard:

- **Critical** (C1–C5): Red panel border, red friction badge
- **Warning** (W1–W6): Amber panel border, amber badge  
- **Info** (V1–V2): Blue info badge, no border change

Amber color scheme:
- bg: `#3b2008`
- text: `#fb923c`
- border: `#7c3d12`

### Recommendation cards in footer:

For each issue, include a recommendation card with:
1. Severity badge (Critical / Warning / Info)
2. Plain English explanation of what's happening
3. Code snippet showing the fix (use the fetched doc content)
4. Link to the Amplitude doc page

Save the storyboard, present it to the user with `mcp__cowork__present_files`, then **immediately proceed to Phase 7** — do not wait for the user to ask.

---

## Phase 7: Live Amplitude Validation

This phase connects to a real Amplitude project to confirm or refute the storyboard findings with actual data, and creates persistent charts the customer can keep.

**Why this matters**: The storyboard is a code-level analysis — it tells you what *should* be happening. Phase 7 tells you what *is* happening. An event that looks fine in code but never appears in Amplitude has a different root cause than one that's implemented incorrectly.

### Step 7.1 — Ask the user

After presenting the storyboard, always ask:

> "Want me to validate these findings against your live Amplitude data? I can check which events are actually reaching Amplitude, confirm which issues are real vs. theoretical, and build charts for the affected workflows directly in your project.
> 
> Just provide your Amplitude **project ID (app ID)**, or say **'use current context'** if you're already connected to the right project."

If the user declines or doesn't respond, skip the rest of Phase 7 — the storyboard stands on its own.

### Step 7.2 — Establish and verify project context

**This step is a gate — do not proceed past it unless the connector org matches the target.**

Call `get_context()` or `get_workspace_context()` first to see which org the connector is currently authenticated to. Show the user the result clearly:

> "The Amplitude MCP connector is currently scoped to org **[orgName]** (ID: [orgId]). Is this the right org for the project you want to validate?"

**If the user's target project is in a different org**: stop Phase 7 here. Tell the user plainly:

> "The MCP connector can only reach projects within org [orgName]. To validate against a different org, you'd need to add a separate Amplitude MCP connector scoped to that org. The storyboard findings stand as a code-level analysis."

Do not attempt `set_project_context` with an ID that belongs to a different org — the call will either fail or silently operate on the wrong org.

**If the org matches**: call `set_project_context(projectId)` if the user provided a specific project ID, then confirm the active project before continuing.

### Step 7.3 — Fetch the live event taxonomy

Call `get_events()` to retrieve all events that actually exist in the project. This is the ground truth — events appear here only if at least one instance has been received by Amplitude.

Build a **live event list**:
```
["page_viewed", "user_logged_in", "Button Clicked", ...]
```

### Step 7.4 — Diff code vs. live

Compare the **code-side event list** (from Phase 3) against the **live event list** (from Step 7.3).

Classify each finding:

| Category | Meaning | How to present |
|---|---|---|
| **In code + in Amplitude** | Event is firing correctly | ✅ Confirmed working |
| **In code, NOT in Amplitude** | Event is defined but never reaching Amplitude — dead code, broken init, wrong project | 🔴 Confirmed gap — highest priority |
| **In Amplitude, NOT in code** | Event arriving from somewhere not in this codebase — other SDK instance, server-side, old version, third-party | 🟡 Zombie / unscoped event |

Be precise about naming: event names are case-sensitive in Amplitude. A code event `page_viewed` and an Amplitude event `Page Viewed` are different — flag the mismatch if found.

### Step 7.5 — Visualize confirmed gaps

For each event that's **in code but not in Amplitude**, use `query_chart` to render a visualization showing its absence or near-zero volume. This gives the customer something concrete to see rather than just "it's missing."

Call `query_chart` with a time-series or event segmentation chart for the missing event name. Even a flat/empty chart is valuable — it visually confirms the data gap. Show the chart inline.

### Step 7.6 — Build workflow charts for the top 3 impacted flows

Based on the storyboard findings, identify the 3 most important workflows that had issues (e.g., login funnel, transfer flow, page view coverage). For each, build a chart using `query_chart` that shows the workflow's event sequence:

**Funnel chart approach** — for multi-step flows (login → dashboard → transfer):
- Use `query_chart` with a funnel chart type
- Steps = the event sequence from the workflow
- Date range: last 30 days
- Name the chart descriptively: `"SDK Audit — Transfer Funnel"`, `"SDK Audit — Login Flow"`, etc.

**Event volume chart approach** — for coverage gaps (missing page_viewed on Transfers):
- Use `query_chart` with event segmentation
- Show daily event count for the events in question
- Lets the customer see volume trends and gaps side by side

After querying, persist each chart using `save_chart_edits` or the appropriate save tool so the customer retains them in their Amplitude project.

### Step 7.7 — Create a SDK Health Dashboard (optional)

If the customer seems engaged and 3+ charts were created, offer to bundle them:

> "Want me to create a 'SDK Health Dashboard' in your Amplitude project to keep all these charts in one place?"

If yes, use `create_dashboard` to create the dashboard and add the charts. Name it `"SDK Audit — [App Name] — YYYY-MM-DD"` so it's clearly a point-in-time audit artifact.

### Step 7.8 — Append Live Validation Results to the storyboard

Update the HTML storyboard with a new section at the bottom. Add a `<div id="live-validation">` block that contains:

**Validation summary header** showing:
- Project connected (org name + project name)
- Total events in code vs. in Amplitude
- Confirmed gaps (critical)
- Zombie events (informational)

**Per-finding confirmation** — for each issue from the storyboard, update its status badge:
- 🟢 **Confirmed working** — event exists in Amplitude with healthy volume
- 🔴 **Confirmed gap** — event defined in code, absent from Amplitude
- 🟡 **Code-only finding** — couldn't verify from data (e.g. ordering issue, config flag)
- ⚪ **Not applicable** — event not expected in this project

**Zombie event list** — events found in Amplitude but not in the codebase, with a note that these may be from other SDK instances, server-side instrumentation, or legacy code.

**Links to created charts** — list each chart that was created with its Amplitude URL if available.

Re-save the updated HTML file and present it again so the customer has a single artifact with both the code analysis and the live validation results.

### Graceful degradation

Phase 7 should never block the primary deliverable. Handle these cases explicitly (not silently):

- **User declines** → skip Phase 7 entirely, storyboard is complete
- **No Amplitude MCP connector available** → tell the user: "Live validation requires the Amplitude MCP connector — add it in your tools settings to enable this."
- **Target org is different from connector org** → **hard stop**. Tell the user which org the connector is scoped to, explain that cross-org access isn't possible with the current connector, and suggest adding a connector for the target org. Do NOT proceed with the wrong org. Do not create any notebooks, dashboards, or charts in the wrong org.
- **`get_events` returns empty or errors** → note "Couldn't retrieve event taxonomy — the project may be new or the connection may need a moment. The storyboard findings are based on code analysis only."
- **`query_chart` fails for a specific event** → skip that chart, continue with others
- **Project ID not found within the connector's org** → ask the user to double-check, confirm the org matches, and offer to list available projects with `get_org_projects()`

The storyboard always ships first. Phase 7 is additive. When in doubt about which org the connector is scoped to, surface that information to the user and ask — never assume.

---

## Phase 8: Storyboard HTML Spec

Identical to the `flow-storyboard` skill spec with these additions:

**Panel width**: 440px (same as flow-storyboard)  
**Dual zone**: Left wireframe SVG + Right reconstruction iframe (same as flow-storyboard)

**Additional header badge**: SDK version badge

```html
<span class="badge badge-sdk">SDK: @amplitude/analytics-browser v2.x.x</span>
```

**Critical issue banner** (show above the flow track if any C-level issues found):

```html
<div class="critical-banner">
  ⚠ Critical issues detected — events may not be reaching Amplitude.
  Review the highlighted steps below.
</div>
```

**Per-step recommendation link**: Below the friction detail in each panel, include:

```html
<a class="doc-link" href="https://amplitude.com/docs/..." target="_blank">
  📖 View fix in Amplitude docs →
</a>
```

**Live validation section** (appended after Phase 7 completes):

```html
<div id="live-validation">
  <!-- Validation summary, per-finding confirmations, zombie list, chart links -->
</div>
```

---

## SDK-Specific Wireframe Icons

Use these in the wireframe zone SVG per platform:

- **Browser SDK**: Browser window chrome with `</>` code icon
- **iOS**: iPhone outline (rounded rect, 70:140 ratio, notch at top)
- **Android**: Android device outline (rounded rect, slightly wider than iOS)
- **React Native**: Shared phone outline with React atom icon
- **Node.js**: Server rack icon (stacked rectangles with status lights)

---

## Example Customer Flows to Storyboard

| Customer says | Flow to trace |
|---|---|
| "Events aren't showing up" | Init → Identify → Track → HTTP delivery |
| "My user IDs aren't connecting" | setUserId / identify ordering |
| "Revenue events aren't tracking" | logRevenue() / track with revenue property |
| "Session replay isn't working" | SR plugin init + config |
| "My React app fires events twice" | useEffect dependency array + StrictMode double-invoke |
| "Events work locally but not in prod" | API key env var resolution |
| "I'm on amplitude-js, should I upgrade?" | Version comparison + migration path |
| "Events show up but user properties don't" | identify() ordering relative to track() |
| "How do I track screen views in React Native?" | RN navigation listener + track pattern |
| "Validate my tracking plan" | Full audit + Phase 7 live validation |
| "Are my events actually reaching Amplitude?" | Phase 7 primary — code audit + live diff |

---

## Output Checklist

Before presenting the artifact:

- [ ] SDK detected and version shown in header
- [ ] All `init()`, `identify()`, and `track()` calls located and ordered
- [ ] **Code-side event list built** (all unique event names from `track()` calls)
- [ ] Every critical issue (C1–C5) checked and either flagged or confirmed absent
- [ ] Every warning (W1–W6) checked
- [ ] Doc pages fetched for each issue found
- [ ] API keys, user IDs, and property values masked in output
- [ ] Reconstruction zone uses customer's actual code (staticized)
- [ ] Recommendation cards include doc links
- [ ] Critical issues banner shown if any C-level issues present
- [ ] File saved to `storyboards/` in workspace folder
- [ ] File presented with `mcp__cowork__present_files`
- [ ] **Phase 7 prompt delivered to user after storyboard presentation**
- [ ] *(If live validation ran)* Event taxonomy diff completed
- [ ] *(If live validation ran)* Confirmed gap charts created via `query_chart`
- [ ] *(If live validation ran)* Top 3 workflow charts created
- [ ] *(If live validation ran)* Storyboard HTML updated with validation section and re-presented

---

## Amplitude Docs Reference Index

Fetch these on demand during Phase 5:

| Topic | URL |
|---|---|
| Browser SDK 2 quickstart | `https://amplitude.com/docs/sdks/analytics/browser/browser-sdk-2` |
| Browser SDK 2 configuration | `https://amplitude.com/docs/sdks/analytics/browser/browser-sdk-2#configuration` |
| Legacy amplitude-js | `https://amplitude.com/docs/sdks/analytics/browser/javascript-sdk` |
| Migration guide (legacy → v2) | `https://amplitude.com/docs/sdks/analytics/browser/migration-guide` |
| iOS SDK (Swift) | `https://amplitude.com/docs/sdks/analytics/ios` |
| Android SDK (Kotlin) | `https://amplitude.com/docs/sdks/analytics/android` |
| React Native SDK | `https://amplitude.com/docs/sdks/analytics/react-native` |
| Node.js SDK | `https://amplitude.com/docs/sdks/analytics/node` |
| HTTP API v2 | `https://amplitude.com/docs/apis/analytics/http-v2` |
| User ID & Device ID | `https://amplitude.com/docs/sdks/analytics/browser/browser-sdk-2#user-id-and-device-id` |
| Identify / User Properties | `https://amplitude.com/docs/sdks/analytics/browser/browser-sdk-2#user-properties` |
| Session Replay (Browser) | `https://amplitude.com/docs/session-replay/session-replay-standalone-sdk` |
| Privacy & PII | `https://amplitude.com/docs/privacy-and-security` |
| Data/Taxonomy | `https://amplitude.com/docs/data/amplitude-data-settings` |
| Debugging / Logging | `https://amplitude.com/docs/sdks/analytics/browser/browser-sdk-2#debugging` |
| All SDKs index | `https://amplitude.com/docs/sdks/analytics` |
