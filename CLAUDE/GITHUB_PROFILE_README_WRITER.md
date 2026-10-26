# Claude Code Context — Personal GitHub Profile README

> **Purpose:** Write or revise the README on a personal GitHub profile (the special `USERNAME/USERNAME` repository) so it clearly and honestly shows who the person is, what they are doing now, and where to find their work — in the style they choose (hobby, cool stuff, job hunting, "who I am", and so on) — without inventing facts, exposing private data, or faking engagement.

This is the profile-page counterpart of `GITHUB_README_WRITER.md` (which covers project repositories). The same rule carries over: **verified facts come first, style comes second.**

## 0. How to Use This File

1. Put this file in the profile repository (as `CLAUDE.md`, or keep the name and tell Claude Code to read it).
2. Fill in **§15 Profile Fact Sheet**. Anything left blank is treated as *unknown*, never guessed.
3. Ask for what you want, for example: *"Read the context file, audit my current README, then rewrite it in Builder + Cool-stuff mode."*

A profile is mostly a personal landing page. It is not a resume unless the owner chooses the Job-Hunting mode (§6).

## 1. Mission and Success Criteria

A visitor should be able to answer, in roughly five seconds and then in more depth below the fold:

1. **Who is this?** Name or handle, and one honest line about identity or focus.
2. **What are they doing now?** Current projects, learning, and obsessions — not a life history.
3. **What makes them interesting?** Real work, taste, interests, or personality that is specific rather than generic.
4. **Can I trust it?** Content is current, accurate, and honest about status (active, paused, legacy, planned).
5. **Where is the work?** Working links to projects, writing, or other accounts.
6. **How do I reach or follow them?** Only the channels the owner actually wants public.

Optimize for clarity, personality, accuracy, privacy, and a page that still looks right in a year. Do **not** optimize for follower or star counts.

## 2. Non-Negotiable Truth and Safety Rules

**Truth**

- **Inspect before editing.** Read the existing README, repo history, workflows, and assets first (§3).
- Never invent or imply employers, job titles, degrees, certifications, skills, projects, awards, publications, speaking, clients, testimonials, funding, follower counts, or contribution numbers.
- Do not turn aspirations into facts. Keep **active / paused / legacy / planned / idea** distinct, and phrase unshipped work as intent ("aims to", "intended to"), not capability.
- Avoid unprovable superlatives: "next-gen", "revolutionary", "best", "unparalleled", "world-class".
- Avoid numeric skill meters ("Python 70%") unless the owner defines what the number means. A wall of `0%` entries is worse than no table. Prefer a short list of what the owner actually uses, plus a "learning" label.
- "Open to work", "available for hire", or "looking for collaborators" appear **only** if the owner says so in the Fact Sheet.
- If a fact cannot be verified, omit it, or mark it with an HTML TODO comment for the owner. Ask a question only when a missing fact blocks correctness.
- Preserve the owner's authentic voice, language(s), and humor. Improve clarity and structure; do not flatten it into generic developer-bio copy.

**Privacy and safety**

- Never publish home address, phone number, birthdate, government or student IDs, precise location, family details, financial info, tokens, `.env` values, or private URLs. Use only what the owner lists as public in the Fact Sheet.
- **Never include photos, names, messages, or personal details of other people without their clear consent.** This includes "gallery", "crush", "friends", or "family" sections, and hotlinked social-media CDN images.
- **Hidden content is public content.** HTML comments are visible in the raw file, and anything ever committed stays in git history. Do not leave private notes, old biodata, or removed personal sections inside comments. During the audit, report any such material and recommend deleting it; tell the owner that history may still contain it.
- Third-party widgets and counters make requests to outside servers whenever a visitor loads the page. Keep them few and from sources the owner trusts. Mention this once when a profile has several trackers.
- Don't expose security-sensitive details, such as tools or targets presented in a way that suggests unauthorized access. Describe security work in terms of learning, research, defensive skills, labs, and authorized testing.

**No manipulation**

