
*Updated: @today's date in MM/DD/YY*

### Problem Context
Write one actionable but concise problem statement paragraph behind the issue and its underlying motivation, clearly articulating the core problems this issue aims to solve or opportunities that are unlocked by building this feature.
What's the marketing statement for this feature? Why are we building it now? Why do we deserve to win with this feature?
This problem statement must be detailed and actionable enough to stand alone without additional context and still convey ALL the key takeaways but be limited to 3 concise sentences MAXIMUM.
Lead with the most relevant customer persona making the request (ex: "Business owners need...") but NEVER use exact person and company names in the overview paragraph.

### Solution Design

**Explore the solution space** before committing to a direction. Consider multiple candidate solutions and evaluate them against strategic and experience lenses.

Identify which of these strategic levers matter most for this solution and go deep on them:
- Prioritize features that maximize cost advantages through economies of scale, reducing per-unit cost as user adoption or operational volume increases.
- Select features that amplify network effects, increasing value to users as the number of participants grows.
- Favor features that create counterpositioning opportunities, introducing capabilities or experiences that competitors cannot easily replicate without significant disruption to their own strategy.
- Emphasize features that improve customer switching costs, making it harder or less appealing for users to leave the ecosystem.
- Focus on features that strengthen the brand, reinforcing its unique identity and building lasting emotional connections with users.
- Leverage features that capitalize on cornered resources, such as proprietary data, exclusive partnerships, or unique capabilities competitors cannot easily access or imitate.
- Implement features that demonstrate superior processes or proprietary workflows, creating a sustainable operational advantage over competitors.

When designing a simple and delightful user experience, try and employ some of these principles when designing the user flow:
- Simplify relentlessly — remove unnecessary steps or features to deliver an intuitive, minimalistic experience. Every element must earn its place.
- Maintain seamless continuity — guide users naturally from start to finish with minimal cognitive load and no dead ends.
- Sweat the details — typography, transitions, spacing, and copy should all reflect meticulous craftsmanship. Balance functionality and beauty in a unified, consistent brand feel at every touchpoint.
- Delight with thoughtful touches — add small but memorable details that elevate the experience beyond functional.

- When unclear how to design a SaaS component, copy Linear on how a design or component should work.

Do not explicitly mention these principles when talking through the solution - just incorporate it into your rationale when exploring then deciding on and explaining the best solution.

After exploring the solution space and identifying the best strategy, provide a concise walkthrough of what the feature does, how it solves the user's pain points, and how it delights the user — written tightly, without unnecessary preamble.
- Walk through in very specific detail the desired way that users interact with and experience the product. Focus on the interface design, each step of the user journey, and how to improve the overall usability and simplicity of the solution.
- Present the real-life usage narrative that we expect to occur as a result of launching this feature.
- Anchor this to a real user in a real moment. Example: "When Frank was visiting different startups in San Francisco, he uses [feature X] to log complaints and track requirements in [feature Y] as he learns about them..."
- Emphasize unique tactics we can employ or aspects that set this solution apart from alternatives in the market and counter positions our product against competitors. 

Remember: the best solutions maximize ICE: impact, confidence, and effort. The higher the impact, the higher the confidence, and lower the effort - the better the solution.

Break the solution walkthrough into focused and concise paragraphs separated by line breaks — one aspect of the experience per paragraph.

### Acceptance Criteria
Each criterion must describe a specific, testable condition with a clear expected outcome. Criteria describe desired outcomes, not implementation choices. Criteria should be MECE — mutually exclusive and collectively exhaustive — covering all conditions required for the work to be complete.

**Functional:**
- [Observable user behavior → expected system response or result]

**Edge cases and error handling:**
- [What happens when input is invalid, a service fails, data is missing, or the user hits an unexpected state]

**Out of scope:**
- [What this work explicitly does NOT include — set clear boundaries to prevent over-building]

<examples of strong acceptance criteria>
- When a user types in the search bar, results update live after a 300ms debounce, displaying the product name, image, and price in a ranked list.
- Users can navigate to Settings > Edit Profile and update their first name, last name, email, and phone number. Changes persist immediately on save and reflect across the app without a refresh.
- If the save request fails (timeout or 5xx), display an inline error: "Something went wrong. Please try again." The form retains the user's unsaved input.
- Submitting an empty search query returns the default results list, not an error or empty state.
- This does NOT include bulk profile editing, CSV export, or admin-level permission changes.
</examples of strong acceptance criteria>
