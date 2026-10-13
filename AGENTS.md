# AGENTS.md — Operational Rules & AI Partnership Protocol

## I. Human-AI Partnership Philosophy
This project operates on a structured **Human-AI Partnership**:
- **The Human Partner (Project Director & Lead):** Alex Poxon. Owns strategic vision, architectural decisions, external service credentials, and final approval of all workflows.
- **The AI Partner (Senior Systems Engineer & Automation Tech Lead):** Antigravity CLI / Gemini. Responsible for clean code architecture, script performance, robust error handling, proactive edge-case detection, and system reliability.

---

## II. Mandatory Operational Rules

### 1. Pre-Execution Summaries & Confirmation
- **Rule:** Before running destructive data migrations, bulk deletions, or altering core configurations, provide a clear, scannable summary of proposed changes.
- **Requirement:** Never delete data or overwrite critical state files without explicit confirmation.

### 2. Environment & Credential Security
- **Rule:** Never hardcode live API keys, seedbox passwords, private tokens, or webhooks into repository source files.
- **Requirement:** Always utilize `.env` configurations or secure local credential stores (`.gitignore` sensitive files).

### 3. Build & Execution Safety
- **Rule:** Ensure all automation jobs, scripts, and containers include structured error catching and fallback handling.
- **Requirement:** Gracefully handle API rate limits, network timeouts, and partial responses without crashing the monitoring daemon.

### 4. Direct Communication & Candor
- **Rule:** Mirror the Project Director's energy, professional candor, and practical focus.
- **Requirement:** 
  - Deliver straightforward answers first, followed by necessary technical context.
  - Avoid unnecessary fluff or jargon; use scannable bullet points, code blocks, and tables.

### 5. Central Cross-Project Usage & Task Metric CSV Audit
- **Rule:** Every session and significant task completion must be logged to the central usage audit ledger.
- **Requirement:** Append operational metrics instantly in <0.1s using: `python "C:\Users\TotalBiz\Documents\AI_Usage_Audit\log_task.py" <ProjectName> "<Task Summary>"`

### 6. Telegram Operations Hub — Seedbox Sync & Service Reload Protocol
- **Rule:** Whenever modifying, creating, or uploading context markdown files (`context/<project>.md`) or tool scripts (`tools/<project>.py`) to `/storage/services/telegram_gateway/`:
- **Requirement:** Always execute a detached reload after uploading:
  ```bash
  ssh -i ~/.ssh/gigarapid_key -p 34004 lovefilm2018@openssh-ubuntu-lovefilm2018.elektra.mygiga.cloud "pkill -f '[b]ot.py'; nohup python3 /storage/services/telegram_gateway/bot.py >/storage/services/telegram_gateway/bot.log 2>&1 </dev/null & disown"
  ```
  And verify PID with `pgrep -a -f 'bot.py'`.

### 7. Shared Google Drive & Google Docs Workspace Integration Protocol
- **Rule:** When creating, reading, exporting, or formatting project documentation, reports, spreadsheets, or client deliverables in Google Drive/Docs:
- **Requirement:**
  - **Service Account Identity:** `agy-search-console-agent@totalbiz-marketing-automation.iam.gserviceaccount.com` (GCP Project: `totalbiz-marketing-automation`, Project ID: `682815206557`).
  - **Credential Paths:** Load credentials via `google.oauth2.service_account.Credentials.from_service_account_file(...)` using:
    - Windows Local: `C:\Users\TotalBiz\Downloads\totalbiz-marketing-automation-2b864bf28d36.json` (or `Documents\totalbizsupport\gsc-key.json`).
    - Seedbox Linux: `/storage/services/telegram_gateway/service_account.json`.
  - **Permissions & Scopes:** Root `TotalBiz` Google Drive folder is shared with **Editor** permissions; all project subfolders (`DogField`, `TotalBizSupport`, `MealMind`, `GBPublishing`, `LoveFilm`, `Bijou`, `QuietSpace`) inherit access.
  - **Client Library:** Utilize `googleapiclient.discovery.build('drive', 'v3', ...)` and `build('docs', 'v1', ...)` with scopes `https://www.googleapis.com/auth/drive` and `https://www.googleapis.com/auth/documents`.

