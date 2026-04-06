---
name: launch-email
description: Write launch announcement emails and changelog digests for product releases. Use this skill whenever someone asks to write a launch email, draft an announcement email, create a product update email, write a changelog digest, or compose an email to accompany a product launch. Also trigger for "write the email for this launch," "draft the announcement email," "help me email our users about this," or any request to craft email copy tied to a product ship. Covers subject lines, announcement structure, segment-specific emails, changelog digests, and timing relative to social.
suggest_when: User asks to write a launch email, draft an announcement, create a product update email, write a changelog digest, "write the email for this launch", "draft the announcement email", "email our users about this", or any email copy request tied to a product launch.
---
**User context:** $ARGUMENTS

> If the above is blank, ask the user to share the relevant context before proceeding.


# Launch Email

This skill helps write emails for product launches — from full-list announcements to segmented feature emails to changelog digests. Email consistently outperforms social for conversion because it reaches people who already care. The goal is to leverage that existing relationship: be direct, be valuable, and get the reader to the product fast.

## Email types by launch tier

### Tier 1: Full list announcement
For major new products or platform shifts. Goes to your entire subscriber list. This is your highest-stakes email — treat it accordingly.

Structure: Subject line → hero (what launched + why it matters) → visual (screenshot or GIF) → 2-3 supporting points → single CTA → signature.

Keep it under 400 words. Email is not a blog post. Link to the landing page and blog post for depth.

### Tier 2: Segment-specific announcement
For major new features that matter to a specific subset of users. Sends to the relevant segment only — this is both more targeted and protects your full list from email fatigue.

Structure: Subject → direct hook (why this segment should care) → what it does → how to try it → CTA.

Keep it under 300 words. The segment already knows your product; skip the preamble.

### Tier 3: Changelog digest
For smaller improvements, bundled weekly or biweekly. Goes to users who opt in to changelog updates.

Structure: "[Week of X] — What's new" → short bulleted list of improvements → link to full changelog.

Keep it under 150 words. Brevity signals respect for the reader's time.

## Subject lines

The subject line is the tweet first-line equivalent for email. It determines whether the email gets opened.

### What works

- **Specificity**: "Real-time transcription now supports 14 languages" outperforms "Big news about our API"
- **Value-forward**: Lead with what the reader gains, not what you shipped
- **Short**: Under 50 characters for mobile. The preview text carries the rest
- **No clickbait**: Your list opted in because they trust you. Don't abuse it

### Subject line formulas

- "Introducing [Product/Feature]: [one-line value prop]"
- "You can now [specific capability]"
- "[Product] just got [improvement] — here's what changed"
- "[Feature] is here: [concrete benefit]"
- "New: [specific thing] for [specific audience]"

### Preview text

Most email clients show 40-90 characters of preview text after the subject. Write it intentionally — don't let the email client pull the first line of body copy (often unreadable). The preview text should complement, not repeat, the subject.

Subject: "Introducing real-time translation for voice apps"
Preview: "14 languages, sub-200ms latency, available now on free tier"

### What to avoid

- "We're excited to announce..." (buries the value, overused)
- Emoji in subject lines (A/B test before using; often lowers open rate in B2B)
- ALL CAPS or excessive punctuation (spam filters + looks desperate)
- Vague teasers: "Something big is coming..." (erodes trust if overused)
- Misleading subjects that don't match the email content

## Announcement email structure

### Opening (1-2 sentences)
State what launched and the primary value. No warmup. No "Hope you're having a great week."

**Good:** "Today we're launching [Feature] — you can now [do specific thing] directly from [product]."

**Weak:** "We've been working hard on something we're really excited to share with you."

### Body (100-200 words)
Cover 2-3 supporting points. Each one should answer a reader question:
- What does it do? (if not fully clear from the opening)
- How does it work? (1-2 sentences, enough to reduce "is this too hard?" friction)
- Why does it matter? (concrete outcome, not abstract benefit)

Use short paragraphs — 2-3 sentences max. Emails with walls of text get skimmed or deleted.

### Visual
Include a product screenshot, GIF, or short video. Embed it, don't link to it. The visual should show the product doing the thing the opening promises. No stock photos.

### CTA
One link. Make it a button, not just a hyperlink. Be specific: "Try [Feature] now" beats "Learn more."

Place it prominently after the body — not buried at the bottom after a second screen of text.

### Signature
Keep it human. A name, role, and optionally a one-liner about what you're building. Avoid legal footers cluttering the main email body (put them in fine print below).

## Segmentation decisions

| Scenario | Segment |
|----------|---------|
| New product, new category | Full list |
| Major feature for power users | Users who use related features |
| Integration with third-party tool | Users who have connected that tool |
| Pricing change | Affected plan tiers only |
| Beta → GA | Users in beta + waitlist |
| Changelog digest | Changelog subscribers only |

Sending to the wrong segment is worse than not sending at all. A power-user feature email sent to inactive free users trains them to ignore your emails.

## Timing relative to social

Email is not the first thing you send on launch day — social is. The sequence:

1. **Social posts first** (early morning) — gets real-time engagement while the audience is active
2. **Blog post published** — the email links to it, so it must be live first
3. **Email send** (mid-morning to early afternoon) — captures people who missed social; gives the blog post backlink traffic

For Tier 1 launches, send email 2-4 hours after the social posts go out. This staggers your traffic sources and gives you something to say in the email ("Check out the full post →").

## Changelog digest format

The digest is a habit, not an announcement. It rewards users who stay subscribed by showing consistent momentum.

### Digest structure

```
Subject: [Product] updates — week of [date]

What's new this week:

• [Improvement 1] — one sentence on what changed and why it matters
• [Improvement 2] — same
• [Improvement 3] — same

[Optional: one sentence on what's coming next week]

→ Full changelog: [link]
```

Keep each bullet to one sentence. If an improvement needs more explanation, it probably warrants its own Tier 2 email.

Ship the digest on a consistent day (Friday afternoons work well — it's a low-send-competition window and feels like a weekly wrap-up).

## Common mistakes

- **Sending email before the landing page or blog post is live.** The email's job is to send people somewhere. Make sure the destination exists.
- **Too long.** Email is not the place for depth. Link to the blog post for that.
- **Multiple CTAs.** Every additional link after the primary CTA reduces its click rate. One destination per email.
- **Same email to everyone.** A feature announcement relevant to 20% of your list is noise for the other 80%.
- **No plain text version.** Some email clients block HTML. Send both.
- **Sending at the wrong time.** B2B emails perform best Tuesday-Thursday, 9-11 AM in the recipient's timezone. Consumer/developer audiences skew later in the day.

## Companion skills

- **launch-strategy** — messaging brief (primary value prop and audience for the email)
- **launch-tweet** — social copy that goes out before the email
- **launch-blog-post** — the post the email links to
- **launch-distribution** — where email fits in the full distribution sequence
