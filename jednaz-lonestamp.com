# JEDNAZ — Personal Website

Personal website for Jednaz Lonestamp (JEDNAZ) — Fullstack Developer, Cybersecurity Engineer, Founder & CEO of BlackBlazent.

## Stack
- **Vue.js 3** (Composition API)
- **TypeScript**
- **Vite** (build tool)
- **pnpm** (package manager)
- **Pure CSS** with CSS custom properties (no CSS frameworks)
- **Vue Router** (SPA routing)
- **Vercel** (hosting)
- **Convex** (ready to integrate for backend/DB)

## Design System
Dark glassmorphism theme with:
- `--bg-primary: #090040` deep space purple
- `--accent-primary: #B13BFF` electric violet
- `--accent-gold: #FFCC00` authority gold
- Fonts: Syne (display) + Space Mono (mono/code) + DM Sans (body)

## Pages
| Route | Description |
|-------|-------------|
| `/` | Home — profile hero, cover photo, nav pills, preview strip |
| `/showcase` | 8-section showcase: Hero → CTA |
| `/life` | Wikipedia-style biography with infobox sidebar |
| `/gallery` | Pinterest masonry gallery with lightbox |
| `/projects` | Large project cards with YouTube embeds |
| `/events` | Atom particle timeline with event modals |

## Setup

```bash
# Install dependencies
pnpm install

# Run development server
pnpm dev

# Build for production
pnpm build

# Preview production build
pnpm preview
```

## Deployment to Vercel

1. Push to GitHub
2. Import repo in Vercel dashboard
3. Framework: **Vite**
4. Build command: `pnpm build`
5. Output directory: `dist`
6. Deploy

The included `vercel.json` handles SPA routing rewrites automatically.

## Customization

All personal data is in `/src/data/mockup.ts` — replace with real data or connect to Convex.

To change the theme, edit CSS variables in `/src/style/global.css` under `:root`.

## Connecting Convex (Production)

1. Install: `pnpm add convex`
2. Initialize: `npx convex dev`
3. Replace mockup data imports with Convex queries
4. Add `VITE_CONVEX_URL` to Vercel environment variables

---

Built with discipline. Designed with intention.
