#!/data/data/com.termux/files/usr/bin/bash
# ============================================================
# Gitzen v4.0 — GitHub CLI Assistant for Termux
# Developer By: Ziferd
# Bilingual (EN / ID) — set GITZEN_LANG=id for Indonesian
# ============================================================

set -euo pipefail

GITZEN_LANG="${GITZEN_LANG:-en}"

if [ "$GITZEN_LANG" = "id" ]; then
    T_DEPENDENCIES_OK="Semua dependensi terpenuhi."
    T_DEPENDENCIES_MISSING="Dependensi berikut belum terinstal:"
    T_RUN_SETUP="Jalankan: gitzen setup"
    T_NOT_GIT_REPO="Bukan repositori Git. Jalankan 'git init' atau clone repo dulu."
    T_DEPLOY_START="Deploy ke branch"
    T_FILE_STAGED="File di-stage."
    T_FILE_STAGE_FAILED="Gagal stage file."
    T_NO_CHANGES="Tidak ada perubahan, commit dilewati."
    T_COMMIT_OK="Commit:"
    T_COMMIT_FAILED="Gagal commit."
    T_PULL_INFO="Menarik perubahan terbaru..."
    T_PULL_OK="Pull berhasil."
    T_PULL_SKIP="Pull dilewati."
    T_PUSH_INFO="Mendorong ke remote..."
    T_PUSH_OK="Push berhasil."
    T_PUSH_FAILED="Push gagal."
    T_DEPLOY_DONE="Deploy selesai."
    T_SYNC_OK="Sync selesai."
    T_HELP_LINE="Ketik 'gitzen help' untuk daftar perintah."
    T_FAIL_UNKNOWN="Perintah tidak dikenal:"
else
    T_DEPENDENCIES_OK="All dependencies satisfied."
    T_DEPENDENCIES_MISSING="Missing dependencies:"
    T_RUN_SETUP="Run: gitzen setup"
    T_NOT_GIT_REPO="Not a Git repository. Run 'git init' or clone first."
    T_DEPLOY_START="Deploy to branch"
    T_FILE_STAGED="Files staged."
    T_FILE_STAGE_FAILED="Failed to stage files."
    T_NO_CHANGES="No changes, commit skipped."
    T_COMMIT_OK="Commit:"
    T_COMMIT_FAILED="Commit failed."
    T_PULL_INFO="Pulling latest changes..."
    T_PULL_OK="Pull successful."
    T_PULL_SKIP="Pull skipped."
    T_PUSH_INFO="Pushing to remote..."
    T_PUSH_OK="Push successful."
    T_PUSH_FAILED="Push failed."
    T_DEPLOY_DONE="Deploy finished."
    T_SYNC_OK="Sync finished."
    T_HELP_LINE="Type 'gitzen help' for command list."
    T_FAIL_UNKNOWN="Unknown command:"
fi

info()  { echo "[INFO] $*"; }
ok()    { echo "[OK] $*"; }
fail()  { echo "[FAIL] $*"; }

banner() {
    echo ""
    echo "╭────────────────────────────────────────────────╮"
    echo "│  Gitzen v4.0 - GitHub CLI Assistant for Termux"
    echo "│ Developer By: Ziferd"
    echo "╰────────────────────────────────────────────────╯"
    echo ""
}

