🛠️ GitMate v4.0

«A powerful, bilingual GitHub CLI assistant built for Termux — and any Linux environment.»

"version" (https://img.shields.io/badge/version-4.0.0-brightgreen)
"license" (https://img.shields.io/badge/license-MIT-blue)
"platform" (https://img.shields.io/badge/platform-Termux%20%7C%20Linux-orange)
"lang" (https://img.shields.io/badge/lang-en%20%7C%20id-blueviolet)

---

🤔 Why GitMate?

GitMate combines 35+ Git and GitHub operations into a single, easy-to-remember CLI.
No more typing long "git" commands or switching between "git" and "gh".

Just:

gitmate deploy "fix: login bug"

Features

- 🚀 One-command deploy (stage, commit, pull, push)
- 💾 Backup all repositories
- ⏪ Undo changes (commit, file, hard reset)
- 🔄 Auto-sync daemon mode
- 📊 Contribution stats
- 🧩 Full GitHub API integration
- 🌐 Bilingual (EN / ID)

---

⚡ Quick Install

curl -sL https://raw.githubusercontent.com/Ziferd/gitmate/main/gitmate -o $PREFIX/bin/gitmate && chmod +x $PREFIX/bin/gitmate

Install dependencies:

gitmate setup

Run:

gitmate help

---

📋 Features Overview

- Core Git
- Branch & Merge
- Rewrite History
- GitHub API
- Automation
- Setup & Config

---

📖 Command Reference

Core Git

Command| Description| Example
"gitmate deploy "msg" [branch]"| Commit + pull + push| "gitmate deploy "fix bug" main"
"gitmate push [branch]"| Push branch| "gitmate push feature/login"
"gitmate pull [branch]"| Pull from remote| "gitmate pull main"
"gitmate sync [branch]"| Pull then push| "gitmate sync"
"gitmate status"| Show status| "gitmate status"
"gitmate log"| Commit graph| "gitmate log"
"gitmate diff [target]"| Show diff| "gitmate diff HEAD~2"
"gitmate stash"| Manage stash| "gitmate stash save "WIP""
"gitmate tag"| Manage tags| "gitmate tag create v1.2.0"
"gitmate remote"| Manage remote| "gitmate remote add upstream ..."
"gitmate init"| Init repo| "gitmate init project"

---

Branch & Merge

Command| Description
"gitmate branch list"| List branches
"gitmate branch create <name>"| Create branch
"gitmate branch switch <name>"| Switch branch
"gitmate branch delete <name>"| Delete branch
"gitmate branch rename <old> <new>"| Rename branch
"gitmate merge <branch>"| Merge branch
"gitmate fetch"| Fetch remote

---

Rewrite History

Command| Description
`gitmate reset soft| hard`
"gitmate reflog"| Show history
"gitmate squash"| Squash commits
"gitmate rebase"| Rebase branch
"gitmate cherry-pick"| Apply commit
"gitmate bisect"| Find bug

---

GitHub API

Command| Description
"gitmate repo"| Create repo
"gitmate clone"| Clone repo
"gitmate gist"| Manage gists
"gitmate issue"| Manage issues
"gitmate pr"| Manage PR
"gitmate release"| Manage releases
"gitmate actions"| Manage actions

---

Automation

Command| Description
"gitmate backup"| Backup repos
"gitmate stats"| Show stats
"gitmate daemon"| Auto-sync
"gitmate webhook"| Test webhook

---

Setup & Config

Command| Description
"gitmate setup"| Install deps
"gitmate config"| Git config
"gitmate undo"| Undo changes
"gitmate keygen"| Generate SSH key
"gitmate help"| Help menu

---

🌐 Language

Default: English
Switch to Indonesian:

export GITMATE_LANG=id

---

⚙️ Configuration

Variable| Description| Default
"GITMATE_LANG"| Language| en
"WEBHOOK_URL"| Webhook endpoint| none
"GITHUB_USER"| GitHub username| none

---

🆚 Comparison with gh CLI

Feature| GitMate| gh CLI
One-command deploy| ✅| ❌
Backup repos| ✅| ❌
Undo system| ✅| ❌
Advanced git tools| ✅| ❌
Auto-sync daemon| ✅| ❌
Stats| ✅| ❌
SSH keygen| ✅| ❌
Bilingual| ✅| ❌
GitHub API| ✅| ✅

---

🛠️ Troubleshooting

command not found

- Ensure "$PREFIX/bin" in PATH
- Run "hash -r"

gh not found

gitmate setup

Not a Git repository

gitmate init

Merge conflict on deploy

- Resolve manually
- Re-run deploy

---

🤝 Contributing

Pull requests welcome.
Open issue for bugs or feature requests.

---

📄 License

MIT © 2026 Ziferd

---

🧑‍💻 Developer

Ziferd
GitHub: https://github.com/Ziferd

«"Good tools make good developers. Build them, share them, improve them."»
