# Sprint 01 brief: Foundations

**Dates:** Mon 30 Nov – Sun 13 Dec 2026 · **Milestone:** `Sprint 01 · Android app · Foundations` · **Points:** 14
**Sprint goal:** a clean, protected repo; the app's look matching Figma; navigation between all screens; a dev backend; and a tagged build reaching Play internal testing.

## Where things stand (26 Nov 2026)

Done already:
- Repo, Flutter scaffold (`android/`, `web/`), theme tokens, `PrimaryButton`, `SecondaryButton`, `AnswerOption` and the Welcome screen, with 2 passing widget tests.
- CI is green on `main` (format, analyze, tests, debug APK, web build). The release and web-deploy workflows exist but need secrets.
- 24 sprint milestones, 88 stories and 14 epics, all assigned to Banele. Project board at https://github.com/users/BaneleChakuma/projects/7, with Sprint 01's five stories in the **Sprint** column.
- Figma wireframes and a clickable prototype (file `RkN5q9DKLiQih0TD7X0x1g`).

Not done (needs Banele in a browser):
- Branch protection on `main` (#2).
- Linking the project board to the repo (repo → Projects → Link a project).
- 5 open Dependabot PRs (#1, #3, #5, #7, #31). They failed CI only because they were based on old code.

## Suggested order

1. **#2** first (half a day): it unblocks working safely in PRs.
2. **Kick off the Play Console part of #6 on day 1**, even though the coding is last. Creating the app and service account can take time on Google's side.
3. **#4** next: every later screen uses these widgets.
4. **#9**: depends on #4's placeholder screens looking right.
5. **#8**.
6. Finish **#6** by tagging `v0.1.0` at the end of the sprint. That's the sprint demo: the app installs from Play internal testing on Banele's phone.

---

## #2 Verify the repo, CI pipeline and branch protection (2 pts)

How I'd do it:
- `git clone`, `flutter pub get`, `flutter run` on a phone. Confirm the Welcome screen shows.
- **Dependabot PRs:** comment `@dependabot rebase` on each. Once CI is green, they're safe to merge. They're GitHub Actions major bumps (`checkout`, `upload-artifact`, `setup-java`, `action-gh-release`) plus `cupertino_icons` 2.0 (the app barely uses Cupertino icons). Read each changelog headline first; merge them one at a time.
- **Branch protection** (Banele, in the browser): Settings → Branches → Add rule for `main`:
  - require a pull request (0 approvals is fine for a solo project)
  - require status checks: `Format, analyze and test`, `Build Android (debug APK)`, `Build web`
  - require branches to be up to date; block force pushes and deletion
- Settings → General → Pull Requests: allow **squash merging** only and tick **Automatically delete head branches**.
- Board: it already exists, so tick that task and link it to the repo.
- Check that the bootstrap workflow is gone. It is: it was deleted in `7397c24`.

Claude Code can't change repo settings for you. Give Banele the click path, then verify with `gh api repos/BaneleChakuma/career-switch/branches/main/protection`.

## #4 Design system: theme and shared widgets match Figma (3 pts)

How I'd do it:
- Pull the components from Figma with the Figma MCP (`get_design_context` on the Components frame). Match radius 14, button height 52, option padding 16/14, 2px teal border when selected, and a 1px `#D1D5DB` border otherwise.
- **Font:** the wireframes use **Inter**. Bundle it rather than using `google_fonts`, so it works offline and testers on bad connections see no font swap. Download the Inter variable font (OFL licence, from the official `rsms/inter` GitHub releases) into `assets/fonts/`, declare it in `pubspec.yaml`, and set `fontFamily: 'Inter'` in `AppTheme`.
- Add `AppCard` (padding 16, radius 16, 1px border; a `highlight` flag for the teal variant) and `ProgressBar` (8px track, rounded, `value` 0–1, `Semantics` with "n of m" or a percentage).
- Add a **widget gallery** screen, shown only when `kDebugMode` is true, that renders every widget in every state. It helps with visual checks now and future Figma comparisons.
- **Tests:**
  - a widget test per widget (renders, taps, selected state, semantics)
  - a **text-scale test** that pumps each widget inside `MediaQuery(data: MediaQueryData(textScaler: TextScaler.linear(2)))` and asserts no overflow errors (`tester.takeException()` is null)
  - optional: golden tests with `matchesGoldenFile`. If you add them, generate goldens on Linux CI only, because fonts render differently per OS.

## #9 App navigation with go_router (2 pts)

How I'd do it:
- Add `go_router` (check the current major version and API in Context7 first).
- `lib/router/app_router.dart` with a `Routes` class of path constants (`/`, `/quiz/:step`, `/matches`, `/roles/:slug`, `/skills`, `/plan`, `/home`, `/check-in`, `/sign-in`), and `MaterialApp.router` in `app.dart`.
- Use simple placeholder screens (title plus a "Next" button) for screens built in later sprints. Name them after the Figma frames.
- Use path-style routes now, even though the web comes later. It saves a refactor in Sprint 13.
- Wire the Welcome buttons: "Start the quiz" → `/quiz/1`; "I already have an account" → `/sign-in`. That covers most of Sprint 2's story #11 "Welcome screen buttons lead into the app". Mention it in #11 instead of closing it early.
- **Tests:** pump the app with the real router, tap through Welcome → Quiz, and check that `Navigator.pop`/back returns. Also add a unit test that every route constant is registered.
- Leave the bottom navigation (`StatefulShellRoute`) for Sprint 9. Don't build it now.

## #8 Supabase project and environment config (2 pts)

**Ask Banele before creating the projects** (it's free tier, but they're his accounts).

How I'd do it:
- Create two projects, `career-switch-dev` and `career-switch-prod`. Supabase has no African region, so pick **EU (London or Frankfurt)** for the lowest latency from South Africa. Note this in `docs/privacy-notes.md`: storing data outside South Africa matters for the POPIA consent story in Sprint 4.
- In the repo: `supabase init` to get a `supabase/` folder for migrations and Edge Functions, and commit it.
- Config: use `--dart-define-from-file=env/dev.json` instead of many `--dart-define` flags.
  - Commit `env/example.json` with empty values; add `env/*.json` (except `example.json`) to `.gitignore`.
  - `lib/config/env.dart` reads `String.fromEnvironment('SUPABASE_URL')` etc. and throws a clear error if they're missing in a non-test build.
- Add `supabase_flutter`. Initialise it in `main()` before `runApp`, behind an interface (`BackendClient`) so widget tests don't need a network.
- **Smoke test:** a debug-only check at start-up that calls `auth.getSession()` and logs the result (no tables exist yet).
- **CI:** add `SUPABASE_URL_DEV` and `SUPABASE_ANON_KEY_DEV` as repo secrets. Have the build jobs write `env/dev.json` from them before building.
- Use the Supabase MCP for project setup and checks on **dev only**.

## #6 Release signing and Play internal testing track (5 pts)

This story has the most outside setup. Banele does the Play Console steps; Claude Code does the Gradle and CI side.

**Confirm the package name first:** `za.co.careerswitch.career_switch`. It **can never change** after the first upload. If Banele owns a domain or prefers something like `com.banelechakuma.careerswitch`, change it now in `android/app/build.gradle.kts` (`namespace` and `applicationId`), move `MainActivity.kt` to the matching folder, and update `release-android.yml` (`packageName`).

Steps:
1. **Play Console (Banele):** Create app → name "Career Switch", app, free, accept the declarations. Set up Play App Signing (Google holds the app signing key; you keep an **upload** key).
2. **Upload key (Banele, locally):**
   ```bash
   keytool -genkey -v -keystore ~/upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload
   base64 -w 0 ~/upload-keystore.jks > ~/upload-keystore.b64
   ```
   Keep the `.jks` and its passwords in a password manager plus one offline backup. Never put them in the repo.
3. **Gradle (Claude Code):** make `android/app/build.gradle.kts` read `android/key.properties` when it exists and fall back to debug signing when it doesn't, so CI's debug builds and local runs keep working:
   ```kotlin
   import java.io.FileInputStream
   import java.util.Properties

   val keystoreProperties = Properties()
   val keystorePropertiesFile = rootProject.file("key.properties")
   if (keystorePropertiesFile.exists()) {
       keystoreProperties.load(FileInputStream(keystorePropertiesFile))
   }

   android {
       // ...
       signingConfigs {
           create("release") {
               keyAlias = keystoreProperties["keyAlias"] as String?
               keyPassword = keystoreProperties["keyPassword"] as String?
               storeFile = (keystoreProperties["storeFile"] as String?)?.let { file(it) }
               storePassword = keystoreProperties["storePassword"] as String?
           }
       }
       buildTypes {
           release {
               signingConfig = if (keystorePropertiesFile.exists())
                   signingConfigs.getByName("release")
               else
                   signingConfigs.getByName("debug")
           }
       }
   }
   ```
   `release-android.yml` already writes `key.properties` with `storeFile=upload-keystore.jks`, which resolves to `android/app/upload-keystore.jks`.
4. **Secrets (Banele):** `ANDROID_KEYSTORE_BASE64`, `ANDROID_KEYSTORE_PASSWORD`, `ANDROID_KEY_ALIAS` (`upload`) and `ANDROID_KEY_PASSWORD`, under Settings → Secrets and variables → Actions.
5. **First upload by hand:** run the Release Android workflow manually (`gh workflow run release-android.yml`), download the `.aab` artifact or release asset, and upload it to **Internal testing** in Play Console. Google requires the first upload to be manual.
6. **Service account for automatic uploads:**
   - Google Cloud console: create a service account and a JSON key.
   - Play Console → Users and permissions: invite the service account's email with release permissions for this app.
   - Save the JSON as the `PLAY_SERVICE_ACCOUNT_JSON` secret.
7. **Prove it:** bump `version:` in `pubspec.yaml` to `0.1.0+1`, merge, then `git tag v0.1.0 && git push origin v0.1.0`. The workflow should create a GitHub Release and push a draft to Internal testing. Add Banele's email as an internal tester and install it on his phone.

Watch out for:
- `versionCode` comes from `--build-number=${{ github.run_number }}`, so it always goes up. Don't hand-edit it.
- If Play rejects the upload with "signed with the wrong key", the upload key doesn't match the one registered with Play App Signing. Reset it in Play Console rather than making a new app.
- Internal testing needs no review and is instant. Closed testing (Sprint 11) does go through review.

---

## End of sprint (Sun 13 Dec)

- **Demo:** install from Play internal testing, tap Welcome → quiz placeholder → back, and open the widget gallery in a debug build.
- **Review:** tick acceptance criteria in each issue and close the stories (PRs with `Closes #n` do this on merge). Move anything unfinished to Sprint 02 with a one-line reason.
- **Retro:** add 3 lines to the Sprint 01 milestone description (keep, change, try).
- On the board's "Current sprint" view, change the filter to `milestone:"Sprint 02 · Android app · Quiz"`, click **Save**, and move Sprint 02's stories to **Sprint**.
- Write `docs/handoff/sprint-02.md` in the same style for the next session.
