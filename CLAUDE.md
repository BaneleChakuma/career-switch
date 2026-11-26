# CLAUDE.md: working on career-switch

Read this first. It's the standing brief for any Claude session working in this repo. Usually that's the Claude CLI (`claude`) running in VS Code's integrated terminal. The current sprint's detailed brief is in `docs/handoff/`. Start with the newest file there.

## What this is

A Flutter app (Android first, web later) that helps people switch into tech. Flow: clarity quiz → best-fit roles → taster and skills check → learning plan → learn by building → portfolio and qualifications → apply → hired, share and mentor.

- Owner and only developer: **Banele Chakuma** (`@BaneleChakuma`), a WeThinkCode_ student doing a Flutter/Dart elective with unit testing. Explain *why* when you make a non-obvious choice; this is also a learning project.
- Stack: Flutter (stable), Dart 3, `material_ui`, Supabase (Postgres, Auth, Edge Functions in TypeScript), PostHog, Sentry, OneSignal, Vercel (web, from Sprint 13), GitHub Actions.
- Design: Figma file "Career Switch App — Wireframes" (`RkN5q9DKLiQih0TD7X0x1g`): 9 screens plus `Button/Primary`, `Button/Secondary` and `Option` components. It's minimalist with one accent colour, growth teal `#0F766E`.

## Planning lives on GitHub

- **Milestones = 2-week sprints.** Sprint 01 runs 30 Nov – 13 Dec 2026; 24 sprints end 31 Oct 2027. Sprints 1–12 are the Android app; 13–24 are the web app.
- **Issues = user stories**, each with acceptance criteria (Given/When/Then), tasks, `points: N`, `epic: X`, `phase: …` and `area: …` labels. All are assigned to `BaneleChakuma`. Epic issues (`type: epic`) link their stories.
- **Project board:** https://github.com/users/BaneleChakuma/projects/7 (Backlog → Sprint → In Progress → Review → Done). New open issues are added automatically. Closing an issue moves it to Done.
- Full plan: `docs/ROADMAP.md`. Ways of working and Definition of Done: `CONTRIBUTING.md`. CI/CD and secrets: `docs/CI_CD.md`.

## How to work a story

1. Read the issue (`gh issue view <n>`), including its acceptance criteria. Ask Banele if a criterion is ambiguous rather than guessing.
2. Branch: `story/<n>-short-name` from an up-to-date `main`.
3. Write the test first for logic (pure Dart, no Flutter imports where possible), then the code. Widgets get widget tests.
4. Before every commit, run what CI runs:
   ```bash
   dart format lib test
   flutter analyze
   flutter test
   ```
5. Commit with Conventional Commits (`feat:`, `fix:`, `test:`, `chore:`, `docs:`, `refactor:`), small and often.
6. Open a PR with `Closes #<n>`, fill in the PR template, and wait for green CI. Banele merges (squash). Don't merge your own PRs unless he says so.
7. Tick the acceptance-criteria checkboxes in the issue as you meet them, so the board reflects reality.

## Code conventions

- **Import Material from `package:material_ui/material_ui.dart`, never `package:flutter/material.dart`.** Current Flutter stable deprecates the old import, and `flutter analyze` fails CI on it.
- Colours, spacing and radii come only from `lib/theme/app_theme.dart` (`AppColors`, `AppSpacing`). No hex values or magic numbers in widgets.
- Reusable widgets go in `lib/widgets/`, named after their Figma component. Screens go in `lib/features/<feature>/`.
- Feature-first folders: `lib/features/<feature>/{data,domain,presentation}` once a feature has more than a screen.
- Content (quiz questions, roles, salaries, resources) is **data** in `assets/` (and later in Supabase), never hard-coded in widgets. It will change after tester feedback.
- Lints: `flutter_lints` plus single quotes, trailing commas, const where possible, declared return types (see `analysis_options.yaml`).
- Accessibility is part of done: semantics labels, 48dp touch targets, no overflow at 200% text scale.
- Secrets never go in git: pass them with `--dart-define` locally and GitHub secrets in CI. `.gitignore` already covers `key.properties`, `*.jks` and `.env`.

## Tools and connectors to use

Use the most specific tool available, roughly in this order. Run `/mcp` to see which MCP servers are connected in this session. If one you need is missing, ask Banele to add it (commands in `docs/handoff/README.md`) rather than working around it.

| Need | Use | Notes |
|---|---|---|
| Issues, PRs, milestones, CI runs | **`gh` CLI** (already authenticated on Banele's laptop) | `gh issue view`, `gh pr create`, `gh run watch`, `gh run view --log-failed` |
| Dart and Flutter analysis, pub, tests, hot reload | **Dart & Flutter MCP server** (`dart mcp-server`) | Better than parsing CLI output: it gives structured analyzer errors and package search, and can drive a running app |
| Up-to-date package docs (go_router, supabase_flutter, material_ui…) | **Context7 MCP** | Use it before writing code against any package API; Flutter has moved fast |
| Database, auth, Edge Functions, migrations | **Supabase MCP** | Use it on the **dev** project only. Schema changes always go in `supabase/migrations/` via `supabase migration new`, never ad-hoc SQL on prod |
| Designs | **Figma MCP** (`get_design_context`, `get_screenshot`) | File key `RkN5q9DKLiQih0TD7X0x1g`. Check widgets against the components page |
| Crashes (from Sprint 4) | **Sentry MCP** | |
| Analytics (from Sprint 4) | **PostHog MCP** | |
| Builds and releases | GitHub Actions (`ci.yml`, `release-android.yml`) | Bitrise and BrowserStack connectors exist on Banele's Claude account but aren't used in this repo. Don't add a second CI system |

## Things to know

- Banele works on a **Pop!_OS 22.04 laptop with 16 GB RAM and integrated graphics**. The Android emulator is slow there, so prefer a USB-connected phone (`flutter devices`) or `flutter run -d chrome` for quick UI checks.
- The `android/` and `web/` folders were generated by `flutter create` in CI. Edit them normally now.
- `main` is meant to be protected (PR + green CI). Until Banele turns that on (story #2), still don't push straight to `main`.
- Google Play needs the **first** App Bundle uploaded by hand in Play Console before the release workflow's automatic upload can work.
- Play's closed testing rule: 12+ testers for 14 days before production. That's planned for Sprints 11–12.
