# Roadmap

Two-week sprints, from 30 November 2026 to 31 October 2027.

- **Months 1–6 (Sprints 1–12): Android app**, ending with the v1.0 Play Store release.
- **Months 7–12 (Sprints 13–24): Web app**, with the same Flutter codebase made responsive, plus landing pages, admin tools and the web launch.

Each sprint is a GitHub milestone, and every story is an issue with acceptance criteria and story points. Capacity is planned at about 12 points per sprint (part-time), and Sprint 3 is lighter because of the holidays.

| Sprint | Dates | Phase | Goal | Points |
|---|---|---|---|---|
| 1 | 30 Nov 2026 – 13 Dec 2026 | Android app | Foundations: theme, navigation, signing, Supabase | 14 |
| 2 | 14 Dec 2026 – 27 Dec 2026 | Android app | Quiz: questions and the quiz flow | 12 |
| 3 | 28 Dec 2026 – 10 Jan 2027 | Android app | Matching engine (light sprint over the holidays) | 8 |
| 4 | 11 Jan 2027 – 24 Jan 2027 | Android app | Results: top matches, consent, analytics | 12 |
| 5 | 25 Jan 2027 – 07 Feb 2027 | Android app | Accounts: sign-in and saving progress | 13 |
| 6 | 08 Feb 2027 – 21 Feb 2027 | Android app | Role explorer: overview, taster, skills check | 13 |
| 7 | 22 Feb 2027 – 07 Mar 2027 | Android app | Learning plan | 13 |
| 8 | 08 Mar 2027 – 21 Mar 2027 | Android app | Learn by building: open-source and own-idea routes | 13 |
| 9 | 22 Mar 2027 – 04 Apr 2027 | Android app | Progress: dashboard, check-ins, reminders | 13 |
| 10 | 05 Apr 2027 – 18 Apr 2027 | Android app | Portfolio and qualifications | 13 |
| 11 | 19 Apr 2027 – 02 May 2027 | Android app | Opportunities and closed testing | 12 |
| 12 | 03 May 2027 – 16 May 2027 | Android app | Android v1.0 release | 14 |
| 13 | 17 May 2027 – 30 May 2027 | Web app | Web foundations: deploys, responsive layout, routing | 12 |
| 14 | 31 May 2027 – 13 Jun 2027 | Web app | Responsive quiz and results | 11 |
| 15 | 14 Jun 2027 – 27 Jun 2027 | Web app | Web accounts and cross-device sync | 11 |
| 16 | 28 Jun 2027 – 11 Jul 2027 | Web app | Responsive plan and dashboard | 11 |
| 17 | 12 Jul 2027 – 25 Jul 2027 | Web app | Landing page and public role pages | 12 |
| 18 | 26 Jul 2027 – 08 Aug 2027 | Web app | Jobs board on web | 11 |
| 19 | 09 Aug 2027 – 22 Aug 2027 | Web app | Community and mentors | 12 |
| 20 | 23 Aug 2027 – 05 Sep 2027 | Web app | Admin content tools | 13 |
| 21 | 06 Sep 2027 – 19 Sep 2027 | Web app | Quality: accessibility, performance, end-to-end tests | 13 |
| 22 | 20 Sep 2027 – 03 Oct 2027 | Web app | Growth and experiments | 11 |
| 23 | 04 Oct 2027 – 17 Oct 2027 | Web app | Public web beta | 11 |
| 24 | 18 Oct 2027 – 31 Oct 2027 | Web app | Web v1.0 launch and retrospective | 9 |

## Epics

