#GitMate
```markdown
# 🛠️ GitMate v4.0

> A powerful, bilingual GitHub CLI assistant built for Termux — and any Linux environment.

![version](https://img.shields.io/badge/version-4.0.0-brightgreen) ![license](https://img.shields.io/badge/license-MIT-blue) ![platform](https://img.shields.io/badge/platform-Termux%20%7C%20Linux-orange) ![lang](https://img.shields.io/badge/lang-en%20%7C%20id-blueviolet)

---

### 🤔 Why GitMate?

GitMate combines **35+ Git and GitHub operations** into a single, easy-to-remember CLI.  
No more typing long `git` commands or switching between `git` and `gh`.  
Just `gitmate deploy "fix: login bug"` and you're done.

- 🚀 **One-command deploy** — stage, commit, push, and sync in a single step.
- 💾 **Backup all your repos** — store local copies without opening a browser.
- ⏪ **Undo anything** — uncommit, restore files, or reset entirely.
- 🔄 **Daemon mode** — auto-sync your repo every N seconds.
- 📊 **Stats** — see your commit history, lines of code, and top languages.
- 🧩 **Full GitHub API support** — manage gists, issues, PRs, releases, and actions.
- 🌐 **Bilingual** — English by default, Indonesian with `GITMATE_LANG=id`.

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

📖 Commands

Core Git

· gitmate deploy "msg" [branch] — Stage, commit, pull --rebase, then push
· gitmate push [branch] — Push current branch
· gitmate pull [branch] — Pull from remote
· gitmate sync [branch] — Pull then push
· gitmate status — Show working tree status
· gitmate log — Show commit history graph
· gitmate diff [target] — Show changes between commits
· gitmate stash list|save|pop|drop — Temporarily stash changes
· gitmate tag list|create|push|delete — Manage tags
· gitmate remote show|add|set|delete — Manage remote URLs
· gitmate init [project] — Create a new Git repo from scratch

Branch & Merge

· gitmate branch list — List all branches
· gitmate branch create <name> — Create and switch to new branch
· gitmate branch switch <name> — Switch to existing branch
· gitmate branch delete <name> — Delete a branch
· gitmate branch rename <old> <new> — Rename a branch
· gitmate merge <branch> — Merge a branch into current
· gitmate fetch — Fetch all remote metadata

Rewrite History

· gitmate reset soft|hard [target] — Reset HEAD to a specific commit
· gitmate reflog — Show HEAD reference log
· gitmate squash [count] — Squash last N commits into one
· gitmate rebase [branch] — Rebase current onto another branch
· gitmate cherry-pick <commit> — Apply a specific commit
· gitmate bisect start|good|bad|reset — Binary search for a buggy commit

GitHub API

· gitmate repo <name> [visibility] — Create a new GitHub repo
· gitmate clone <user/repo> — Clone a GitHub repo
· gitmate gist list|create|edit|delete — Manage GitHub Gists
· gitmate issue list|create|close|view — Manage Issues
· gitmate pr list|create|merge|checkout|review — Manage Pull Requests
· gitmate release list|create|delete — Manage Releases
· gitmate actions list|watch|trigger — Manage GitHub Actions

Automation

· gitmate backup [folder] — Backup all your GitHub repos
· gitmate stats — Show contribution statistics
· gitmate daemon [seconds] — Auto-sync repo every N seconds
· gitmate webhook — Test your webhook URL

Setup & Config

· gitmate setup — Install all dependencies
· gitmate config show|set|remote — Configure git settings
· gitmate undo commit|file|hard — Undo changes
· gitmate keygen [email] — Generate SSH key for GitHub
· gitmate help — Show full command list

---

🌐 Language / Bahasa

GitMate is English by default. For Indonesian, set the environment variable:

```bash
export GITMATE_LANG=id
```

Add that line to your ~/.bashrc to make it permanent.

---

⚙️ Configuration

· GITMATE_LANG — Language (en or id). Default: en
· WEBHOOK_URL — Webhook URL for notifications. Default: (none)
· GITHUB_USER — Your GitHub username. Default: (none)

---

🆚 GitMate vs gh CLI

Features only GitMate has:

· One‑command deploy (deploy)
· Backup all repositories (backup)
· Undo commit, restore files, or hard reset (undo)
· Squash, rebase, cherry‑pick, bisect, and reflog built‑in
· Auto‑sync daemon (daemon)
· Contribution statistics (stats)
· SSH key generator (keygen)
· Full bilingual support (English & Indonesian)

Features both have:

· Push, pull, fetch, merge, branch management
· Repository creation and cloning
· Gist, issue, pull request, release, and Actions management

GitMate gives you 35+ everyday Git/GitHub tasks in one tool — no need to switch between git and gh.

---

🛠️ Troubleshooting

"command not found" after install
Make sure $PREFIX/bin is in your PATH. Run hash -r or restart Termux.

"gh: command not found"
Run gitmate setup to install all dependencies.

"Not a Git repository"
You're not inside a Git repo. Navigate to one, or run gitmate init.

Deploy fails with merge conflicts
GitMate won't force push. Resolve conflicts manually, then run gitmate deploy again.

---

📄 License

MIT © 2026 Ziferd

---

🧑‍💻 Developer

Ziferd
GitHub: @Ziferd

"Good tools make good developers. Build them, share them, improve them."

```
