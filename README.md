```markdown
# 🛠️ Gitzen v4.0 Github CLI Assistant For Termux

> A powerful, bilingual GitHub CLI assistant built for Termux — and any Linux environment.

![version](https://img.shields.io/badge/version-4.0.0-brightgreen)
![license](https://img.shields.io/badge/license-MIT-blue)
![platform](https://img.shields.io/badge/platform-Termux%20%7C%20Linux-orange)
![lang](https://img.shields.io/badge/lang-en%20%7C%20id-blueviolet)

---

### 🤔 Why Gitzen?

Gitzen combines **35+ Git and GitHub operations** into a single, easy-to-remember CLI.  
No more typing long `git` commands or switching between `git` and `gh`.  
Just `gitzen deploy "fix: login bug"` and you're done.

- 🚀 **One-command deploy** — stage, commit, push, and sync in a single step.
- 💾 **Backup all your repos** — store local copies without opening a browser.
- ⏪ **Undo anything** — uncommit, restore files, or reset entirely.
- 🔄 **Daemon mode** — auto-sync your repo every N seconds.
- 📊 **Stats** — see your commit history, lines of code, and top languages.
- 🧩 **Full GitHub API support** — manage gists, issues, PRs, releases, and actions.
- 🌐 **Bilingual** — English by default, Indonesian with `GITZEN_LANG=id`.

---

### ⚡ Quick Install

One command, and you're ready to go:

```bash
curl -sL https://raw.githubusercontent.com/Ziferd/Gitzen/main/Gitzen.sh -o $PREFIX/bin/gitzen && chmod +x $PREFIX/bin/gitzen
```

Then install the dependencies:

```bash
gitzen setup
```

🎉 Done. Type gitzen help to see all available commands.

---

📋 Features Overview

· Core Git — deploy, push, pull, sync, status, log, diff, stash, tag, remote, init
· Branch & Merge — branch (create/switch/delete/rename), merge, fetch
· Rewrite History — reset (soft/hard), squash, rebase, cherry-pick, bisect
· GitHub API — repo (create), clone, gist, issue, pr, release, actions
· Automation — backup (all repos), stats, daemon (auto-sync), webhook
· Setup & Config — setup, config (git settings), undo, keygen, help

---

📖 Command Reference

Core Git

· gitzen deploy "message" [branch] — Stage, commit, pull --rebase, then push. Example: gitzen deploy "fix: login error" main
· gitzen push [branch] — Push current branch. Example: gitzen push feature/login
· gitzen pull [branch] — Pull from remote. Example: gitzen pull main
· gitzen sync [branch] — Pull then push. Example: gitzen sync
· gitzen status — Show working tree status.
· gitzen log — Show commit history graph.
· gitzen diff [target] — Show changes between commits. Example: gitzen diff HEAD~2
· gitzen stash list|save|pop|drop — Temporarily stash changes. Example: gitzen stash save "WIP: refactor"
· gitzen tag list|create|push|delete — Manage tags. Example: gitzen tag create v1.2.0
· gitzen remote show|add|set|delete — Manage remote URLs. Example: gitzen remote add upstream git@github.com:other/repo.git
· gitzen init [project] — Create a new Git repo from scratch. Example: gitzen init my-awesome-project

Branch & Merge

· gitzen branch list — List all branches.
· gitzen branch create <name> — Create and switch to new branch. Example: gitzen branch create feat/oauth
· gitzen branch switch <name> — Switch to existing branch. Example: gitzen branch switch main
· gitzen branch delete <name> — Delete a branch. Example: gitzen branch delete old-branch
· gitzen branch rename <old> <new> — Rename a branch. Example: gitzen branch rename bugfix typo-fix
· gitzen merge <branch> — Merge a branch into current. Example: gitzen merge feat/oauth
· gitzen fetch — Fetch all remote metadata.

Rewrite History

· gitzen reset soft|hard [target] — Reset HEAD to a specific commit. Example: gitzen reset hard HEAD~2
· gitzen reflog — Show HEAD reference log.
· gitzen squash [count] — Squash last N commits into one. Example: gitzen squash 3
· gitzen rebase [branch] — Rebase current onto another branch. Example: gitzen rebase main
· gitzen cherry-pick <commit> — Apply a specific commit. Example: gitzen cherry-pick a1b2c3d
· gitzen bisect start|good|bad|reset — Binary search for a buggy commit. Example: gitzen bisect start

GitHub API

· gitzen repo <name> [visibility] — Create a new GitHub repo. Example: gitzen repo my-app private
· gitzen clone <user/repo> — Clone a GitHub repo. Example: gitzen clone Ziferd/gitzen
· gitzen gist list|create|edit|delete — Manage GitHub Gists. Example: gitzen gist create script.sh
· gitzen issue list|create|close|view — Manage Issues. Example: gitzen issue create "Fix login bug"
· gitzen pr list|create|merge|checkout|review — Manage Pull Requests. Example: gitzen pr create "feat: dark mode"
· gitzen release list|create|delete — Manage Releases. Example: gitzen release create v2.0.0
· gitzen actions list|watch|trigger — Manage GitHub Actions. Example: gitzen actions trigger deploy.yml

Automation

· gitzen backup [folder] — Backup all your GitHub repos. Example: gitzen backup ~/backups
· gitzen stats — Show contribution statistics.
· gitzen daemon [seconds] — Auto-sync repo every N seconds. Example: gitzen daemon 300
· gitzen webhook — Test your webhook URL.

Setup & Config

· gitzen setup — Install all dependencies.
· gitzen config show|set|remote — Configure git settings. Example: gitzen config set user.email "me@example.com"
· gitzen undo commit|file|hard — Undo changes. Example: gitzen undo file app.js
· gitzen keygen [email] — Generate SSH key for GitHub. Example: gitzen keygen dev@example.com
· gitzen help — Show full command list.

---

🌐 Language / Bahasa

Gitzen speaks English by default.
To switch to Indonesian, set the environment variable:

```bash
export GITZEN_LANG=id
```

Add that line to your ~/.bashrc to make it permanent.

---

⚙️ Configuration

· GITZEN_LANG — Language (en or id). Default: en
· WEBHOOK_URL — Webhook URL for notifications (Slack, Discord, etc.)
· GITHUB_USER — Your GitHub username (speeds up clone)

---

🆚 Comparison with gh CLI

Gitzen v4.0 has all these features, while gh CLI lacks many of them:

· One-command deploy ✅ (❌ in gh CLI)
· Backup all repos ✅ (❌ in gh CLI)
· Undo (commit/file/hard) ✅ (❌ in gh CLI)
· Squash, Rebase, Cherry-pick, Bisect, Reflog ✅ (❌ in gh CLI)
· Auto-sync (daemon) ✅ (❌ in gh CLI)
· Contribution stats ✅ (❌ in gh CLI)
· SSH key generator ✅ (❌ in gh CLI)
· Bilingual (EN/ID) ✅ (❌ in gh CLI)
· Gist / Issue / PR / Release / Actions ✅ (✅ in gh CLI)
· Repo create / Clone ✅ (✅ in gh CLI)

Total: 35+ features — Gitzen is more powerful than gh CLI while staying lightweight.

---

🛠️ Troubleshooting

· "command not found" after install → Make sure $PREFIX/bin is in your PATH. Run hash -r or restart Termux.
· "gh: command not found" → Run gitzen setup to install all dependencies.
· "Not a Git repository" → You're not inside a Git repo. Navigate to one, or run gitzen init.
· Deploy fails with merge conflicts → Gitzen won't force push. Resolve conflicts manually, then run gitzen deploy again.

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