- Never recommend or create fake stars, followers, bots, follow-for-follow schemes, artificial commits, backdated commits, contribution-graph art made from empty commits, or spam.
- GitHub does not publish a formula for profile ranking, search placement, or "favoring" active profiles. Treat claims like "keyword density boosts your profile" or "pinned-repo sync affects the algorithm" as **unverified hypotheses**; never present them as facts or promise results.
- Don't change account settings, pins, repository visibility, bio, or other repositories without explicit authorization. Never push, publish, or force-push on your own.

## 3. Reconnaissance — Required Before Writing

Inspect, as available:

- The profile repo: root tree, current `README.md`, `.github/workflows/`, `assets/` or `images/`, `LICENSE`, and `git log` for how the page has evolved.
- Confirm the mechanics: the repo must be **public**, named exactly like the username, with `README.md` at the root; otherwise the README will not show on the profile.
- Every external URL in the current README: username consistency (typos, alternate accounts), leftover placeholders (`yourusername`, `link_to_image_1`, empty `src=""`), malformed markup, duplicate counters, services that no longer work.
- Commented-out and hidden blocks, to decide per block: **restore**, **keep as a TODO**, or **delete for privacy**.
- Pinned repositories, repo list, and descriptions (via `gh` or the GitHub web UI if authorized). Check that project statuses in the README match reality.
- Existing assets: banners, logos, GIFs. Verify paths before referencing them.
- The owner's Fact Sheet (§15) as the source for everything not present in the repo.

Use targeted inspection. Do not run destructive commands. Before editing, give a short summary of verified facts, what is stale or risky, and the proposed layout.

## 4. Choose the Profile Mode(s)

If the Fact Sheet doesn't specify, ask **once**, offering the modes below. Modes can be combined (for example, Builder + Cool-stuff). Pick one primary mode that sets the order of sections.

| Mode | Primary goal | Lead with | Tone |
|---|---|---|---|
| **Builder / Showcase** | Show what the person makes | Projects with status | Confident, concrete |
| **Job-hunting** | Help a recruiter or client decide quickly | Positioning line, selected work, contact | Clear, professional, specific |
| **Cool stuff / Aesthetic** | A memorable, stylish landing page | Hero + vibe, "now", toolkit grid | Playful, curated |
| **Hobbyist / Tinkerer** | Share what they're messing with | "Now", side quests, dotfiles/hardware | Casual, curious |
| **Who-I-am / Personal** | Introduce the person | Short bio, interests, story | Warm, personal |
| **Learner / Student** | Show growth in public | Learning log, current course, small projects | Honest, curious |
| **Open-source contributor** | Surface contributions and maintained projects | Maintained repos, notable PRs, how to collaborate | Technical, brief |
| **Creator / Writer / Researcher** | Point to writing, talks, or research | Latest publications and links | Clear, editorial |
| **Minimal / Terminal** | Very little, very clean | Name, one line, three links | Terse |

## 5. Section Library

Choose only the sections that fit the mode and the facts. Order follows §6.

| Section | Purpose | Rules |
|---|---|---|
| **Hero** | Identity and vibe in five seconds | Name/handle, one line, optional banner or typing animation. Give the animation a static alt text with the real lines. |
| **Status notice** | Account-level context (suspension, migration, hiatus) | One short factual line. Don't dramatize or add unverified detail. |
| **Now** | What they're focused on this month | Building / learning / exploring / reading / listening. Replace stale items; prefer five lines to fifty. |
| **About / Who** | Plain-language introduction | 2–4 sentences. Skip biography the owner didn't choose to share. |
| **Toolkit** | Inventory of tools | Group (languages, frameworks/tools, learning). Only things actually used; mark "learning". Consistent badge style. |
| **Projects** | Work with status | Name, link (only if real), status, one honest line. Use a table for 3+ projects. Legacy and private work labeled as such. |
| **Path / Journey** | Story and growth | A collapsible `<details>` block works well. Facts only; no ages or sensitive dates unless the owner wants them. |
| **Interests / Hobbies** | Personality | Short; specific beats generic ("Brazilian jiu-jitsu", not "sports"). |
| **Writing / Talks** | Longer-form output | Real links only. Consider a workflow-updated "latest posts" list only if authorized. |
| **Diagnostics (stats)** | Live activity | Optional, few cards, one theme (§8). Never imply stats equal skill. |
| **Music / Now playing** | Personal touch | A single card. Optional. |
| **Elsewhere / Contact** | Where else to find them | Verified handles only; no placeholder links. Prefer the channels the owner wants public. |
| **Open to** | Work, collaboration, mentoring, help | Only if the owner opts in. State specifically what and how. |
| **Footer** | Tidy ending | Optional "last revised" date, which must be true. |