check_deps() {
    local deps=("git" "gh" "jq" "curl" "ssh-keygen")
    local missing=()
    for dep in "${deps[@]}"; do
        if ! command -v "$dep" &> /dev/null; then missing+=("$dep"); fi
    done
    if [ ${#missing[@]} -eq 0 ]; then
        ok "$T_DEPENDENCIES_OK"
    else
        fail "$T_DEPENDENCIES_MISSING ${missing[*]}"
        info "$T_RUN_SETUP"
        return 1
    fi
}

check_git() {
    if ! git rev-parse --is-inside-work-tree &> /dev/null; then
        fail "$T_NOT_GIT_REPO"
        return 1
    fi
    return 0
}

cmd_deploy() {
    local message="${1:-"deploy: $(date)"}"
    local branch="${2:-$(git branch --show-current)}"
    check_git || return 1
    info "$T_DEPLOY_START '$branch'..."
    git add . 2>/dev/null && ok "$T_FILE_STAGED" || fail "$T_FILE_STAGE_FAILED"
    if git diff --cached --quiet 2>/dev/null; then
        info "$T_NO_CHANGES"
    else
        git commit -m "$message" 2>/dev/null && ok "$T_COMMIT_OK $message" || fail "$T_COMMIT_FAILED"
    fi
    info "$T_PULL_INFO"
    git pull origin "$branch" --rebase 2>/dev/null && ok "$T_PULL_OK" || info "$T_PULL_SKIP"
    info "$T_PUSH_INFO"
    git push origin "$branch" 2>/dev/null && ok "$T_PUSH_OK" || fail "$T_PUSH_FAILED"
    ok "$T_DEPLOY_DONE"
}

cmd_push() {
    local branch="${1:-$(git branch --show-current)}"
    check_git || return 1
    git push origin "$branch" && ok "Push ke '$branch' berhasil." || fail "Push gagal."
}

cmd_pull() {
    local branch="${1:-$(git branch --show-current)}"
    check_git || return 1
    git pull origin "$branch" && ok "Pull dari '$branch' berhasil." || fail "Pull gagal."
}

cmd_sync() {
    local branch="${1:-$(git branch --show-current)}"
    check_git || return 1
    git pull origin "$branch" --rebase 2>/dev/null && ok "$T_PULL_OK" || info "$T_PULL_SKIP"
    git add . 2>/dev/null
    git commit -m "sync: $(date)" 2>/dev/null || info "$T_NO_CHANGES"
    git push origin "$branch" 2>/dev/null && ok "$T_PUSH_OK" || fail "$T_PUSH_FAILED"
    ok "$T_SYNC_OK"
}

cmd_status() {
    check_git || return 1
    git status
    echo ""
    info "Branch: $(git branch --show-current)"
    info "Remote: $(git remote get-url origin 2>/dev/null || echo 'tidak disetel')"
}

cmd_log() { check_git || return 1; git log --oneline --graph --decorate --all -20; }
cmd_diff() { check_git || return 1; git diff "${1:-HEAD}"; }

cmd_stash() {
    check_git || return 1
    case "${1:-list}" in
        list) git stash list ;;
        save) git stash push -m "${2:-"stash: $(date)"}" && ok "Perubahan disimpan." ;;
        pop)  git stash pop && ok "Stash dikeluarkan." ;;
        drop) git stash drop "${2:-0}" && ok "Stash dihapus." ;;
        *)    fail "Gunakan: list, save [pesan], pop, drop" ;;
    esac
}

cmd_tag() {
    check_git || return 1
    case "${1:-list}" in
        list)   git tag -l ;;
        create) local t="$2"; [ -z "$t" ] && { fail "Nama tag diperlukan."; return 1; }
                git tag "$t" && ok "Tag '$t' dibuat." ;;
        push)   git push --tags && ok "Tag di-push." ;;
        delete) local t="$2"; [ -z "$t" ] && { fail "Nama tag diperlukan."; return 1; }
                git tag -d "$t" && git push origin --delete "$t" 2>/dev/null && ok "Tag '$t' dihapus." ;;
        *)      fail "Gunakan: list, create <nama>, push, delete <nama>" ;;
    esac
}

cmd_remote() {
    check_git || return 1
    case "${1:-show}" in
        show)   git remote -v ;;
        add)    [ -z "$3" ] && { fail "Gunakan: gitzen remote add <nama> <url>"; return 1; }
                git remote add "$2" "$3" && ok "Remote '$2' ditambahkan." ;;
        set)    [ -z "$3" ] && { fail "Gunakan: gitzen remote set <nama> <url>"; return 1; }
                git remote set-url "$2" "$3" && ok "Remote '$2' diperbarui." ;;
        delete) [ -z "$2" ] && { fail "Nama remote diperlukan."; return 1; }
                git remote remove "$2" && ok "Remote '$2' dihapus." ;;
        *)      fail "Gunakan: show, add <nama> <url>, set <nama> <url>, delete <nama>" ;;
    esac
}

cmd_init() {
    local name="${1:-my-project}"
    [ -d "$name" ] && { fail "Folder '$name' sudah ada."; return 1; }
    mkdir "$name" && cd "$name"
    git init
    echo "# $name" > README.md
    echo "node_modules/" > .gitignore
    git add . && git commit -m "init: first commit" 2>/dev/null
    ok "Repo '$name' dibuat. Tambahkan remote: gitzen remote add origin <url>"
}

