# 🛠️ Gitzen v5.5.1 — GitHub CLI Assistant

> A powerful, bilingual GitHub CLI assistant built for Termux — and any Linux environment.

---

## 🤔 Why Gitzen?

Gitzen combines 35+ Git and GitHub operations into a single, easy-to-remember CLI.  
No more typing long git commands or switching between git and gh.  
Just `gitzen deploy "fix: login bug"` and you're done. Humanity really looked at hundreds of Git commands and decided "this is fine." Incredible species.

- 🚀 One-command deploy — stage, commit, push, and sync in a single step.
- 💾 Backup all your repos — store local copies without opening a browser.
- ⏪ Undo anything — uncommit, restore files, or reset entirely.
- 🔄 Daemon mode — auto-sync your repo every N seconds.
- 📊 Stats — see your commit history, lines of code, and top languages.
- 🧩 Full GitHub API support — manage gists, issues, PRs, releases, and actions.
- 🌐 Bilingual — English by default, Indonesian with `GITZEN_LANG=id`.
- 🔒 Input validation — dangerous characters are blocked on all commands.

---
## SUPPORTED PLATFORMS
- Termux(Android) ✅Full Support
- Linux(Ubuntu,Debian,Arc,Fedora) ✅Full Suport
- macOS ✅Full Support
- Windows (Git Bash / MSYS2 / Cygwin) ⚠️ Partial

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
- reflog
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
  Stage all files, commit, pull --rebase, then push.  
  Example:
  ```bash
  gitzen deploy "fix: login error"
  ```

- `gitzen push [branch]`  
  Push current branch to remote.  
  Example:
  ```bash
  gitzen push feature/login
  ```

- `gitzen pull [branch]`  
  Pull latest changes from remote.  
  Example:
  ```bash
  gitzen pull main
  ```

- `gitzen sync [branch]`  
  Pull then commit any local changes and push.

- `gitzen status`  
  Show working tree status, current branch, and remote URL.

- `gitzen log`  
  Show last 20 commits as a graph.

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
  Create a new Git repo with README and .gitignore from scratch.  
  Example:
  ```bash
  gitzen init my-awesome-project
  ```

---

## Branch & Merge

- `gitzen branch list`  
  List all local and remote branches.

- `gitzen branch create <name>`  
  Create and switch to a new branch.  
  Example:
  ```bash
  gitzen branch create feat/oauth
  ```

- `gitzen branch switch <name>`  
  Switch to an existing branch.

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
  Reset HEAD to a specific commit. Hard reset requires confirmation.

- `gitzen reflog`  
  Show last 20 HEAD reference logs. Great for recovering lost commits.

- `gitzen squash [count]`  
  Squash last N commits into one. Validates that N doesn't exceed total commits.

- `gitzen rebase [branch]`  
  Rebase current branch onto another.

- `gitzen cherry-pick <commit>`  
  Apply a specific commit to current branch.

- `gitzen bisect start|good|bad|reset`  
  Binary search for a buggy commit. Tiny archaeological dig through your own mistakes. A timeless Git tradition.

---

## GitHub API

- `gitzen repo <name> [public|private]`  
  Create a new GitHub repo and clone it locally.

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
  Manage GitHub Actions workflows.

---

## Automation

- `gitzen backup [folder]`  
  Backup all your GitHub repos locally. Runs in parallel for speed. Default folder: `~/gitzen-backups`.

- `gitzen stats`  
  Show contribution stats: top committers, total lines of code, dominant languages.

- `gitzen daemon [seconds]`  
  Auto-sync repo every N seconds in the background. Uses a PID-based lockfile to prevent duplicate instances. Default: 600 seconds.

- `gitzen webhook`  
  Send a test ping to your `WEBHOOK_URL`.

---

## Setup & Config

- `gitzen setup`  
  Auto-detect package manager and install all dependencies (git, gh, jq, curl, openssh). Also runs `gh auth login` if not authenticated.

- `gitzen config show|set|remote`  
  View or modify git config settings.  
  Example:
  ```bash
  gitzen config set user.email you@example.com
  gitzen config remote https://github.com/you/repo.git
  ```

- `gitzen undo commit|file|hard`  
  Undo changes safely.
  - `commit` — soft reset, keeps files staged
  - `file <name>` — restore a single file
  - `hard` — discard all changes (requires confirmation)

- `gitzen keygen [email]`  
  Generate a new ED25519 SSH key for GitHub. Saves to `~/.ssh/id_ed25519_gitzen` and prints the public key.

- `gitzen help`  
  Show the full command reference in your terminal.

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

| Variable | Description | Default |
|---|---|---|
| `GITZEN_LANG` | Language (`en` or `id`) | `en` |
| `WEBHOOK_URL` | Webhook URL for notifications (Slack, Discord, etc.) | — |
| `GITHUB_USER` | Your GitHub username (speeds up clone) | — |

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
| Input validation & sanitization | ✅ | ❌ |
| Gist / Issue / PR / Release / Actions | ✅ | ✅ |
| Repo create / Clone | ✅ | ✅ |

**Total:** 35+ features — more powerful than `gh CLI` while staying lightweight.

---

## 🛠️ Troubleshooting

- **`"command not found"` after install**  
  Make sure `$PREFIX/bin` is in your `PATH`. Run `hash -r` or restart Termux.

- **`"gh: command not found"`**  
  Run:
  ```bash
  gitzen setup
  ```

- **`"Not a Git repository"`**  
  You're not inside a Git repo. Navigate to one, or run:
  ```bash
  gitzen init
  ```

- **Deploy fails with merge conflicts**  
  Gitzen won't force push. Resolve conflicts manually, then run deploy again. Because Git believes suffering builds wisdom.

- **`"Karakter berbahaya terdeteksi"` / `"Dangerous character detected"`**  
  Your input contains characters like `;`, `&`, `|`, or `$` (except in commit messages). Clean the input and try again.

- **Daemon won't start**  
  A previous daemon may still be running. Check with `cat /tmp/gitzen.lock` to see the PID, or delete the lockfile manually:
  ```bash
  rm /tmp/gitzen.lock
  ```

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
