# 🛠️ Gitzen v4.0 Github CLI Assistant For Termux

> A powerful, bilingual GitHub CLI assistant built for Termux — and any Linux environment.

---

## 🤔 Why Gitzen?

Gitzen combines 35+ Git and GitHub operations into a single, easy-to-remember CLI.  
No more typing long git commands or switching between git and gh.  
Just `gitzen deploy "fix: login bug"` and you're done. Humanity really looked at hundreds of Git commands and decided “this is fine.” Incredible species.

- 🚀 One-command deploy — stage, commit, push, and sync in a single step.
- 💾 Backup all your repos — store local copies without opening a browser.
- ⏪ Undo anything — uncommit, restore files, or reset entirely.
- 🔄 Daemon mode — auto-sync your repo every N seconds.
- 📊 Stats — see your commit history, lines of code, and top languages.
- 🧩 Full GitHub API support — manage gists, issues, PRs, releases, and actions.
- 🌐 Bilingual — English by default, Indonesian with `GITZEN_LANG=id`.

---

## ⚡ Quick Install

One command, and you're ready to go:

```bash
curl -sL https://raw.githubusercontent.com/Ziferd/Gitzen/main/Gitzen.sh -o $PREFIX/bin/gitzen && chmod +x $PREFIX/bin/gitzen
```

Then install the dependencies:

```bash
gitzen setup
```

🎉 Done. Type `gitzen help` to see all available commands.

---

## 📋 Features Overview

### Core Git
- deploy
- push
- pull
- sync
- status
- log
- diff
- stash
- tag
- remote
- init

### Branch & Merge
- branch (create/switch/delete/rename)
- merge
- fetch

### Rewrite History
- reset (soft/hard)
- squash
- rebase
- cherry-pick
- bisect

### GitHub API
- repo (create)
- clone
- gist
- issue
- pr
- release
- actions

### Automation
- backup (all repos)
- stats
- daemon (auto-sync)
- webhook

### Setup & Config
- setup
- config (git settings)
- undo
- keygen
- help

---

# 📖 Command Reference

## Core Git

- `gitzen deploy "message" [branch]`  
  Stage, commit, pull --rebase, then push.  
  Example:
  ```bash
  gitzen deploy "fix: login error" main
  ```

- `gitzen push [branch]`  
  Push current branch.  
  Example:
  ```bash
  gitzen push feature/login
  ```

- `gitzen pull [branch]`  
  Pull from remote.  
  Example:
  ```bash
  gitzen pull main
  ```

- `gitzen sync [branch]`  
  Pull then push.

- `gitzen status`  
  Show working tree status.

- `gitzen log`  
  Show commit history graph.

- `gitzen diff [target]`  
  Show changes between commits.  
  Example:
  ```bash
  gitzen diff HEAD~2
  ```

- `gitzen stash list|save|pop|drop`  
  Temporarily stash changes.  
  Example:
  ```bash
  gitzen stash save "WIP: refactor"
  ```

- `gitzen tag list|create|push|delete`  
  Manage tags.  
  Example:
  ```bash
  gitzen tag create v1.2.0
  ```

- `gitzen remote show|add|set|delete`  
  Manage remote URLs.  
  Example:
  ```bash
  gitzen remote add upstream git@github.com:other/repo.git
  ```

- `gitzen init [project]`  
  Create a new Git repo from scratch.  
  Example:
  ```bash
  gitzen init my-awesome-project
  ```

---

## Branch & Merge

- `gitzen branch list`  
  List all branches.

- `gitzen branch create <name>`  
  Create and switch to new branch.  
  Example:
  ```bash
  gitzen branch create feat/oauth
  ```

- `gitzen branch switch <name>`  
  Switch to existing branch.

- `gitzen branch delete <name>`  
  Delete a branch.

- `gitzen branch rename <old> <new>`  
  Rename a branch.

- `gitzen merge <branch>`  
  Merge a branch into current.

- `gitzen fetch`  
  Fetch all remote metadata.

---

