---
name: glouglou_project_context
description: GlouGlou5 nightlife events scraper project — full stack Python/React for Annecy and multi-city nightlife data collection
metadata: 
  node_type: memory
  type: project
  originSessionId: 22950ea2-af48-41c2-8054-4983bf7efa54
---

# GlouGlou5 Project Context

**Repo**: https://github.com/bizc0m/GlouGlou5  
**Current Location**: `/Users/JOB/###DEV/Claude/GlouGlou5`

## What Is GlouGlou5?

Multi-city nightlife events scraper: collects event data, venues, and sources from public websites and aggregates into a unified API. Serves a React frontend ("Urgence Party" / "Urgence GlouGlou").

## Tech Stack

- **Frontend**: React (Create React App + Craco) in `/frontend`
- **Backend**: Python Flask in `/backend` (serves `/api/` endpoints)
- **Data**: JSON files per city in `/backend/cities/*.json`
- **Deploy**: Vercel (front), bon-french.emergent.host (back)
- **Scripts**: Node/Python helpers in `/scripts`

## Key Data Files

- `frontend/src/data/annecyIntelSources.js` — **source registry** (137 sources total) with categories: agenda, venue, official, tourism, region, social
- `backend/cities/annecy.json` — event/venue data for Annecy
- `memory/SESSION_LOG.md` — detailed work history
- `progress.md` — task log with timestamps (V9.79 as of 2026-05-11)
- `AGENTS.md` — agent specs for scraping/cartography work

## Annecy Sources (Latest Addition)

**2026-05-19**: Added 42 new Annecy sources to enrich content:
- Official sites: `annecy.fr`, `annecy-ville.fr`, etc.
- Venues: Bonlieu, Théâtre des Collines, Universe, Le Pop, Casino, La Jungle, Ice Cream, etc.
- Agendas: Eventbrite, Songkick, Info Concert, Fest, JDS, etc.
- Tourism: tourisme-annecy.net, haute-savoie-tourisme.org
- Region: 10 communes voisines (Sevrier, Faverges, Saint-Jorioz, etc.)
- Facebook: 11 official pages + 2 groups

**Total Annecy sources**: 137 (was 95 before)

## Recent Work (2026-05-08 onwards)

- Stabilized V6 API with multi-city support
- Fixed broken links, local fallbacks for geoloc
- Beta Vercel deployment at `urgence-v5-beta.vercel.app`
- Added OAuth providers (Google, Apple, Facebook, Slack)
- Hardcoded Annecy Intel data from HTML dump (47 events, 30 venues)
- QA testing of routes, links, pagination

## Common Commands

```bash
cd frontend && npm install && npm start       # Dev server localhost:3000
cd backend && python3 app.py                  # Backend API localhost:5000
python3 scripts/local_spa_server.py           # Fallback SPA + API proxy
rtk npm run build                             # Frontend build (use rtk)
rtk cargo test / jest / pytest                # Run tests (use rtk)
git status, git log                           # Use rtk prefix
```

## Key Files by Role

- **Frontend devs**: `/frontend/src/` (React components, data/)
- **Backend devs**: `/backend/` (Flask routes, cities JSON)
- **Data cartographers**: `annecyIntelSources.js`, AGENTS.md
- **DevOps**: `cloudflare/` (Workers), Vercel config, scripts/
- **QA**: `docs/VERIFICATION_CHECKLIST.md`, `/qa` route

## Known Issues & TODOs

- Path has spaces (`###DEV`) → build warning (not critical)
- DB not yet persistent (data in JSON files)
- CRA → Vite migration planned separately
- Need full URL audit of real links (many were placeholder domains)

## Coordination

- Slack integration: `scripts/slack_order_loop.py` (watches `#glouglou` channel)
- Inter-chat sync: `SYNC.md` for prompt sharing
- Versioning: stored in `progress.md` and `AGENTS.md`
