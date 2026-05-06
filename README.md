# 🛠️ GitMate v4.0

> A powerful, bilingual GitHub CLI assistant built for Termux — and any Linux environment.

![version](https://img.shields.io/badge/version-4.0.0-brightgreen)
![license](https://img.shields.io/badge/license-MIT-blue)
![platform](https://img.shields.io/badge/platform-Termux%20%7C%20Linux-orange)
![lang](https://img.shields.io/badge/lang-en%20%7C%20id-blueviolet)

---

## 🤔 Why GitMate?

GitMate combines **35+ Git and GitHub operations** into a single, easy-to-remember CLI.  
No more typing long `git` commands or switching between `git` and `gh`.

Just:

```bash
gitmate deploy "fix: login bug"
```

### Features

- 🚀 One-command deploy (stage, commit, pull, push)
- 💾 Backup all repositories
- ⏪ Undo changes (commit, file, hard reset)
- 🔄 Auto-sync daemon mode
- 📊 Contribution stats
- 🧩 Full GitHub API integration
- 🌐 Bilingual (EN / ID)

---

## ⚡ Quick Install

```bash
curl -sL https://raw.githubusercontent.com/Ziferd/gitmate/main/gitmate -o $PREFIX/bin/gitmate && chmod +x $PREFIX/bin/gitmate
```

Install dependencies:

```bash
gitmate setup
```

Run:

```bash
gitmate help
```

---

## 📄 License

MIT © 2026 Ziferd
