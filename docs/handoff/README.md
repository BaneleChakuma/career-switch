# Handoff notes

One brief per sprint, written for whoever picks up the work next. That's usually Claude Code in VS Code, working with Banele.

| Sprint | Brief |
|---|---|
| 01: Foundations (30 Nov – 13 Dec 2026) | [sprint-01.md](sprint-01.md) |

## Setting up Claude Code in VS Code (one time)

1. Install the **Claude Code** extension from the VS Code marketplace and sign in with your Claude account.
2. Open the cloned `career-switch` folder. Claude Code reads `CLAUDE.md` on its own.
3. Make sure these work in the VS Code terminal:
   ```bash
   flutter --version     # stable channel, Dart 3.9 or newer
   gh auth status        # GitHub CLI logged in as BaneleChakuma
   ```
4. Add the MCP servers below. Run each command once in the VS Code terminal from the repo folder. `--scope user` makes them available in all your projects. The `http` servers open a browser tab to sign in the first time you use them (type `/mcp` in Claude Code to see their status and sign in).

```bash
# Dart & Flutter: analyzer, tests, pub.dev search, hot reload (runs locally, comes with the Dart SDK)
claude mcp add --scope user --transport stdio dart -- dart mcp-server

# Up-to-date docs for any package (go_router, supabase_flutter, material_ui...)
claude mcp add --scope user --transport http context7 https://mcp.context7.com/mcp

# Supabase: projects, SQL, migrations, Edge Functions, logs
claude mcp add --scope user --transport http supabase https://mcp.supabase.com/mcp

# Figma: read the wireframes and components
claude mcp add --scope user --transport http figma https://mcp.figma.com/mcp

# From Sprint 4: crash reports and analytics
claude mcp add --scope user --transport http sentry https://mcp.sentry.dev/mcp
claude mcp add --scope user --transport http posthog https://mcp.posthog.com/mcp
```

GitHub is handled by the `gh` CLI, so no GitHub MCP server is needed.

If a command is rejected because the URL changed, check that service's docs for its current MCP address. The services move these occasionally.

### What about the connectors on claude.ai?

The connectors on your Claude account (Supabase, Figma, Canva, Bitrise, BrowserStack, PostHog, OneSignal, Vercel, Google Drive and others) belong to the Claude app. Claude Code in VS Code has its own MCP list, which is what the commands above set up. Run `/mcp` in Claude Code to see exactly what it can use.

## Ground rules for Claude Code

- Never push to `main`; use a story branch and a PR, and Banele merges.
- **Ask before** creating anything in an outside service (Play Console app, Supabase project, service accounts), anything that costs money, and anything that's hard to undo (deleting branches, force-pushing, dropping tables).
- Never print, commit or paste secrets (keystore passwords, service-account JSON, Supabase service-role key). The **anon** key is public by design, but it still goes in `--dart-define`, not in code.
- When unsure whether an API is current, check Context7 or the Dart MCP before writing code. Flutter and its packages change fast.