- **Foundations** (`epic: foundations`): Project setup, design system, navigation, CI/CD and backend environments.
- **Clarity quiz** (`epic: quiz`): The 8-question quiz that captures a switcher's background, tasks, interests and constraints.
- **Role matching** (`epic: matching`): Turning quiz answers into ranked, explained role matches with honest pay and timelines.
- **Accounts and privacy** (`epic: accounts`): Sign-in, saving progress, POPIA consent and data rights.
- **Role explorer** (`epic: roles`): Role overview, 1-week taster and skills check, so people learn before they commit.
- **Learning plan** (`epic: plan`): A weekly plan built from the chosen role, current skills and available hours.
- **Learn by building** (`epic: build`): Open-source and own-idea project routes that produce real portfolio evidence.
- **Progress and habits** (`epic: progress`): Home dashboard, journey tracker, weekly check-ins and reminders.
- **Portfolio and qualifications** (`epic: portfolio`): GitHub polish, CV, certificates and free open-source alternatives.
- **Opportunities** (`epic: opportunities`): Jobs from public ATS APIs, programmes such as WeThinkCode_, and application tracking.
- **Growth and community** (`epic: growth`): Hired flow, sharing, referrals, mentors and success stories.
- **Web platform** (`epic: web`): Responsive Flutter web app, deploys, routing, SEO and web performance.
- **Admin tools** (`epic: admin`): Managing roles, salaries and quiz content without code changes.
- **Release and launch** (`epic: launch`): Store listing, testing rounds, releases, monitoring and launch.

## Stories by sprint

### Sprint 1: Foundations: theme, navigation, signing, Supabase

- Verify the repo, CI pipeline and branch protection (2 pts, Foundations)
- Design system: theme and shared widgets match Figma (3 pts, Foundations)
- Release signing and Play internal testing track (5 pts, Foundations)
- Supabase project and environment config (2 pts, Foundations)
- App navigation with go_router (2 pts, Foundations)

### Sprint 2: Quiz: questions and the quiz flow

- Quiz question model and content file (3 pts, Clarity quiz)
- Welcome screen buttons lead into the app (1 pts, Clarity quiz)
- Quiz flow: one question per screen with progress (5 pts, Clarity quiz)
- Write quiz questions 3-8 (3 pts, Clarity quiz)

### Sprint 3: Matching engine (light sprint over the holidays)

- Role catalogue with honest pay and timelines (3 pts, Role matching)
- Scoring engine: answers become ranked matches (5 pts, Role matching)

### Sprint 4: Results: top matches, consent, analytics

- Top matches screen (3 pts, Role matching)
- 'Why you fit' explanations (2 pts, Role matching)
- POPIA consent and privacy notice (3 pts, Accounts and privacy)
- Quiz funnel analytics with PostHog (2 pts, Foundations)
- Crash reporting with Sentry (2 pts, Foundations)

### Sprint 5: Accounts: sign-in and saving progress

- Sign up and sign in with email (5 pts, Accounts and privacy)
- Sign in with Google (3 pts, Accounts and privacy)
- Save quiz results and chosen role (3 pts, Accounts and privacy)
- Guest mode, then save later (2 pts, Accounts and privacy)

### Sprint 6: Role explorer: overview, taster, skills check

- Role overview screen (3 pts, Role explorer)
- 1-week taster (5 pts, Role explorer)
- Skills check (3 pts, Role explorer)
- Compare two roles (2 pts, Role explorer)

### Sprint 7: Learning plan

- Generate a learning plan (5 pts, Learning plan)
- Learning plan screen (3 pts, Learning plan)
- Set and change my weekly hours (2 pts, Learning plan)
- Free learning resources for each task (3 pts, Learning plan)

### Sprint 8: Learn by building: open-source and own-idea routes

- Choose a building route (2 pts, Learn by building)
- Own-idea route: project templates (3 pts, Learn by building)
- Open-source route: beginner-friendly issues (5 pts, Learn by building)
- Track my project and link the repo (3 pts, Learn by building)

### Sprint 9: Progress: dashboard, check-ins, reminders

- Home dashboard with journey tracker (5 pts, Progress and habits)
- Weekly check-in and plan adjustment (3 pts, Progress and habits)
- Reminders with OneSignal (3 pts, Progress and habits)
- Weekly summary (2 pts, Progress and habits)