cmd_branch() {
    check_git || return 1
    case "${1:-list}" in
        list)   git branch -a ;;
        create) [ -z "$2" ] && { fail "Gunakan: gitzen branch create <nama>"; return 1; }
                git checkout -b "$2" && ok "Branch '$2' dibuat." ;;
        switch) [ -z "$2" ] && { fail "Gunakan: gitzen branch switch <nama>"; return 1; }
                git checkout "$2" && ok "Pindah ke '$2'." ;;
        delete) [ -z "$2" ] && { fail "Gunakan: gitzen branch delete <nama>"; return 1; }
                git branch -d "$2" 2>/dev/null && ok "Branch '$2' dihapus." || fail "Gagal menghapus branch." ;;
        rename) [ -z "$2" ] || [ -z "$3" ] && { fail "Gunakan: gitzen branch rename <lama> <baru>"; return 1; }
                git branch -m "$2" "$3" && ok "Branch '$2' diubah menjadi '$3'." ;;
        *)      fail "Gunakan: list, create <nama>, switch <nama>, delete <nama>, rename <lama> <baru>" ;;
    esac
}

cmd_merge() {
    check_git || return 1
    [ -z "$1" ] && { fail "Gunakan: gitzen merge <branch>"; return 1; }
    git merge "$1" && ok "Merge berhasil." || fail "Merge konflik. Selesaikan secara manual."
}

cmd_fetch() { check_git || return 1; git fetch --all && ok "Fetch selesai."; }

cmd_reset() {
    check_git || return 1
    local mode="${1:-soft}"
    local target="${2:-HEAD~1}"
    case "$mode" in
        soft) git reset --soft "$target" && ok "Reset soft ke '$target'." ;;
        hard) git reset --hard "$target" && ok "Reset hard ke '$target'." ;;
        *)    fail "Gunakan: gitzen reset [soft|hard] [target]" ;;
    esac
}

cmd_reflog() { check_git || return 1; git reflog -20; }
cmd_squash() {
    check_git || return 1
    local n="${1:-2}"
    git reset --soft HEAD~"$n" && git commit -m "squash: $n commits" && ok "Squash selesai."
}

cmd_rebase() {
    check_git || return 1
    local target="${1:-main}"
    git rebase "$target" && ok "Rebase selesai." || fail "Rebase konflik."
}

cmd_cherrypick() {
    check_git || return 1
    [ -z "$1" ] && { fail "Gunakan: gitzen cherry-pick <commit>"; return 1; }
    git cherry-pick "$1" && ok "Commit di-cherry-pick."
}

cmd_bisect() {
    check_git || return 1
    case "${1:-start}" in
        start) git bisect start && ok "Bisect dimulai." ;;
        good)  git bisect good "${2:-HEAD}" && ok "Commit ditandai good." ;;
        bad)   git bisect bad "${2:-HEAD}" && ok "Commit ditandai bad." ;;
        reset) git bisect reset && ok "Bisect direset." ;;
        *)     fail "Gunakan: start, good, bad, reset" ;;
    esac
}

cmd_repo() {
    [ -z "$1" ] && { fail "Gunakan: gitzen repo <nama> [public|private]"; return 1; }
    gh repo create "$1" --"${2:-public}" --clone && ok "Repo GitHub '$1' dibuat." || fail "Gagal membuat repo."
}

cmd_clone() {
    [ -z "$1" ] && { fail "Gunakan: gitzen clone <user/repo>"; return 1; }
    gh repo clone "$1" && ok "Clone selesai." || fail "Clone gagal."
}

cmd_gist() {
    case "${1:-list}" in
        list)   gh gist list ;;
        create) [ -z "$2" ] && { fail "Gunakan: gitzen gist create <file>"; return 1; }
                gh gist create "$2" -d "Gist from Gitzen" && ok "Gist dibuat." ;;
        edit)   [ -z "$2" ] && { fail "Gunakan: gitzen gist edit <id>"; return 1; }
                gh gist edit "$2" && ok "Gist diedit." ;;
        delete) [ -z "$2" ] && { fail "Gunakan: gitzen gist delete <id>"; return 1; }
                gh gist delete "$2" && ok "Gist dihapus." ;;
        *)      fail "Gunakan: list, create <file>, edit <id>, delete <id>" ;;
    esac
}

