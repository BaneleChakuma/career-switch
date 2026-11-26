# How we work

## Agile setup

| Thing | Where it lives |
|---|---|
| Sprint (2 weeks) | GitHub milestone `Sprint NN · …` with start and end dates |
| User story | Issue labelled `type: story`, with acceptance criteria and tasks |
| Epic | Issue labelled `type: epic`, with a checklist linking its stories |
| Story points | Label `points: 1/2/3/5/8` |
| Phase | Label `phase: android app` or `phase: web app` |
| Board | GitHub Project: Backlog → Sprint → In progress → Review → Done |

**Sprint rhythm:**
- **Monday, start:** planning. Move the sprint's stories to *Sprint* and check capacity (about 12 points).
- **Each study day:** a 2-minute written stand-up as a comment on the story you're working on (did, doing, blocked).
- **Sunday, end:** review (demo the build on a phone) and retro (one thing to keep, one to change, written in the milestone description).

Unfinished stories roll over to the next sprint's milestone with a short note explaining why.

## Branches and commits

- `main` is always releasable and protected: merges only through a pull request with green CI.
- Branch names: `story/<issue-number>-short-name`, `fix/<issue-number>-short-name` or `chore/short-name`.
- Commits follow [Conventional Commits](https://www.conventionalcommits.org): `feat:`, `fix:`, `test:`, `chore:`, `docs:`, `refactor:`.
- Pull requests say `Closes #<issue>` so the story closes on merge.

## Definition of Done

A story is done when:

1. All acceptance criteria are met.
2. Tests are written: unit tests for logic, widget tests for screens. New logic has at least 80% coverage.
3. CI is green (format, analyze, tests, Android and web builds).
4. It matches the Figma design, or the difference is explained in the pull request.
5. It works with TalkBack and at 200% text size.
6. No secrets, keys or personal data are in the code.
7. It has been demoed on a real Android phone (web stories: on Chrome, on both mobile and desktop widths).

## Releases

- Android: tag `vMAJOR.MINOR.PATCH` (for example `v0.3.0`) → signed AAB → GitHub Release → Play internal testing.
- Web (from Sprint 13): merge to `main` → production on Vercel; pull requests get preview URLs.
