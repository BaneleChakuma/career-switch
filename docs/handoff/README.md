# Handoff notes

One brief per sprint, written for whoever picks up the work next. That's usually the Claude CLI running in VS Code's terminal, working with Banele.

| Sprint | Brief |
|---|---|
| 01: Foundations (30 Nov – 13 Dec 2026) | [sprint-01.md](sprint-01.md) |

## Setting up the Claude CLI in VS Code (one time)

You run Claude Code as the **CLI** inside VS Code's integrated terminal (`` Ctrl+` ``).

1. Check it's installed and up to date (it's already on the laptop):
   ```bash
   claude --version
   claude update
   ```
   If it's missing: `curl -fsSL https://claude.ai/install.sh | bash`, then `claude` once to sign in with your Claude account.
2. In VS Code, open the cloned `career-switch` folder, open the integrated terminal and run `claude` **from the repo root**. The CLI loads `CLAUDE.md` from the folder it starts in.
3. Inside the CLI, run `/ide` once to connect it to VS Code. That lets it see the open file and your selection, and show diffs in the editor instead of only in the terminal.
4. Make sure these work in the same terminal:
   ```bash
   flutter --version     # stable channel, Dart 3.9 or newer
   gh auth status        # GitHub CLI logged in as BaneleChakuma
   ```
5. Add the MCP servers below. Run each command once in a normal terminal (not inside the `claude` prompt). `--scope user` makes them available in all your projects. The `http` servers open a browser tab to sign in the first time you use them (type `/mcp` inside `claude` to see their status and sign in). Restart `claude` after adding servers.

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

The connectors on your Claude account (Supabase, Figma, Canva, Bitrise, BrowserStack, PostHog, OneSignal, Vercel, Google Drive and others) belong to the Claude app. The Claude CLI has its own MCP list, which is what the commands above set up. Run `/mcp` inside `claude` to see exactly what it can use.

## Ground rules for the Claude CLI

- Never push to `main`; use a story branch and a PR, and Banele merges.
- **Ask before** creating anything in an outside service (Play Console app, Supabase project, service accounts), anything that costs money, and anything that's hard to undo (deleting branches, force-pushing, dropping tables).
- Never print, commit or paste secrets (keystore passwords, service-account JSON, Supabase service-role key). The **anon** key is public by design, but it still goes in `--dart-define`, not in code.
- When unsure whether an API is current, check Context7 or the Dart MCP before writing code. Flutter and its packages change fast.