cmd_issue() {
    case "${1:-list}" in
        list)   gh issue list ;;
        create) [ -z "$2" ] && { fail "Gunakan: gitzen issue create '<judul>'"; return 1; }
                gh issue create -t "$2" && ok "Issue dibuat." ;;
        close)  [ -z "$2" ] && { fail "Gunakan: gitzen issue close <nomor>"; return 1; }
                gh issue close "$2" && ok "Issue #$2 ditutup." ;;
        view)   [ -z "$2" ] && { fail "Gunakan: gitzen issue view <nomor>"; return 1; }
                gh issue view "$2" ;;
        *)      fail "Gunakan: list, create <judul>, close <nomor>, view <nomor>" ;;
    esac
}

cmd_pr() {
    case "${1:-list}" in
        list)     gh pr list ;;
        create)   [ -z "$2" ] && { fail "Gunakan: gitzen pr create '<judul>'"; return 1; }
                  gh pr create -t "$2" && ok "PR dibuat." ;;
        merge)    [ -z "$2" ] && { fail "Gunakan: gitzen pr merge <nomor>"; return 1; }
                  gh pr merge "$2" && ok "PR #$2 di-merge." ;;
        checkout) [ -z "$2" ] && { fail "Gunakan: gitzen pr checkout <nomor>"; return 1; }
                  gh pr checkout "$2" && ok "Checkout PR #$2." ;;
        review)   [ -z "$2" ] && { fail "Gunakan: gitzen pr review <nomor>"; return 1; }
                  gh pr review "$2" && ok "Review PR #$2." ;;
        *)        fail "Gunakan: list, create <judul>, merge <nomor>, checkout <nomor>, review <nomor>" ;;
    esac
}

cmd_release() {
    case "${1:-list}" in
        list)   gh release list ;;
        create) [ -z "$2" ] && { fail "Gunakan: gitzen release create <tag>"; return 1; }
                gh release create "$2" && ok "Release '$2' dibuat." ;;
        delete) [ -z "$2" ] && { fail "Gunakan: gitzen release delete <tag>"; return 1; }
                gh release delete "$2" && ok "Release '$2' dihapus." ;;
        *)      fail "Gunakan: list, create <tag>, delete <tag>" ;;
    esac
}

cmd_actions() {
    case "${1:-list}" in
        list)    gh run list ;;
        watch)   [ -z "$2" ] && { fail "Gunakan: gitzen actions watch <run_id>"; return 1; }
                 gh run watch "$2" && ok "Memantau run #$2." ;;
        trigger) [ -z "$2" ] && { fail "Gunakan: gitzen actions trigger <workflow>"; return 1; }
                 gh workflow run "$2" && ok "Workflow '$2' di-trigger." ;;
        *)       fail "Gunakan: list, watch <id>, trigger <workflow>" ;;
    esac
}

cmd_backup() {
    local dest="${1:-$HOME/gitzen-backups}"
    mkdir -p "$dest"
    info "Mem-backup semua repo ke '$dest'..."
    gh repo list --json nameWithOwner --jq '.[].nameWithOwner' | while read -r r; do
        local dir="$dest/$(echo "$r" | cut -d/ -f2)"
        if [ -d "$dir" ]; then git -C "$dir" pull &>/dev/null; else gh repo clone "$r" "$dir" &>/dev/null; fi
    done
    ok "Backup selesai."
}

cmd_stats() {
    echo "Commit oleh $(git config user.name):"
    git shortlog -sn --all | head -10
    echo "Total baris kode:"
    git ls-files | xargs wc -l 2>/dev/null | tail -1
    echo "Bahasa dominan:"
    git ls-files | sed 's/.*\.//' | sort | uniq -c | sort -rn | head -5
}

cmd_daemon() {
    local int="${1:-600}"
    info "Daemon Gitzen berjalan (sinkronisasi tiap ${int}s)..."
    while true; do cmd_sync; sleep "$int"; done
}

cmd_webhook() {
    [ -z "$WEBHOOK_URL" ] && { fail "Setel WEBHOOK_URL terlebih dahulu."; return 1; }
    curl -s -X POST "$WEBHOOK_URL" -H "Content-Type: application/json" \
      -d '{"event":"ping","tool":"gitzen","timestamp":"'"$(date -Iseconds)"'"}' && ok "Webhook terkirim." || fail "Webhook gagal."
}

