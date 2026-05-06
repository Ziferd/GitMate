#GitMate
```markdown
# 🛠️ GitMate v4.0

> A powerful, bilingual GitHub CLI assistant built for Termux — and any Linux environment.

![version](https://img.shields.io/badge/version-4.0.0-brightgreen)
![license](https://img.shields.io/badge/license-MIT-blue)
![platform](https://img.shields.io/badge/platform-Termux%20%7C%20Linux-orange)
![lang](https://img.shields.io/badge/lang-en%20%7C%20id-blueviolet)

---

### 🤔 Why GitMate?

GitMate combines **35+ Git and GitHub operations** into a single, easy-to-remember CLI.  
No more typing long `git` commands or switching between `git` and `gh`.  
Just `gitmate deploy "fix: login bug"` and you're done.

-   🚀 **One-command deploy** — stage, commit, push, and sync in a single step.
-   💾 **Backup all your repos** — store local copies without opening a browser.
-   ⏪ **Undo anything** — uncommit, restore files, or reset entirely.
-   🔄 **Daemon mode** — auto-sync your repo every N seconds.
-   📊 **Stats** — see your commit history, lines of code, and top languages.
-   🧩 **Full GitHub API support** — manage gists, issues, PRs, releases, and actions.
-   🌐 **Bilingual** — English by default, Indonesian with `GITMATE_LANG=id`.

---

### ⚡ Quick Install

One command, and you're ready to go:

```bash
curl -sL https://raw.githubusercontent.com/Ziferd/gitmate/main/gitmate -o $PREFIX/bin/gitmate && chmod +x $PREFIX/bin/gitmate
```

Then install the dependencies:

```bash
gitmate setup
```

🎉 Done. Type gitmate help to see all available commands.

---

📋 Features Overview

· Core Git: deploy, push, pull, sync, status, log, diff, stash, tag, remote, init
· Branch & Merge: branch (create/switch/delete/rename), merge, fetch
· Rewrite History: reset (soft/hard), squash, rebase, cherry-pick, bisect
· GitHub API: repo (create), clone, gist, issue, pr, release, actions
· Automation: backup (all repos), stats, daemon (auto-sync), webhook
· Setup & Config: setup, config (git settings), undo, keygen, help

---

📖 Command Reference

Core Git

· gitmate deploy "message" [branch] — Stage, commit, pull --rebase, then push
    Example: gitmate deploy "fix: login error" main
· gitmate push [branch] — Push current branch
    Example: gitmate push feature/login
· gitmate pull [branch] — Pull from remote
    Example: gitmate pull main
· gitmate sync [branch] — Pull then push
    Example: gitmate sync
· gitmate status — Show working tree status
· gitmate log — Show commit history graph
· gitmate diff [target] — Show changes between commits
    Example: gitmate diff HEAD~2
· gitmate stash list|save|pop|drop — Temporarily stash changes
    Example: gitmate stash save "WIP: refactor"
· gitmate tag list|create|push|delete — Manage tags
    Example: gitmate tag create v1.2.0
· gitmate remote show|add|set|delete — Manage remote URLs
    Example: gitmate remote add upstream git@github.com:other/repo.git
· gitmate init [project] — Create a new Git repo from scratch
    Example: gitmate init my-awesome-project

Branch & Merge

· gitmate branch list — List all branches
· gitmate branch create <name> — Create and switch to new branch
    Example: gitmate branch create feat/oauth
· gitmate branch switch <name> — Switch to existing branch
    Example: gitmate branch switch main
· gitmate branch delete <name> — Delete a branch
    Example: gitmate branch delete old-branch
· gitmate branch rename <old> <new> — Rename a branch
    Example: gitmate branch rename bugfix typo-fix
· gitmate merge <branch> — Merge a branch into current
    Example: gitmate merge feat/oauth
· gitmate fetch — Fetch all remote metadata

Rewrite History

· gitmate reset soft|hard [target] — Reset HEAD to a specific commit
    Example: gitmate reset hard HEAD~2
· gitmate reflog — Show HEAD reference log
· gitmate squash [count] — Squash last N commits into one
    Example: gitmate squash 3
· gitmate rebase [branch] — Rebase current onto another branch
    Example: gitmate rebase main
· gitmate cherry-pick <commit> — Apply a specific commit
    Example: gitmate cherry-pick a1b2c3d
· gitmate bisect start|good|bad|reset — Binary search for a buggy commit
    Example: gitmate bisect start

GitHub API

· gitmate repo <name> [visibility] — Create a new GitHub repo
    Example: gitmate repo my-app private
· gitmate clone <user/repo> — Clone a GitHub repo
    Example: gitmate clone Ziferd/gitmate
· gitmate gist list|create|edit|delete — Manage GitHub Gists
    Example: gitmate gist create script.sh
· gitmate issue list|create|close|view — Manage Issues
    Example: gitmate issue create "Fix login bug"
· gitmate pr list|create|merge|checkout|review — Manage Pull Requests
    Example: gitmate pr create "feat: dark mode"
· gitmate release list|create|delete — Manage Releases
    Example: gitmate release create v2.0.0
· gitmate actions list|watch|trigger — Manage GitHub Actions
    Example: gitmate actions trigger deploy.yml

Automation

· gitmate backup [folder] — Backup all your GitHub repos
    Example: gitmate backup ~/backups
· gitmate stats — Show contribution statistics
· gitmate daemon [seconds] — Auto-sync repo every N seconds
    Example: gitmate daemon 300
· gitmate webhook — Test your webhook URL

Setup & Config

· gitmate setup — Install all dependencies
· gitmate config show|set|remote — Configure git settings
    Example: gitmate config set user.email "me@example.com"
· gitmate undo commit|file|hard — Undo changes
    Example: gitmate undo file app.js
· gitmate keygen [email] — Generate SSH key for GitHub
    Example: gitmate keygen dev@example.com
· gitmate help — Show full command list

---

🌐 Language / Bahasa

GitMate speaks English by default.
To switch to Indonesian, set the environment variable:

```bash
export GITMATE_LANG=id
```

Add that line to your ~/.bashrc to make it permanent.

---

⚙️ Configuration

· GITMATE_LANG — Language (en or id) — default en
· WEBHOOK_URL — Webhook URL for notifications (Slack, Discord, etc.)
· GITHUB_USER — Your GitHub username (speeds up clone)

---

🆚 Comparison with gh CLI

GitMate v4.0 offers features beyond the official gh CLI:

· One-command deploy (stage, commit, pull, push)
· Backup all your repos locally
· Undo actions (commit, file, hard reset)
· Squash, rebase, cherry-pick, bisect, and reflog built‑in
· Automatic sync daemon
· Contribution statistics
· Built‑in SSH key generator
· Bilingual English/Indonesian interface
· Full parity for Gist, Issue, PR, Release, and Actions management
· Repo creation and cloning included

Total: 35+ features — more than gh while staying lightweight.

---

🛠️ Troubleshooting

· "command not found" after install
    Ensure $PREFIX/bin is in your PATH. Run hash -r or restart Termux.
· "gh: command not found"
    Run gitmate setup to install all dependencies.
· "Not a Git repository"
    Navigate to an existing Git repo, or run gitmate init to create one.
· Deploy fails with merge conflicts
    GitMate won't force push. Resolve conflicts manually, then run gitmate deploy again.
· Webhook not sent
    Check that WEBHOOK_URL is set and reachable from your device.

---

🤝 Contributing

Pull requests are welcome!
If you have an idea for a new feature or found a bug, open an issue on GitHub.

---

📄 License

MIT © 2026 Ziferd

---

🧑‍💻 Developer

Ziferd
GitHub: @Ziferd

"Good tools make good developers. Build them, share them, improve them."

```
