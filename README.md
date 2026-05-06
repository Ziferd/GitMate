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

-   Core Git: deploy, push, pull, sync, status, log, diff, stash, tag, remote, init
-   Branch & Merge: branch (create/switch/delete/rename), merge, fetch
-   write History: reset (soft/hard), squash, rebase, cherry-pick, bisect
-   Github API: repo (create), clone, gist, issue, pr, release, actions
-   Automation: backup (all repos), stats, daemon (auto-sync), webhook
-   Setup & Config: setup, config (git settings), undo, keygen, help

---

📖 Command Reference

Core Git

Command Description Example
gitmate deploy "message" [branch] Stage, commit, pull --rebase, then push gitmate deploy "fix: login error" main
gitmate push [branch] Push current branch gitmate push feature/login
gitmate pull [branch] Pull from remote gitmate pull main
gitmate sync [branch] Pull then push gitmate sync
gitmate status Show working tree status gitmate status
gitmate log Show commit history graph gitmate log
gitmate diff [target] Show changes between commits gitmate diff HEAD~2
gitmate stash list|save|pop|drop Temporarily stash changes gitmate stash save "WIP: refactor"
gitmate tag list|create|push|delete Manage tags gitmate tag create v1.2.0
gitmate remote show|add|set|delete Manage remote URLs gitmate remote add upstream git@github.com:other/repo.git
gitmate init [project] Create a new Git repo from scratch gitmate init my-awesome-project

Branch & Merge

Command Description Example
gitmate branch list List all branches gitmate branch list
gitmate branch create <name> Create and switch to new branch gitmate branch create feat/oauth
gitmate branch switch <name> Switch to existing branch gitmate branch switch main
gitmate branch delete <name> Delete a branch gitmate branch delete old-branch
gitmate branch rename <old> <new> Rename a branch gitmate branch rename bugfix typo-fix
gitmate merge <branch> Merge a branch into current gitmate merge feat/oauth
gitmate fetch Fetch all remote metadata gitmate fetch

Rewrite History

Command Description Example
gitmate reset soft|hard [target] Reset HEAD to a specific commit gitmate reset hard HEAD~2
gitmate reflog Show HEAD reference log gitmate reflog
gitmate squash [count] Squash last N commits into one gitmate squash 3
gitmate rebase [branch] Rebase current onto another branch gitmate rebase main
gitmate cherry-pick <commit> Apply a specific commit gitmate cherry-pick a1b2c3d
gitmate bisect start|good|bad|reset Binary search for a buggy commit gitmate bisect start

GitHub API

Command Description Example
gitmate repo <name> [visibility] Create a new GitHub repo gitmate repo my-app private
gitmate clone <user/repo> Clone a GitHub repo gitmate clone Ziferd/gitmate
gitmate gist list|create|edit|delete Manage GitHub Gists gitmate gist create script.sh
gitmate issue list|create|close|view Manage Issues gitmate issue create "Fix login bug"
gitmate pr list|create|merge|checkout|review Manage Pull Requests gitmate pr create "feat: dark mode"
gitmate release list|create|delete Manage Releases gitmate release create v2.0.0
gitmate actions list|watch|trigger Manage GitHub Actions gitmate actions trigger deploy.yml

Automation

Command Description Example
gitmate backup [folder] Backup all your GitHub repos gitmate backup ~/backups
gitmate stats Show contribution statistics gitmate stats
gitmate daemon [seconds] Auto-sync repo every N seconds gitmate daemon 300
gitmate webhook Test your webhook URL gitmate webhook

Setup & Config

Command Description Example
gitmate setup Install all dependencies gitmate setup
gitmate config show|set|remote Configure git settings gitmate config set user.email "me@example.com"
gitmate undo commit|file|hard Undo changes gitmate undo file app.js
gitmate keygen [email] Generate SSH key for GitHub gitmate keygen dev@example.com
gitmate help Show full command list gitmate help

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

Variable Description Default
GITMATE_LANG Language (en or id) en
WEBHOOK_URL Webhook URL for notifications (Slack, Discord, etc.) (none)
GITHUB_USER Your GitHub username (speeds up clone) (none)

---

🆚 Comparison with gh CLI

Feature GitMate v4.0
-   One-command deploy ✅ 
-   Backup all repos ✅ 
-   Undo (commit/file/hard) ✅ 
-   Squash, Rebase, Cherry-pick, Bisect, Reflog ✅ 
-   Auto-sync (daemon) ✅ 
-   Contribution stats ✅ 
-   SSH key generator ✅ 
-   Bilingual (EN/ID) ✅ 
-   Gist / Issue / PR / Release / Actions ✅ 
-   Repo create / Clone ✅
---
Feature gh CLI
-   One-command deploy ❌
-   Backup all repos ❌
-   Undo (commit/file/hard) ❌
-   Squash, Rebase, Cherry-pick, Bisect, Reflog ❌
-   Auto-sync (daemon) ❌
-   Contribution stats ❌
-   SSH key generator ❌
-   Bilingual (EN/ID) ❌
-   Gist / Issue / PR / Release / Actions ❌
-   Repo create / Clone ✅

Total: 35+ features — more than gh while staying lightweight.

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