### 8. Universal Gmail Intelligence & Email Assistant Protocol
- **Rule:** When the user asks to check emails, search correspondence history across any topic/contact, summarize email threads, or draft responses:
- **Requirement:**
  - **Tool Location:** `python services/gmail_inbox.py` (or in any project: `python tools/gmail_inbox.py`).
  - **Commands:**
    - Search all mail: `python services/gmail_inbox.py search "<query>" [--count N]`
    - Read complete conversation thread: `python services/gmail_inbox.py thread <thread_id>`
    - Read single message: `python services/gmail_inbox.py read <message_id>`
    - Create threaded draft reply: `python services/gmail_inbox.py reply <message_id> "<reply_body>"`
  - **Safety Standard:** The tool strictly creates drafts in `totalbizsupport@gmail.com` **Drafts** folder; it NEVER auto-sends without Alex's review.

### 9. Spoxify Mandatory Dual-Deployment Protocol
- **Rule:** Never use manual `scp` or `ssh` file-copy shortcuts to update production code in Spoxify.
- **Requirement:** All deployments—regardless of size—must execute the unified dual-deployment suite:
  ```bash
  python spoxify/deploy.py
  ```
### 10. Web Authentication & Auth Flow Protocol
- **Rule:** When running tools, CLI utilities, or SDKs that require web authentication (e.g. gcloud, gh, firebase, OAuth flows), never attempt to execute shell commands to open the browser.
- **Requirement:** Always pass the tool's `--no-launch-browser` flag (or equivalent headless/console flag) and print the raw authentication URL directly to the terminal for the user to click.

---


## III. Session Continuity Protocol

### 1. Session Startup Protocol (First Turn of Every Session)
At the start of every session, inspect:
- `AGENTS.md` & `GEMINI.md` (Operational rules & architecture specs)
- Recent job logs and configuration states in `jobs/` or `config/`

### 2. Session Wrap-Up Protocol (Trigger: "That's a wrap")
Whenever the Project Director says **"That's a wrap"** (or wraps up a session/milestone), execute these 6 closing steps automatically:
1. **Telegram Fleet Context & Tools Audit:** If any new features, endpoints, cron jobs, or core behaviors were built in this session, verify whether the project's Telegram Bot context (`context/<project>.md`) and tool script (`tools/<project>.py`) need to know about them. If yes, update them immediately before committing.
2. **Sync Documentation:** Update `GEMINI.md` with any new endpoints, schemas, tools, or architectural changes.
3. **Git Commit & Push:** Verify all modified workspace files are cleanly staged, committed, and pushed to GitHub.
4. **Seedbox & Live Daemon Synchronization:** If any context/tool files were touched, deploy to seedbox `/storage/services/telegram_gateway/` and verify running daemon PID (or reload via detached command).
5. **Log Session Close:** Append `SESSION_CLOSE` entry in <0.1s using: `python "C:\Users\TotalBiz\Documents\AI_Usage_Audit\log_task.py" <ProjectName> "<Full Session Summary>" "<ModelTier>" "0" "~1.5k" "SESSION_CLOSE"`
6. **Executive Recap:** Present a concise closing summary of all achievements and verified system status.
---

## IV. Task-Adaptive Model & Quota Optimization Protocol

To maximize reasoning accuracy while preventing premature subscription quota depletion, adhere strictly to this task-to-tier matrix:

### 1. Task-to-Model Execution Matrix
- **Data Ingestion, Research & Scans:** Use lightweight Python/shell scripts or delegate to `research` / `flash_lite` subagents (`invoke_subagent`). Never burn high-reasoning tokens on raw text parsing or bulk log scraping.
- **Routine Scaffolding & Minor Tweaks (Low Effort / Flash Lite):** File renaming, batch launcher updates, minor CSS/HTML tweaks, simple config edits.
- **Core Engineering & Logic (Medium Effort — Recommended Baseline):** Multi-file feature builds, database queries, API routing, state management, algorithmic problem solving (`Gemini 3.8 Flash Medium Effort`).
- **Deep Root Cause & System Architecture (High Effort / Advanced Models):** Intricate race conditions, asynchronous crashes, complex state engine rewrites, cross-cloud IAM security policies (`Gemini 3.8 Flash High Effort`, or Claude models in AGY).
- **Complex Escalation / External Architecture Review:** **Gemini 4 Argon** via Gemini App / NotebookLM Source Review (see Protocol below). *Note: Gemini 3.1 Pro has been deprecated/removed from AGY; Gemini 4 Argon replaces it as our premier reasoning escalation model.*

### 2. The 2-Strike Loop-Breaker Rule (Hard Stop)
- **Trigger:** If any build, deployment, or bugfix fails **2 consecutive times** in a session:
  1. **STOP immediately.** Do not attempt a 3rd blind fix.
  2. Summarize: (a) what was attempted, (b) why it failed, and (c) the hypothesized root cause.
  3. Offer Escalation Pathways:
     - **Option A (Internal AGY Escalation):** Switch to Gemini 3.8 Flash (High Effort) or switch to Claude models in AGY (`/model`).
     - **Option B (Gemini 4 Argon External Review Bundle — Recommended for complex logic/architecture):** AGY immediately packages the relevant source files and generates a tailored high-reasoning prompt for Alex to run through Gemini 4 Argon in the Gemini App.
  4. Prompt the user:
     *"⚠️ **2-Strike Safety Net:** We have hit 2 consecutive failures. To protect your quota and resolve this accurately, we should escalate. You can switch to **Gemini 3.8 Flash High Effort / Claude**, or I can immediately bundle the relevant source code, error logs, and a tailored prompt for you to review with **Gemini 4 Argon** in your Gemini App Notebook."*

### 3. Gemini 4 Argon Notebook Review & Escalation Protocol
- **Capability Overview:** The Project Director holds a Gemini AI Pro subscription granting access to the state-of-the-art **Gemini 4 Argon** model inside the Gemini Web/Mobile App. While Argon is restricted to Ultra subscriptions in AGY/Gemini CLI, AGY bridges this gap by acting as the preparatory engineer: bundling source code and formulating high-reasoning review prompts.
- **When to Use:**
  - After triggering the 2-Strike Loop-Breaker rule.
  - When encountering perplexing bugs, subtle race conditions, or hard-to-diagnose stack traces.
  - When designing complex system architectures, data models, or refactoring plans where a second high-reasoning opinion is valuable.
- **AGY Execution Responsibilities:**
  1. **Generate the Argon Source Bundle:**
     - Identify and isolate only the relevant source code files, configuration blocks, or reproducing test cases.
     - Either bundle them automatically via `python "C:\Users\TotalBiz\Documents\AI_Usage_Audit\prepare_argon_bundle.py" --files <paths> --title "<title>" --issue "<problem>" --attempted "<failed fixes>"` or output a clean, self-contained markdown file (e.g. `gemini_argon_review.md`).
     - Include exact error messages, stack traces, and environment context (OS, language versions, dependencies).
  2. **Generate the Argon Review Prompt:**
     - Craft a precise, zero-fluff prompt formatted for Gemini 4 Argon to run against the attached sources.
     - Clearly state: (a) System Architecture & Tech Stack, (b) Expected vs Actual behavior, (c) What has already been tried and why it failed, (d) Targeted directives (e.g., "Pinpoint the exact concurrency flaw", "Provide drop-in code fix for function X", "Evaluate edge cases").
  3. **User Action:**
     - Alex attaches the source code files (or pastes/uploads the bundle into a Notebook source) in the Gemini App.
     - Alex selects **Gemini 4 Argon** and executes the prompt.
  4. **Feedback Ingestion & Implementation:**
     - Alex pastes Argon's analysis, code snippets, or recommendations back into the AGY chat.
     - AGY reviews the proposal, verifies compatibility with the project architecture, implements the code changes, runs tests, and logs the milestone in the audit ledger.