## Rewrite History

- `gitzen reset soft|hard [target]`  
  Reset HEAD to a specific commit.

- `gitzen reflog`  
  Show HEAD reference log.

- `gitzen squash [count]`  
  Squash last N commits into one.

- `gitzen rebase [branch]`  
  Rebase current onto another branch.

- `gitzen cherry-pick <commit>`  
  Apply a specific commit.

- `gitzen bisect start|good|bad|reset`  
  Binary search for a buggy commit. Tiny archaeological dig through your own mistakes. A timeless Git tradition.

---

## GitHub API

- `gitzen repo <name> [visibility]`  
  Create a new GitHub repo.

- `gitzen clone <user/repo>`  
  Clone a GitHub repo.

- `gitzen gist list|create|edit|delete`  
  Manage GitHub Gists.

- `gitzen issue list|create|close|view`  
  Manage Issues.

- `gitzen pr list|create|merge|checkout|review`  
  Manage Pull Requests.

- `gitzen release list|create|delete`  
  Manage Releases.

- `gitzen actions list|watch|trigger`  
  Manage GitHub Actions.

---

## Automation

- `gitzen backup [folder]`  
  Backup all your GitHub repos.

- `gitzen stats`  
  Show contribution statistics.

- `gitzen daemon [seconds]`  
  Auto-sync repo every N seconds.

- `gitzen webhook`  
  Test your webhook URL.

---

## Setup & Config

- `gitzen setup`  
  Install all dependencies.

- `gitzen config show|set|remote`  
  Configure git settings.

- `gitzen undo commit|file|hard`  
  Undo changes.

- `gitzen keygen [email]`  
  Generate SSH key for GitHub.

- `gitzen help`  
  Show full command list.

---

## 🌐 Language / Bahasa

Gitzen speaks English by default.  
To switch to Indonesian, set the environment variable:

```bash
export GITZEN_LANG=id
```

Add that line to your `~/.bashrc` to make it permanent. Because typing the same export command forever is apparently how humans build character.

---

## ⚙️ Configuration

- `GITZEN_LANG` — Language (`en` or `id`). Default: `en`
- `WEBHOOK_URL` — Webhook URL for notifications (Slack, Discord, etc.)
- `GITHUB_USER` — Your GitHub username (speeds up clone)

---

## 🆚 Comparison with gh CLI

| Feature | Gitzen | gh CLI |
|---|---|---|
| One-command deploy | ✅ | ❌ |
| Backup all repos | ✅ | ❌ |
| Undo (commit/file/hard) | ✅ | ❌ |
| Squash, Rebase, Cherry-pick, Bisect, Reflog | ✅ | ❌ |
| Auto-sync (daemon) | ✅ | ❌ |
| Contribution stats | ✅ | ❌ |
| SSH key generator | ✅ | ❌ |
| Bilingual (EN/ID) | ✅ | ❌ |
| Gist / Issue / PR / Release / Actions | ✅ | ✅ |
| Repo create / Clone | ✅ | ✅ |

**Total:** 35+ features — Gitzen is more powerful than `gh CLI` while staying lightweight.

---

## 🛠️ Troubleshooting

- `"command not found"` after install  
  Make sure `$PREFIX/bin` is in your `PATH`. Run `hash -r` or restart Termux.

- `"gh: command not found"`  
  Run:
  ```bash
  gitzen setup
  ```

- `"Not a Git repository"`  
  You're not inside a Git repo. Navigate to one, or run:
  ```bash
  gitzen init
  ```

- Deploy fails with merge conflicts  
  Gitzen won't force push. Resolve conflicts manually, then run deploy again. Because Git believes suffering builds wisdom.

---

## 🤝 Contributing

Pull requests are welcome!  
If you have an idea for a new feature or found a bug, open an issue on GitHub.

---

## 📄 License

MIT © 2026 Ziferd

---

## 🧑‍💻 Developer

**Ziferd**  
GitHub: `@Ziferd`

> "Good tools make good developers. Build them, share them, improve them."