## 6. Mode Blueprints (Section Order)

**Builder / Showcase** — Hero → Now → Projects (status table) → Toolkit → Stats (optional) → Elsewhere.

**Job-hunting** — Hero with a *specific* positioning line (role + focus + stack, e.g. "Backend engineer working with Go and PostgreSQL") → *Open to* (role types, location/timezone/remote, since when) → Selected work (2–4 projects, each with the problem and the owner's real contribution; link to evidence) → Skills (what they use, no percentages) → Experience or education summary **only if provided** → Contact + resume/portfolio link. Rules: no inflated titles, no "rockstar/ninja" language, no claims that can't be shown, keep contact details to those the owner chose.

**Cool stuff / Aesthetic** — Hero (banner or typing animation) → Now (obsessions, side quests, soundtrack) → Toolkit grid → Live widgets (few, same theme) → Signal log (recent builds) → Elsewhere. One palette, defined hex codes.

**Hobbyist / Tinkerer** — Hero → Now → Side quests (dotfiles, hardware, mods, games, experiments) → Toolkit/setup → Logs.

**Who-I-am / Personal** — Hero → Short intro → Interests → Now → Path (collapsible) → Elsewhere. Only what the owner wants public.

**Learner / Student** — Hero → Currently learning → Learning log or roadmap (with status) → Small projects → Toolkit labeled "learning" → Elsewhere.

**Open-source contributor** — Hero → Maintained projects → Notable contributions (linked PRs/issues the owner actually made) → How to collaborate → Elsewhere.

**Creator / Writer / Researcher** — Hero → Focus → Latest work (links) → Topics → Elsewhere.

**Minimal / Terminal** — Name → one line → 3–5 links. Nothing else.

## 7. Rendering Rules (GitHub)

- GitHub sanitizes HTML: inline `style=""`, `class`, `target`, scripts, and iframes are removed. Use Markdown plus `align="center"`, `width`, `height`, `<picture>`, `<details>`, `<sub>`, `<br/>` and similar basics. Do not pretend that CSS colors or fonts will apply.
- Markdown inside HTML blocks needs a blank line between the tag and the Markdown.
- Give every image meaningful `alt` text. Make sure the page still communicates its core message if every external image fails to load.
- Check mobile: avoid wide tables and large side-by-side images; set heights or widths so cards wrap cleanly.
- Do **not** write real content in Unicode "fancy fonts" (𝓕𝓪𝓷𝓬𝔂, 🅱🅻🅾🅲🅺 letters). They are read letter-by-letter by screen readers and can't be searched. Use them, if at all, in decoration only.
- Keep one heading hierarchy per section. Emoji are fine, but use a consistent set.
- Use relative links for files inside the repo. Verify anchors.
- GitHub truncates very large READMEs (documented limit: 500 KiB). A profile should be a small fraction of that; remove dead sections instead of commenting out thousands of lines.
- Dark mode: many visitors use it. For images that must differ by theme, use `<picture>` with `prefers-color-scheme` sources. A fixed dark theme everywhere is also a valid choice, if applied consistently.

## 8. Widgets and External Services

Treat every widget as **optional and breakable**.

| Service | Use | Notes |
|---|---|---|
| `shields.io` | Static or dynamic badges | Reliable. Unknown `logo=` slugs render without an icon. Style all badges the same way (color, `style=`, logo color). |
| `komarev.com/ghpvc` | Profile view counter | Use **one** counter at most. |
| `github-readme-stats` (public Vercel instance) | Stats, top languages, WakaTime | Can be rate-limited. `langs_count` accepts 1–10. Pass `theme=` and `hide_border=true` for consistency. Languages show code bytes, not skill. |
| `streak-stats.demolab.com` | Contribution streak | The current public host. The older `herokuapp.com` host is deprecated. It can occasionally fail to load. |
| `readme-typing-svg.demolab.com` | Typing animation | Lines separated by `;`, spaces as `+`. Set `width` so text isn't clipped; supply static alt text. |
| `github-profile-trophy` | Trophies | Optional. Confirm the username matches. |
| Spotify profile card services | Now playing | Requires the owner's authorization; single card only. |
| `user-badge.committers.top` | Country committer badge | Only if the owner qualifies and wants it. |

Rules:

- **Username consistency:** every widget must reference the same verified GitHub username (and WakaTime handle where relevant). Flag mismatches rather than choosing silently.
- Avoid discontinued or unreliable hosts (such as `glitch.me` counters) and stacking several visitor counters.
- Prefer roughly **six or fewer** external image widgets. More slows loading and adds visual noise.
- For stability, suggest self-hosted or GitHub Actions–generated cards when the owner is willing to maintain a workflow. Never create or run a workflow without authorization.
- Never embed a widget that requires pasting a secret into the README.

## 9. Visual Identity

- Pick **one** palette and theme (for example dark + `onedark`, or pastel, or terminal green) and apply it to badges, stats, trophies, and banner with matching hex codes. Mixed styling reads as unfinished.
- Use a banner, SVG, or GIF only if the owner provides it or approves generating one, and keep file sizes modest. Do not fabricate screenshots or imply a shipped product from a mockup.
- Respect asset licenses and attribute where required.
- If an asset is missing, add an HTML TODO comment describing exactly what is needed and where it should be saved (for example `assets/banner.png`). Don't leave a broken image.

## 10. Discoverability (Honest Version)

Things that are real and safe:

- The profile repo name must match the username; keep it public.
- Fill in the **GitHub profile fields** the owner wants public (bio, status, website, social links, location at the owner's chosen precision). These sit next to the README and matter as much as it does.
- Keep the **pinned repositories** (up to six) relevant and current, each with a clear description, and consistent with what the README says. Pair with `GITHUB_README_WRITER.md` for the pinned repos' own READMEs.
- Use the words people would genuinely use to describe the owner's work, in natural sentences. No keyword stuffing.
- Optionally add accurate topics to the profile repository.

Things to **not** claim: that any of the above boosts ranking in GitHub search, Explore, or Trending, or that GitHub rewards "active" profiles in some documented way. Say "this may help people understand your profile" rather than "this will rank you higher."

## 11. Job-Hunting Addendum

When the mode includes job-hunting:

- Make the target role explicit and specific; one line beats a paragraph.
- Link only to work the owner can discuss in an interview. Describe their own contribution accurately, especially on team or tutorial projects.
- Show evidence (live demo, repo, write-up) in preference to adjectives.
- Include location or timezone and work-authorization/remote preferences **only if provided**.
- Keep personal data off the page; use a contact route the owner is comfortable with (LinkedIn, a public email, a contact form).
- If the owner also wants the "cool landing page" feel, keep it, but make sure the first screen still says what they do and how to reach them.

## 12. Quality Assurance Before Finishing

- Markdown/HTML structure, heading order, blank lines around Markdown inside HTML, spelling in each language used.
- Every link and image URL: real, correctly spelled, no placeholders, correct username.
- Every claim traceable to the repo, the pinned repos, or the Fact Sheet.
- No secrets, private data, third-party personal data, or leftover private comments.
- One consistent theme; badge styles match; widget count is reasonable.
- Page reads sensibly with images blocked, and fits a phone-width screen.
- Preserve accurate content from the previous version; list what was removed and why.
- Do not claim a check passed unless it was actually run. State what could not be checked (for example, whether a third-party card currently loads).

## 13. Workflow and Deliverables

For "revise my profile README":

1. Inspect (§3) and summarize verified facts, risks, and stale items.
2. Confirm the mode(s) and any open Fact Sheet gaps.
3. Propose the section order in a few lines.
4. Rewrite `README.md`. Keep what is accurate; replace or remove what isn't; mark unknowns with TODO comments.
5. Validate to the extent possible (§12).
6. Report:
   - What changed and why (kept, revised, added, removed).
   - Facts that were verified versus assumed.
   - Privacy issues found, including anything remaining in git history.
   - Checks run and their results; checks not possible.
   - Missing facts or assets still needed from the owner.
   - Suggestions for GitHub profile fields and pinned repositories (for the owner to apply manually).
   - A short prioritized next-steps list.

## 14. Operating Mode

- Prefer small, reviewable edits unless a full rewrite is requested; when a rewrite is requested, rewrite the file instead of only advising.
- For an audit or plan request, do not modify files.
- Never report "complete" while TODOs, placeholders, or unverified claims remain; list them.
- If the repo has no README, create one from the Fact Sheet.
- Keep the result maintainable: a concise page that is true today beats an elaborate one that decays.

**Primary principle:** Make the profile easy to understand, honest about what is current, safe for the owner and for other people, and recognizably theirs.

---

## 15. Profile Fact Sheet (fill this in; delete lines that don't apply)

> Leave anything unknown **blank** — Claude will treat blanks as unknown. Mark each item you want kept private with "private".

### Identity

- GitHub username: `` (must match the profile repo name)
- Display name / handle to show:
- Pronouns (optional):
- Language(s) the README should use:
- One-line identity or focus (your words):
- Account status notes to include (e.g. migration, suspension, hiatus) — factual wording:

### Mode

- Primary mode: `Builder` / `Job-hunting` / `Cool stuff` / `Hobbyist` / `Who-I-am` / `Learner` / `Open-source` / `Creator` / `Minimal`
- Secondary mode(s):
- Audience (who should this impress or help?):

### Now

- Building:
- Learning:
- Exploring / reading / obsessed with:
- Listening (optional):

### Projects

| Name | Status (`active` / `paused` / `legacy` / `planned` / `idea`) | Link (real only) | One honest line | Evidence (demo/repo/write-up) |
|---|---|---|---|---|
|  |  |  |  |  |

### Toolkit

- Languages (used):
- Languages (learning):
- Frameworks and tools:
- Hardware / OS / setup (optional):
- Rule for badges: `consistent dark` / `brand colors` / `monochrome` / `none`

### Background (include only what you want public)

- Education:
- Work or experience (job-hunting mode):
- Certifications (only real, verifiable ones):
- Short "how I got here" milestones (no ages unless you want them):

### Interests / hobbies

-

### Open to (check only what's true)

- [ ] Work / roles: `` (type, location, remote, since when)
- [ ] Freelance / clients:
- [ ] Collaboration on:
- [ ] Mentoring / help with:
- [ ] None — just showing my stuff

### Elsewhere (verified handles only)

| Platform | URL | Public? |
|---|---|---|
|  |  |  |

### Visual style

- Vibe (e.g. cyberpunk, terminal, pastel, retro, minimal):
- Palette (hex codes):
- Widget theme (e.g. `onedark`, `tokyonight`, `dracula`):
- Banner / logo / assets available (paths in repo):
- Widgets allowed (check): [ ] typing animation  [ ] stats card  [ ] top languages  [ ] streak  [ ] WakaTime  [ ] trophies  [ ] Spotify  [ ] visitor counter  [ ] committer badge
- WakaTime handle (if different from GitHub):

### Safety and privacy

- Never include (names, photos, locations, dates, accounts, people):
- Old content to remove from the page:
- Anything in the current README that must be preserved exactly:

### Notes for Claude

- Tone (e.g. dry humor, serious, friendly):
- Words or phrases to avoid:
- Anything unusual about this account or page:

---

## 16. Example Prompts

**Audit only:** *"Read this context file. Audit my current README.md and git history, list stale widgets, placeholders, privacy risks, and unverified claims. Do not edit anything."*

**Revise:** *"Using the Fact Sheet, rewrite README.md in `Builder + Cool stuff` mode. Preserve my voice, keep the sections I marked, and use TODO comments for anything missing."*

**Switch modes:** *"Create a job-hunting variant of my README as `README.jobhunt.md`, using only facts in the Fact Sheet. Don't touch README.md."*

**Refresh:** *"Update the Now section and project statuses from my pinned repos, and bump the 'last revised' date. Change nothing else."*
