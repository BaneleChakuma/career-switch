# Career Switch

Helps people switch into tech. A short clarity quiz finds the tech roles that use what someone already knows, then the app guides them through tasting a role, learning by building real projects, polishing their GitHub, getting qualified (or a free open-source alternative) and applying for their first job.

Built with **Flutter** (Android first, then web) and **Supabase**.

## The journey

1. **Clarity quiz:** 8 questions about your current job, tasks, interests and time.
2. **Best-fit roles:** ranked matches with honest South African pay ranges and time to hire.
3. **Taster and skills check:** try the work for a week and rate what you already know.
4. **Learn by building:** an open-source route or an own-idea route.
5. **Portfolio and qualifications:** a GitHub checklist, a CV, and certificates with free alternatives.
6. **Apply:** jobs from public company job boards, plus programmes such as WeThinkCode_.
7. **Hired:** celebrate, share, and mentor the next person.

## Project plan

- [Roadmap](docs/ROADMAP.md): 24 two-week sprints, Android app first (months 1–6), then the web app (months 7–12)
- [CI/CD](docs/CI_CD.md): what runs on each pull request, tag and merge, and which secrets are needed
- [Contributing](CONTRIBUTING.md): branching, commits and the Definition of Done
- Issues are user stories, milestones are sprints, and labels mark the epic, area and story points.

## Run it locally

```bash
flutter pub get
flutter run            # Android device or emulator
flutter run -d chrome  # web
flutter test           # unit and widget tests
```

Backend keys are passed at build time and are never committed:

```bash
flutter run --dart-define=ENV=dev --dart-define=SUPABASE_URL=... --dart-define=SUPABASE_ANON_KEY=...
```

## Design

The wireframes are in Figma (9 screens with a clickable prototype). The app uses a minimalist style with a single growth-teal accent (`#0F766E`).
