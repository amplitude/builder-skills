---
name: launch-video
description: Plan and produce video and visual assets for product launches — demo videos, GIFs, screenshots, and programmatic video with Remotion. Use this skill whenever someone asks to create a demo video, record a product walkthrough, make a launch GIF, plan visual assets for a launch, or decide what media to create for an announcement. Also trigger for "what should our demo video show," "how do we record the product," "I need visuals for the launch," "make a video for this launch," or any request about creating non-text media tied to a product release. Covers video scripting, recording, programmatic video (Remotion), GIF creation, screenshot best practices, and per-platform format guidance.
suggest_when: User asks to create a demo video, record a walkthrough, make a launch GIF, plan visual assets, "what should our demo video show", "I need visuals for the launch", "make a video for this launch", or any request about creating non-text media for a product launch.
---

# Launch Video & Visuals

This skill covers the creation of visual and video assets for product launches. These are the highest-impact assets you'll create — a great demo video or GIF stops the scroll, communicates value faster than words, and gets shared. A bad one can actively undermine the launch by making the product look confusing or unpolished.

## The media hierarchy

For most launches, the decision of what to create follows this order:

1. **Demo video** — Shows the product in action with context. Best for explaining how something works.
2. **Animated GIF or screen recording loop** — Shorter, auto-plays inline on social. Best for showing a specific interaction.
3. **Annotated screenshot** — Static, fast to produce, good for showing a specific state or feature.
4. **Diagram or illustration** — For architecture, concepts, or things that can't be screenshotted.

In general: use video when the *flow* matters, GIF when a *single interaction* communicates the value, and screenshots when *one specific state* is the point.

## Demo video

### Length by platform

| Platform | Target length | Hard limit |
|----------|--------------|------------|
| Product Hunt | 60-90 seconds | 3 minutes |
| Landing page hero | 60-90 seconds | 2 minutes |
| X/Twitter embedded | 30-45 seconds | 2 minutes 20 seconds |
| LinkedIn | 45-90 seconds | 10 minutes |
| YouTube (full demo) | 3-5 minutes | — |

The platform hard limits aren't just technical — engagement drops sharply beyond them. A 4-minute PH video is effectively no video.

### Script structure (for short-form demo)

Keep this to 5-7 beats:

1. **Problem** (5-10 seconds) — State the problem being solved. One sentence. Not a long setup.
2. **Introduce the solution** (5-10 seconds) — Name the product and the core value prop.
3. **Demo: happy path** (30-60 seconds) — Show the primary use case working end-to-end. This is the heart of the video.
4. **Key capabilities** (10-20 seconds) — 2-3 quick cuts showing secondary features. Keep it fast.
5. **Proof point** (5-10 seconds) — A metric, customer quote, or benchmark. One slide or voiceover line.
6. **CTA** (5 seconds) — One action. "Try it free at [URL]" or "Sign up at [URL]."

Avoid: long intros, animated logos (audiences click away), slow product startup screens, and anything that doesn't show the product doing something.

### Recording tips

- **Use a demo environment, not production.** Clean data, no embarrassing customer info, reliable state.
- **Slow down deliberate interactions.** People follow cursor movements better when you move intentionally, not at normal working speed.
- **Record at 2x your target resolution.** Record at 2880×1800 or 1440×900 (Retina), then downscale for delivery. This gives you zoom room and looks sharper.
- **Hide everything extraneous.** Close Slack notifications, hide browser bookmarks bar, use a clean browser profile. Distractions in the recording erode trust.
- **Capture more than you'll use.** Record full workflows and cut in post. It's faster than re-recording because you missed a beat.

### Voiceover vs. silent

Both work. The choice depends on context:

- **Voiceover**: Warmer, more explanatory, works better on YouTube and landing pages. Requires a clean recording environment and good audio quality. Bad audio is worse than no audio.
- **Silent with text overlays**: Works better on autoplay-with-mute contexts (social feeds). Faster to produce. Requires clear on-screen labels.