cmd_keygen() {
    local email="${1:-gitzen@termux.local}"
    local key="$HOME/.ssh/id_ed25519_gitzen"
    mkdir -p "$HOME/.ssh"
    ssh-keygen -t ed25519 -C "$email" -f "$key" -N "" -q && ok "Kunci dibuat: $key" || fail "Gagal membuat kunci."
    info "Public key:"
    cat "$key.pub"
}

cmd_config() {
    case "${1:-show}" in
        show)   git config --list ;;
        set)    if [ $# -lt 2 ]; then
            fail "Gunakan: gitzen config set <key> <value>"
            return 1
        fi
        git config --global "$1" "$2" && ok "$1 disetel." ;;
        remote) [ -z "$2" ] && { fail "Gunakan: gitzen config remote <url>"; return 1; }
                git remote add origin "$2" 2>/dev/null || git remote set-url origin "$2"
                ok "Remote dikonfigurasi." ;;
        *)      fail "Gunakan: show, set <key> <value>, remote <url>" ;;
    esac
}

cmd_undo() {
    case "${1:-commit}" in
        commit) git reset --soft HEAD~1 && ok "Commit terakhir dibatalkan (file aman)." ;;
        file)   [ -z "$2" ] && { fail "Gunakan: gitzen undo file <nama>"; return 1; }
                git checkout -- "$2" && ok "File '$2' dikembalikan." ;;
        hard)   git reset --hard HEAD && ok "Semua perubahan dibuang." ;;
        *)      fail "Gunakan: commit, file <nama>, hard" ;;
    esac
}

cmd_setup() {
    pkg update -y -qq && pkg upgrade -y -qq
    pkg install -y git gh jq curl openssh -qq
    ok "Dependensi terinstal."
    if ! gh auth status &>/dev/null; then
        info "Silakan login ke GitHub:"
        gh auth login
    else
        ok "Sudah login ke GitHub."
    fi
    ok "Setup selesai. Coba: gitzen help"
}

