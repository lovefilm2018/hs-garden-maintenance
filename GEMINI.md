# GEMINI.md — H S Garden Maintenance Specification
> **Operational Partnership Rules:** All AI agents operating in this workspace (Antigravity CLI or Gemini CLI) must strictly adhere to the operational rules, pre-deployment summaries, and instant audit logging defined in [AGENTS.md](AGENTS.md).

---

## 1. Project Overview & Business Identity
- **Business Name:** H S Garden Maintenance
- **Proprietor / Client:** Hayden Swan
- **Phone:** `07714 415606`
- **Location & Base:** Heathfield, East Sussex (TN21) — serving Heathfield, Cross in Hand, Horam, Hailsham, Uckfield, Mayfield, and surrounding East Sussex communities.
- **Official Domain:** `https://hsgardenmaintenance.co.uk`
- **Official Socials:** [Facebook Page](https://www.facebook.com/H-S-Gardening-maintenance-315414229382232)
- **Core Value Proposition:** Highly dependable, expert domestic and commercial grounds care, paddock mowing, precision hedge trimming, tree management, and seasoned firewood deliveries across the High Weald and East Sussex.

---

## 2. Core Service Offerings
1. **Lawn Care & Paddock Mowing (`grass-cutting.html`):**
   - Domestic lawn mowing, precision edging, commercial grounds maintenance, large-area paddock mowing, and ride-on field maintenance.
2. **Hedge Cutting & Reduction (`hedges.html`):**
   - Formal hedge trimming, boundary reductions, overgrown hedgerow restoration, and seasonal shaping.
3. **Tree Work & Management (`tree-work.html`):**
   - Crown lifting, pruning, limb clearance, storm damage clearing, and general tree maintenance.
4. **Seasoned Firewood & Log Deliveries (`logs.html`):**
   - Locally sourced, seasoned hardwood and softwood logs delivered direct to homes across East Sussex.

---

## 3. Tech Stack & Architecture
- **Frontend Core:** Pure Semantic HTML5, Modular CSS3 (`style.css`), Vanilla JavaScript (`script.js`). Zero heavy framework overhead, 100/100 Core Web Vitals speed.
- **Image Optimization:** High-fidelity, WebP compressed imagery organized by service category (`images/lawn/`, `images/hedge/`, `images/logs/`).
- **SEO & Structured Data:**
  - Semantic Local Business Schema (`GardeningService` JSON-LD) with geo-coordinates (`50.9686, 0.2524`), opening hours, and direct tel links.
  - Complete `sitemap.xml` and `robots.txt`.
  - Canonical tags and Open Graph metadata configured for `hsgardenmaintenance.co.uk`.
- **Version Control & GitHub Remote:**
  - Repository: `https://github.com/lovefilm2018/hs-garden-maintenance.git`
  - Default Branch: `main`

---

## 4. Directory Schema
```text
HSGardenMaintenance/
├── GEMINI.md                           # Technical specification & project truth (this file)
├── AGENTS.md                           # Operational rules & human-AI partnership protocol
├── index.html                          # Homepage & master service overview
├── grass-cutting.html                  # Lawn care & paddock mowing service page
├── hedges.html                         # Hedge cutting & reduction service page
├── tree-work.html                      # Tree work & arb care service page
├── logs.html                           # Seasoned firewood delivery service page
├── style.css                           # Master responsive styling & layout
├── script.js                           # Navigation toggle, lazy loading, interactive logic
├── sitemap.xml                         # Search engine sitemap
├── robots.txt                          # Crawler indexing instructions
├── favicon.ico                         # Favicon
├── AGY_HSGardenMaintenance.bat         # Antigravity CLI launcher (Medium Effort)
├── CLI_HSGardenMaintenance.bat         # Gemini CLI Flash Lite launcher
├── IDE_HSGardenMaintenance.bat         # Antigravity IDE launcher
└── images/                             # WebP imagery asset catalog
    ├── Cover.JPG                       # Hero banner asset
    ├── logo.png                        # Brand logo
    ├── drone.mp4                       # Aerial footage
    ├── hedge/                          # Hedge work gallery (hedge1 - hedge28)
    ├── lawn/                           # Lawn & paddock gallery (lawn1 - lawn53)
    └── logs/                           # Log delivery gallery (logs1 - logs17)
```

---

## 5. Master Asset Pipeline & Google Drive Integration
- **Client Drive Assets:** `H:\My Drive\TotalBiz\Hayden swan\HSGardenMaintenance`
- **High-Res Source Photography:**
  - `H  S Garden Maintenance\New pics 2026 for website` (90+ high-res iPhone/HEIC & JPG shots)
  - `H S Logs` (Log delivery and timber stock imagery)
- **Project Brief:** `HS Garden New Website Brief.gdoc`
- **Quotation Ledger:** `G:\My Drive\Personal\H S Gardening Maintenance Quotation.gdoc`

---

## 6. Triple Launcher & Workspace Architecture
In accordance with Operations HQ standards, all 3 launcher scripts reside directly inside the workspace root:
- **`AGY_HSGardenMaintenance.bat`:** Launches Antigravity CLI with `--effort medium` and multi-directory access to the central usage audit (`C:\Users\TotalBiz\Documents\AI_Usage_Audit`).
- **`CLI_HSGardenMaintenance.bat`:** Launches Gemini CLI on `gemini-3.5-flash-lite` for free-tier edits.
- **`IDE_HSGardenMaintenance.bat`:** Opens Antigravity IDE scoped to this workspace.
- **Desktop Shortcuts (`C:\Users\TotalBiz\Desktop`):**
  - `AGY_HSGardenMaintenance.lnk` (Custom Bing-palette `HS_AGY.ico`)
  - `CLI_HSGardenMaintenance.lnk` (Custom Bing-palette `HS_CLI.ico`)
  - `Antigravity IDE (HSGardenMaintenance).lnk` (Official IDE icon)

---

## 7. Dedicated Spin-Off Website: H S Logs
- **Rationale:** Hayden Swan requested separating the firewood & log delivery business into a standalone brand and web presence while preserving `logs.html` on the parent site.
- **Repository:** `https://github.com/lovefilm2018/hslogs.git`
- **Local Workspace:** `C:\Users\TotalBiz\Documents\HSLogs`
- **Official Domain Target:** `https://hslogs.co.uk`
- **Cross-Linking:** Both sites include sister-service banner cross-links for maximum SEO synergy and seamless customer navigation.