### Sprint 10: Portfolio and qualifications

- GitHub profile checklist (3 pts, Portfolio and qualifications)
- Qualifications guide with a free alternative (3 pts, Portfolio and qualifications)
- Track certificate progress and exam date (2 pts, Portfolio and qualifications)
- CV builder from my projects (5 pts, Portfolio and qualifications)

### Sprint 11: Opportunities and closed testing

- Jobs feed from public ATS job boards (5 pts, Opportunities)
- Programmes and learnerships, including WeThinkCode_ (3 pts, Opportunities)
- Play Store listing, data safety and privacy policy (2 pts, Release and launch)
- Start the 14-day closed test with 12+ testers (2 pts, Release and launch)

### Sprint 12: Android v1.0 release

- Save jobs and track applications (3 pts, Opportunities)
- 'I got the job' flow and sharing (3 pts, Growth and community)
- Accessibility pass on Android (3 pts, Release and launch)
- Fix the top issues from the closed test (3 pts, Release and launch)
- Android v1.0.0 production release (2 pts, Release and launch)

### Sprint 13: Web foundations: deploys, responsive layout, routing

- Web deploys with pull request previews (3 pts, Web platform)
- Responsive layout system (5 pts, Web platform)
- Web URLs and deep links (3 pts, Web platform)
- Pick and connect a domain (1 pts, Web platform)

### Sprint 14: Responsive quiz and results

- Quiz on desktop with keyboard support (5 pts, Web platform)
- Responsive results and role pages (3 pts, Web platform)
- SEO basics and web analytics (3 pts, Web platform)

### Sprint 15: Web accounts and cross-device sync

- Sign in on the web (3 pts, Accounts and privacy)
- Progress syncs between phone and web (5 pts, Accounts and privacy)
- Export and delete my data (3 pts, Accounts and privacy)

### Sprint 16: Responsive plan and dashboard

- Responsive learning plan (3 pts, Learning plan)
- Responsive home dashboard (3 pts, Progress and habits)
- Email check-ins and reminders for web users (5 pts, Progress and habits)

### Sprint 17: Landing page and public role pages

- Public landing page (5 pts, Web platform)
- Public role pages that Google can index (5 pts, Web platform)
- Referral links (2 pts, Growth and community)

### Sprint 18: Jobs board on web

- Jobs board with filters on the web (5 pts, Opportunities)
- Job detail and apply tracking (3 pts, Opportunities)
- Alerts for new matching jobs (3 pts, Opportunities)

### Sprint 19: Community and mentors

- Mentor directory (5 pts, Growth and community)
- Request a mentor chat safely (5 pts, Growth and community)
- Success stories page (2 pts, Growth and community)

### Sprint 20: Admin content tools

- Admin role and protected admin area (3 pts, Admin tools)
- Manage roles, pay and timelines (5 pts, Admin tools)
- Manage quiz questions with versions (5 pts, Admin tools)

### Sprint 21: Quality: accessibility, performance, end-to-end tests

- WCAG 2.1 AA audit and fixes on the web (5 pts, Web platform)
- Web performance (5 pts, Web platform)
- End-to-end tests for the core journey in CI (3 pts, Release and launch)

### Sprint 22: Growth and experiments

- A/B test the quiz intro (3 pts, Growth and community)
- Impact funnel dashboard (3 pts, Growth and community)
- Programme deadlines and reminders (3 pts, Opportunities)
- Load test Edge Functions and caching (2 pts, Foundations)

### Sprint 23: Public web beta

- Public web beta with a feedback widget (3 pts, Release and launch)
- Fix the top beta issues (5 pts, Release and launch)
- Security review (3 pts, Release and launch)

### Sprint 24: Web v1.0 launch and retrospective

- Web v1.0 launch (3 pts, Release and launch)
- Monitoring and alerts (2 pts, Release and launch)
- Launch announcement and demo video (2 pts, Growth and community)
- 12-month retrospective and next roadmap (2 pts, Release and launch)