cmd_help() {
    echo ""
    if [ "$GITZEN_LANG" = "id" ]; then
        echo "╔═══════════【★】「 GITZEN v4.0 」【★】"
        echo "║ CLI Assistant untuk GitHub"
        echo "║ Developer By: Ziferd"
        echo "╚═══════════【★】"
        echo ""
        echo "╔═══════════【★】「 PERINTAH DASAR 」【★】"
        echo "║gitzen deploy  \"pesan\" [branch]   — Stage, commit, push"
        echo "║"
        echo "║gitzen push    [branch]           — Push ke remote"
        echo "║"
        echo "║gitzen pull    [branch]           — Pull dari remote"
        echo "║"
        echo "║gitzen sync    [branch]           — Pull lalu push"
        echo "║"
        echo "║gitzen status                     — Status repo"
        echo "║"
        echo "║gitzen log                        — Riwayat commit"
        echo "║"
        echo "║gitzen diff                       — Perubahan"
        echo "║"
        echo "║gitzen stash list|save|pop|drop  — Simpan sementara"
        echo "║"
        echo "║gitzen tag list|create|push|delete — Kelola tag"
        echo "║"
        echo "║gitzen remote show|add|set|delete — Kelola remote"
        echo "║"
        echo "║gitzen init    [nama]             — Buat repo baru"
        echo "╚═══════════【★】"
        echo ""
        echo "╔═══════════【★】「 BRANCH & MERGE 」【★】"
        echo "║gitzen branch list|create|switch|delete|rename — Kelola branch"
        echo "║"
        echo "║gitzen merge   <branch>           — Gabungkan branch"
        echo "║"
        echo "║gitzen fetch                      — Ambil metadata"
        echo "╚═══════════【★】"
        echo ""
        echo "╔═══════════【★】「 REWRITE HISTORY 」【★】"
        echo "║gitzen reset soft|hard [target]   — Reset ke commit"
        echo "║"
        echo "║gitzen reflog                     — Penyelamat HEAD"
        echo "║"
        echo "║gitzen squash [jumlah]            — Gabung commit"
        echo "║"
        echo "║gitzen rebase [branch]            — Rebase"
        echo "║"
        echo "║gitzen cherry-pick <commit>       — Ambil commit"
        echo "║"
        echo "║gitzen bisect start|good|bad|reset — Cari bug"
        echo "╚═══════════【★】"
        echo ""
        echo "╔═══════════【★】「 GITHUB API 」【★】"
        echo "║gitzen repo  <name> [public|private] — Buat repo GitHub"
        echo "║"
        echo "║gitzen clone <user/repo>          — Clone repo"
        echo "║"
        echo "║gitzen gist list|create|edit|delete — Kelola Gist"
        echo "║"
        echo "║gitzen issue list|create|close|view — Kelola Issue"
        echo "║"
        echo "║gitzen pr list|create|merge|checkout|review — Kelola PR"
        echo "║"
        echo "║gitzen release list|create|delete — Kelola Release"
        echo "║"
        echo "║gitzen actions list|watch|trigger — GitHub Actions"
        echo "╚═══════════【★】"
        echo ""
        echo "╔═══════════【★】「 AUTOMATION 」【★】"
        echo "║gitzen backup [folder]            — Backup semua repo"
        echo "║"
        echo "║gitzen stats                      — Statistik kontribusi"
        echo "║"
        echo "║gitzen daemon [detik]             — Auto-sync"
        echo "║"
        echo "║gitzen webhook                    — Uji webhook"
        echo "╚═══════════【★】"
        echo ""
        echo "╔═══════════【★】「 SETUP & CONFIG 」【★】"
        echo "║gitzen setup                      — Install dependensi"
        echo "║"
        echo "║gitzen config show|set|remote     — Konfigurasi git"
        echo "║"
        echo "║gitzen undo commit|file|hard      — Batalkan perubahan"
        echo "║"
        echo "║gitzen keygen [email]             — Generate SSH key"
        echo "║"
        echo "║gitzen help                       — Bantuan ini"
        echo "╚═══════════【★】"
        echo ""
        echo "╔═══════════【★】「 TIPS 」【★】"
        echo "║ • export GITZEN_LANG=id untuk Bahasa Indonesia"
        echo "║ • export WEBHOOK_URL=\"https://...\" untuk notifikasi"
        echo "╚═══════════【★】"
    else
        echo "╔═══════════【★】「 GITZEN v4.0 」【★】"
        echo "║ GitHub CLI Assistant for Termux"
        echo "║ Developer By: Ziferd"
        echo "╚═══════════【★】"
        echo ""
        echo "╔═══════════【★】「 BASIC COMMANDS 」【★】"
        echo "║gitzen deploy  \"msg\" [branch]     — Stage, commit, push"
        echo "║"
        echo "║gitzen push    [branch]           — Push to remote"
        echo "║"
        echo "║gitzen pull    [branch]           — Pull from remote"
        echo "║"
        echo "║gitzen sync    [branch]           — Pull then push"
        echo "║"
        echo "║gitzen status                     — Repo status"
        echo "║"
        echo "║gitzen log                        — Commit history"
        echo "║"
        echo "║gitzen diff                       — Changes"
        echo "║"
        echo "║gitzen stash list|save|pop|drop  — Temporary stash"
        echo "║"
        echo "║gitzen tag list|create|push|delete — Manage tags"
        echo "║"
        echo "║gitzen remote show|add|set|delete — Manage remotes"
        echo "║"
        echo "║gitzen init    [name]             — Create new repo"
        echo "╚═══════════【★】"
        echo ""
        echo "╔═══════════【★】「 BRANCH & MERGE 」【★】"
        echo "║gitzen branch list|create|switch|delete|rename — Manage branches"
        echo "║"
        echo "║gitzen merge   <branch>           — Merge branch"
        echo "║"
        echo "║gitzen fetch                      — Fetch metadata"
        echo "╚═══════════【★】"
        echo ""
        echo "╔═══════════【★】「 REWRITE HISTORY 」【★】"
        echo "║gitzen reset soft|hard [target]   — Reset to commit"
        echo "║"
        echo "║gitzen reflog                     — HEAD recovery"
        echo "║"
        echo "║gitzen squash [count]             — Squash commits"
        echo "║"
        echo "║gitzen rebase [branch]            — Rebase onto"
        echo "║"
        echo "║gitzen cherry-pick <commit>       — Pick commit"
        echo "║"
        echo "║gitzen bisect start|good|bad|reset — Find bug"
        echo "╚═══════════【★】"
        echo ""
        echo "╔═══════════【★】「 GITHUB API 」【★】"
        echo "║gitzen repo  <name> [public|private] — Create GitHub repo"
        echo "║"
        echo "║gitzen clone <user/repo>          — Clone repo"
        echo "║"
        echo "║gitzen gist list|create|edit|delete — Manage Gists"
        echo "║"
        echo "║gitzen issue list|create|close|view — Manage Issues"
        echo "║"
        echo "║gitzen pr list|create|merge|checkout|review — Manage PRs"
        echo "║"
        echo "║gitzen release list|create|delete — Manage Releases"
        echo "║"
        echo "║gitzen actions list|watch|trigger — GitHub Actions"
        echo "╚═══════════【★】"
        echo ""
        echo "╔═══════════【★】「 AUTOMATION 」【★】"
        echo "║gitzen backup [folder]            — Backup all repos"
        echo "║"
        echo "║gitzen stats                      — Contribution stats"
        echo "║"
        echo "║gitzen daemon [seconds]           — Auto-sync"
        echo "║"
        echo "║gitzen webhook                    — Test webhook"
        echo "╚═══════════【★】"
        echo ""
        echo "╔═══════════【★】「 SETUP & CONFIG 」【★】"
        echo "║gitzen setup                      — Install dependencies"
        echo "║"
        echo "║gitzen config show|set|remote     — Configure git"
        echo "║"
        echo "║gitzen undo commit|file|hard      — Undo changes"
        echo "║"
        echo "║gitzen keygen [email]             — Generate SSH key"
        echo "║"
        echo "║gitzen help                       — This help"
        echo "╚═══════════【★】"
        echo ""
        echo "╔═══════════【★】「 TIPS 」【★】"
        echo "║ • export GITZEN_LANG=id for Indonesia"
        echo "║ • export WEBHOOK_URL=\"https://...\" for notifications"
        echo "╚═══════════【★】"
    fi
    echo ""
}

