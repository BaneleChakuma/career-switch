# CI/CD

## Workflows

| Workflow | Runs on | What it does |
|---|---|---|
| `ci.yml` | Every pull request and push to `main` | Format check, `flutter analyze`, tests with coverage, debug APK build, web build |
| `release-android.yml` | Tag `v*` (or manual run) | Runs tests, builds a signed App Bundle, creates a GitHub Release, uploads to the Google Play **internal** track |
| `deploy-web.yml` | Pull requests and `main` (off until Sprint 13) | Tests, `flutter build web`, Vercel preview for pull requests, production for `main` |
| Dependabot | Weekly / monthly | Updates Dart packages and GitHub Actions |

`main` is protected: the CI checks must pass before a pull request can merge.

## Secrets

Add these under **Settings → Secrets and variables → Actions**.

### Android release (Sprint 1 story: "Release signing and Play internal testing track")

| Secret | How to get it |
|---|---|
| `ANDROID_KEYSTORE_BASE64` | `keytool -genkey -v -keystore upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload`, then `base64 -w 0 upload-keystore.jks` |
| `ANDROID_KEYSTORE_PASSWORD` | The store password you chose |
| `ANDROID_KEY_ALIAS` | `upload` |
| `ANDROID_KEY_PASSWORD` | The key password you chose |
| `PLAY_SERVICE_ACCOUNT_JSON` | Google Cloud service account with access to the app in Play Console (paste the whole JSON) |

Keep a backup of the keystore somewhere safe outside the repo. If it's lost, Play App Signing lets you reset the upload key, but it takes time.

The workflow writes `android/key.properties`. `android/app/build.gradle.kts` must read it for the release signing config; that's a task in the Sprint 1 story.

> Google Play needs the very first AAB uploaded by hand in Play Console. After that, the workflow can upload automatically.

### Backend (Sprint 1 story: "Supabase project and environment config")

| Secret | Purpose |
|---|---|
| `SUPABASE_URL_DEV`, `SUPABASE_ANON_KEY_DEV` | Dev backend for CI and debug builds |
| `SUPABASE_URL_PROD`, `SUPABASE_ANON_KEY_PROD` | Production backend for release builds |
| `SENTRY_DSN`, `POSTHOG_KEY` | Crash reporting and analytics (Sprint 4) |

### Web deploy (Sprint 13)

| Name | Type | Purpose |
|---|---|---|
| `WEB_DEPLOY_ENABLED` | Variable | Set to `true` to switch on `deploy-web.yml` |
| `VERCEL_TOKEN` | Secret | Vercel account token |
| `VERCEL_ORG_ID`, `VERCEL_PROJECT_ID` | Secret | From `.vercel/project.json` after `vercel link` |