If you're unsure: record the demo silently, add text overlays for key moments, then decide whether to add voiceover based on the platform.

### Tooling

- **Screen recording**: Loom (quick), Screen Studio (polished output, good for marketing), QuickTime (raw), OBS (full control)
- **Video editing**: CapCut (fast, easy), DaVinci Resolve (professional, free), Final Cut Pro, Adobe Premiere
- **Motion design / logo animations**: After Effects, Motion (Mac), Jitter (web-based)
- **Captions/subtitles**: Descript (also good for editing by transcript), Captions app, Rev
- **Programmatic video**: Remotion (React-based — see section below)

## Programmatic video with Remotion

For teams that ship fast and don't want to wait on a motion designer for every launch, programmatic video lets you write React components and render them as MP4 files. The video is code: version-controlled, parametrized, and iteratable without a timeline editor.

### When to use programmatic video

Works well for:
- Launch announcement clips (15-45 seconds) for social media
- Product walkthrough videos showing UI in action
- Feature highlight reels with text overlays and screenshots
- Data-driven videos (benchmark comparisons, growth metrics)
- Templated videos you'll reuse across launches (just swap content)

Less suited for:
- Cinematic brand videos requiring complex motion design
- Founder narrative videos with live footage
- Videos that need extensive custom illustration or 3D

For major Tier 1 launches, you might combine approaches: programmatic video for social clips and a professional motion designer for the hero video.

### Remotion setup

```bash
npx create-video@latest my-launch-video
cd my-launch-video
npm start  # Opens Remotion Studio for preview
```

Key concepts:
- **Composition**: A video is a React component with a defined duration (in frames) and framerate
- **useCurrentFrame()**: Hook that returns the current frame number — use it to drive animations
- **Sequence**: Component that offsets its children in time — use it to sequence scenes
- **spring()**: Animation utility for natural-feeling motion (ease-in/out)
- **Assets**: Images, screenshots, and audio go in the `public/` folder

### Scene planning template

Before writing code, plan the video scene by scene:

| Field | Description |
|-------|-------------|
| **Scene #** | Sequential number |
| **Duration** | Seconds (e.g., "3s") |
| **Purpose** | What this scene communicates (one sentence) |
| **Text content** | Exact text that appears on screen |
| **Visual elements** | Screenshots, icons, code snippets, diagrams |
| **Animation style** | Fade in, slide from left, typewriter, scale up, etc. |
| **Transition out** | How this scene exits (fade, cut, slide) |

### Code patterns

**Sequenced scenes:**
```tsx
<Sequence from={0} durationInFrames={90}>
  <HookScene />
</Sequence>
<Sequence from={90} durationInFrames={120}>
  <DemoScene />
</Sequence>
<Sequence from={210} durationInFrames={90}>
  <CTAScene />
</Sequence>
```

**Text reveal:**
```tsx
const frame = useCurrentFrame();
const opacity = interpolate(frame, [0, 20], [0, 1], {
  extrapolateRight: 'clamp',
});

return <h1 style={{ opacity }}>Your primary value prop here</h1>;
```

### Iteration workflow

1. **Plan scenes** using the template above
2. **Collect assets** — screenshots, logos, product images → `public/` folder
3. **Write or prompt the first draft** — get the structure and content right
4. **Preview in Studio** — watch it through, note timing and visual issues
5. **Iterate** — adjust timing, animation, and content. Usually takes 2-4 rounds
6. **Render** — `npx remotion render src/index.ts MyComposition out/video.mp4`
7. **Check platform specs** — verify resolution and file size work for your target platform

## GIFs and short loops

GIFs auto-play on most platforms and are ideal for showing a single interaction — a UI state change, a CLI command output, an API response. They're faster to produce than video and often more effective for social posts.

### When to use GIF vs. video

Use GIF when:
- The entire value can be communicated in 3-8 seconds
- You're showing a single UI interaction, not a workflow
- The asset will be embedded in a tweet or README where video playback is less reliable