main() {
    banner
    case "${1:-help}" in
        deploy)       shift; cmd_deploy "$@" ;;
        push)         shift; cmd_push "$@" ;;
        pull)         shift; cmd_pull "$@" ;;
        sync)         shift; cmd_sync "$@" ;;
        status)       shift; cmd_status "$@" ;;
        log)          shift; cmd_log "$@" ;;
        diff)         shift; cmd_diff "$@" ;;
        stash)        shift; cmd_stash "$@" ;;
        tag)          shift; cmd_tag "$@" ;;
        remote)       shift; cmd_remote "$@" ;;
        init)         shift; cmd_init "$@" ;;
        branch)       shift; cmd_branch "$@" ;;
        merge)        shift; cmd_merge "$@" ;;
        fetch)        shift; cmd_fetch "$@" ;;
        reset)        shift; cmd_reset "$@" ;;
        reflog)       shift; cmd_reflog "$@" ;;
        squash)       shift; cmd_squash "$@" ;;
        rebase)       shift; cmd_rebase "$@" ;;
        cherry-pick)  shift; cmd_cherrypick "$@" ;;
        bisect)       shift; cmd_bisect "$@" ;;
        repo)         shift; cmd_repo "$@" ;;
        clone)        shift; cmd_clone "$@" ;;
        gist)         shift; cmd_gist "$@" ;;
        issue)        shift; cmd_issue "$@" ;;
        pr)           shift; cmd_pr "$@" ;;
        release)      shift; cmd_release "$@" ;;
        actions)      shift; cmd_actions "$@" ;;
        backup)       shift; cmd_backup "$@" ;;
        stats)        shift; cmd_stats "$@" ;;
        daemon)       shift; cmd_daemon "$@" ;;
        webhook)      shift; cmd_webhook "$@" ;;
        keygen)       shift; cmd_keygen "$@" ;;
        config)       shift; cmd_config "$@" ;;
        undo)         shift; cmd_undo "$@" ;;
        setup)        shift; cmd_setup "$@" ;;
        help|--help|-h) cmd_help ;;
        *)            fail "$T_FAIL_UNKNOWN $1" ; info "$T_HELP_LINE" ;;
    esac
}

main "$@"