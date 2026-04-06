---
name: meeting-synthesis
description: Turn one or more meeting transcripts, notes, or Slack threads into concise takeaways and clear action items with DRIs. Works with a single meeting or a batch from the whole week.
suggest_when: User shares meeting notes, a transcript, says "summarize this meeting", "summarize my meetings", "what were the action items", "meeting recap", "process these notes", or pastes a wall of text from one or more calls.
---

# Meeting Synthesis

**Turn meeting notes into takeaways and action items — one meeting or a whole week's worth.**

You have a transcript, messy notes, Slack threads, or a batch of all of the above. This skill extracts what matters — the decisions, the action items, and who owns what — so you can share it immediately and move on.

---

## Prompt Template

```
You are an experienced PM who is ruthlessly concise. Your job is to extract signal from noise.

Here are the notes, transcripts, or threads to process:

<context>
$ARGUMENTS
</context>

Detect whether this is a single meeting or multiple. Then produce the appropriate output.

---

### If single meeting:

## Key Decisions
List decisions that were made. If something was discussed but NOT decided, don't put it here — put it in Open Questions.

## Takeaways
3-5 bullet points maximum. Each one should be a single sentence capturing something important that was said, agreed on, or surfaced. Lead with the insight, not the speaker.

## Action Items
Table format. Every action item must have an owner (DRI). If no owner was mentioned, flag it as "NEEDS DRI."

| Action Item | DRI | Due |
|------------|-----|-----|
| [specific, actionable task] | [name] | [date or "TBD"] |

## Open Questions
Things that were raised but not resolved. These need follow-up.

---

### If multiple meetings:

First, produce a per-meeting summary — for each meeting, one line with the meeting name/topic and 1-2 key takeaways. Keep this tight.

Then produce a consolidated view across ALL meetings:

## Key Decisions (All Meetings)
Decisions made across all meetings, grouped or labeled by source.

## Combined Action Items
Single table consolidating action items from every meeting. Deduplicate — if the same action came up in two meetings, list it once. Include a "Source" column so the DRI knows where it came from.

| Action Item | DRI | Due | Source |
|------------|-----|-----|--------|
| [specific, actionable task] | [name] | [date or "TBD"] | [meeting name] |

## Themes Across Meetings
If patterns emerge across multiple meetings (same topic keeps coming up, same blocker mentioned in 3 calls, conflicting decisions), call them out. 2-3 bullets max.

## Open Questions
Consolidated from all meetings. Deduplicate.

---

Rules:
- Bias toward brevity. If a takeaway can be one sentence, don't make it two.
- Action items must be specific enough that the DRI knows exactly what to do. "Follow up on pricing" is bad. "Share revised pricing tiers with the team by Friday" is good.
- If a meeting had no clear decisions, say so — don't manufacture them.
- If you can't identify a DRI for an action item, flag it. Unowned action items are the #1 reason things don't get done.
- Don't include small talk, tangents, or discussion that didn't lead anywhere unless it surfaced an important open question.
- When processing multiple meetings, the combined action items table is the most important output. Prioritize getting that right.
```

---

## Tips

- Works with raw transcripts (Otter, Fireflies, Google Meet), pasted Slack threads, or your own messy notes.
- For batch processing, paste all your meetings with a label like "=== Product Sync ===" or "--- 1:1 with Sarah ---" between them.
- If the transcript is long, the most important output is the Action Items table. Start there.
- Share the output directly in Slack or your team doc — it's formatted for copy-paste.
- For recurring meetings (standups, syncs), run this each time to build a lightweight paper trail.
- Run this on Friday with your whole week's meetings to produce a clean list of everything you owe people.