Use video when:
- The value requires context (problem → solution)
- The interaction takes more than 8 seconds to demonstrate
- You need audio

### Recording GIFs

- **Capture at 2x**, downscale to target resolution
- **Keep under 5MB** for web performance (use palette reduction or fewer frames)
- **Loop seamlessly** — the start and end state should match so the loop doesn't jar
- **Tool options**: CleanShot X (recommended for Mac), Kap, Giphy Capture, Gifski (for converting video clips)

### Optimizing GIF file size

- Reduce color palette (256 → 128 or 64 colors for many UI recordings)
- Drop frames (30fps → 15fps is rarely noticeable in UI recordings)
- Crop aggressively — show only what's changing, not the whole screen
- Convert to MP4 with autoplay/loop instead of GIF when the platform supports it (MP4 is ~10x smaller than equivalent GIF)

## Screenshots

Screenshots are underused in launches. A well-composed screenshot with clear annotation communicates a feature faster than a paragraph.

### Composition

- **Show the product in a meaningful state** — not an empty screen, not a loading state, not a screen full of dummy data that makes features hard to see
- **Use a clean environment** — browser without tabs, dark or light mode consistently applied, no personal data visible
- **Highlight the relevant area** — callout boxes, arrows, or highlights direct attention to what matters

### Annotation tools

- **CleanShot X** (Mac) — captures, annotates, and exports in one flow
- **Skitch** — simple annotations
- **Figma / Sketch** — for more polished product shots with custom styling

### Browser framing

For web products, use a browser frame to make screenshots look intentional rather than raw. Tools like Screely, Browserframe, or custom Figma templates add a browser chrome overlay.

### Multiple screenshots for feature grids

Landing pages and Product Hunt galleries often need 3-5 screenshots showing different aspects of the product. Plan these as a set:
- Each screenshot shows a distinct capability
- Consistent visual treatment (same zoom level, same browser theme, same annotation style)
- Tell a progression: entry → key action → result

## Asset checklist by tier

### Tier 1
- [ ] Demo video (60-90 seconds, suitable for PH and landing page)
- [ ] Short social cut (30-45 seconds from the same recording)
- [ ] 3-5 annotated screenshots for landing page and PH gallery
- [ ] 1-2 GIFs for social posts (showing key interactions)
- [ ] Open Graph image for blog post and social link previews

### Tier 2
- [ ] 1-2 GIFs or short screen recording
- [ ] 2-3 screenshots for landing page section
- [ ] Open Graph image

### Tier 3
- [ ] 1 screenshot
- [ ] Optional: short GIF if the change is visual

## Open Graph images

Every piece of content that gets shared as a link (blog post, landing page, changelog entry) should have a custom Open Graph (OG) image. The OG image is what appears when the link is pasted into Twitter, Slack, iMessage, or LinkedIn.

- **Size**: 1200×630px
- **Content**: Product name + primary value prop. Treat it like a billboard — readable at small size
- **Consistency**: Use a template so all your launch content has a cohesive look
- **Tools**: Figma template, Vercel OG (code-generated), Bannerbear (automated)

## Video specs by platform

| Platform | Resolution | Max length | Format | Notes |
|----------|-----------|------------|--------|-------|
| X/Twitter | 1280×720 or 1920×1080 | 2:20 | MP4 (H.264) | Autoplay muted — add captions |
| LinkedIn | 1920×1080 | 10 min | MP4 (H.264) | Square (1080×1080) works well in feed |
| Product Hunt | 1920×1080 | 90 sec | MP4 | Keep under 50MB |
| Website hero | 1920×1080 | No limit | MP4/WebM | Consider autoplay loop (no audio) |

## Companion skills

- **launch-strategy** — determines which assets are needed for the launch tier
- **launch-tweet** — the GIFs and videos go in the tweet (attached, not linked)
- **launch-landing-page** — the demo video and screenshots go on the page
- **launch-distribution** — per-platform format requirements
