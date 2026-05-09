#!/usr/bin/env bash
# ============================================================
# Gitzen v5.0 — Cross-Platform GitHub CLI Assistant
# Developer By: Ziferd
# Bilingual (EN / ID) — set GITZEN_LANG=id for Indonesian
# ============================================================

set -euo pipefail

GITZEN_LANG="${GITZEN_LANG:-en}"

# ==================== BILINGUAL MESSAGES ====================
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

    # Additional bilingual messages for functions not yet covered
    T_STASH_SAVED="Perubahan disimpan."
    T_STASH_POPPED="Stash dikeluarkan."
    T_STASH_DROPPED="Stash dihapus."
    T_TAG_CREATED="Tag '%s' dibuat."
    T_TAG_DELETED="Tag '%s' dihapus."
    T_TAG_PUSHED="Tag di-push."
    T_REMOTE_ADDED="Remote '%s' ditambahkan."
    T_REMOTE_UPDATED="Remote '%s' diperbarui."
    T_REMOTE_DELETED="Remote '%s' dihapus."
    T_REPO_INIT="Repo '%s' dibuat. Tambahkan remote: gitzen remote add origin <url>"
    T_BRANCH_CREATED="Branch '%s' dibuat."
    T_BRANCH_SWITCHED="Pindah ke '%s'."
    T_BRANCH_DELETED="Branch '%s' dihapus."
    T_BRANCH_RENAMED="Branch '%s' diubah menjadi '%s'."
    T_MERGE_OK="Merge berhasil."
    T_MERGE_CONFLICT="Merge konflik. Selesaikan secara manual."
    T_FETCH_OK="Fetch selesai."
    T_RESET_SOFT="Reset soft ke '%s'."
    T_RESET_HARD="Reset hard ke '%s'."
    T_SQUASH_DONE="Squash selesai."
    T_REBASE_DONE="Rebase selesai."
    T_REBASE_CONFLICT="Rebase konflik."
    T_CHERRY_PICK_DONE="Commit di-cherry-pick."
    T_BISECT_START="Bisect dimulai."
    T_BISECT_GOOD="Commit ditandai good."
    T_BISECT_BAD="Commit ditandai bad."
    T_BISECT_RESET="Bisect direset."
    T_REPO_CREATE_OK="Repo GitHub '%s' dibuat."
    T_REPO_CREATE_FAIL="Gagal membuat repo."
    T_CLONE_OK="Clone selesai."
    T_CLONE_FAIL="Clone gagal."
    T_GIST_CREATED="Gist dibuat."
    T_GIST_EDITED="Gist diedit."
    T_GIST_DELETED="Gist dihapus."
    T_ISSUE_CREATED="Issue dibuat."
    T_ISSUE_CLOSED="Issue #%s ditutup."
    T_PR_CREATED="PR dibuat."
    T_PR_MERGED="PR #%s di-merge."
    T_PR_CHECKOUT="Checkout PR #%s."
    T_PR_REVIEWED="Review PR #%s."
    T_RELEASE_CREATED="Release '%s' dibuat."
    T_RELEASE_DELETED="Release '%s' dihapus."
    T_ACTIONS_WATCH="Memantau run #%s."
    T_ACTIONS_TRIGGER="Workflow '%s' di-trigger."
    T_BACKUP_DONE="Backup selesai."
    T_STATS_COMMIT_BY="Commit oleh %s:"
    T_STATS_LINES="Total baris kode:"
    T_STATS_LANG="Bahasa dominan:"
    T_DAEMON_START="Daemon Gitzen berjalan (sinkronisasi tiap %s detik)..."
    T_WEBHOOK_OK="Webhook terkirim."
    T_WEBHOOK_FAIL="Webhook gagal."
    T_KEYGEN_OK="Kunci dibuat: %s"
    T_KEYGEN_FAIL="Gagal membuat kunci."
    T_CONFIG_SET="%s disetel ke %s."
    T_CONFIG_SET_FAIL="Gagal menyetel %s."
    T_CONFIG_REMOTE_OK="Remote dikonfigurasi."
    T_UNDO_COMMIT="Commit terakhir dibatalkan (file aman)."
    T_UNDO_FILE="File '%s' dikembalikan."
    T_UNDO_HARD="Semua perubahan dibuang."
    T_SETUP_DONE="Setup selesai. Coba: gitzen help"
    T_ALREADY_LOGIN="Sudah login ke GitHub."
    T_LOGIN_PROMPT="Silakan login ke GitHub:"
    T_CONFIRM_RESET_HARD="Hard reset akan menghapus perubahan lokal."
    T_CONFIRM_UNDO_HARD="Undo hard akan menghapus semua perubahan lokal."
    T_DAEMON_RUNNING="Daemon sudah berjalan."
    T_INVALID_BRANCH="Detached HEAD atau branch tidak valid."
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

    T_STASH_SAVED="Changes saved."
    T_STASH_POPPED="Stash popped."
    T_STASH_DROPPED="Stash dropped."
    T_TAG_CREATED="Tag '%s' created."
    T_TAG_DELETED="Tag '%s' deleted."
    T_TAG_PUSHED="Tags pushed."
    T_REMOTE_ADDED="Remote '%s' added."
    T_REMOTE_UPDATED="Remote '%s' updated."
    T_REMOTE_DELETED="Remote '%s' deleted."
    T_REPO_INIT="Repo '%s' initialized. Add remote: gitzen remote add origin <url>"
    T_BRANCH_CREATED="Branch '%s' created."
    T_BRANCH_SWITCHED="Switched to '%s'."
    T_BRANCH_DELETED="Branch '%s' deleted."
    T_BRANCH_RENAMED="Branch '%s' renamed to '%s'."
    T_MERGE_OK="Merge successful."
    T_MERGE_CONFLICT="Merge conflict. Resolve manually."
    T_FETCH_OK="Fetch complete."
    T_RESET_SOFT="Soft reset to '%s'."
    T_RESET_HARD="Hard reset to '%s'."
    T_SQUASH_DONE="Squash complete."
    T_REBASE_DONE="Rebase complete."
    T_REBASE_CONFLICT="Rebase conflict."
    T_CHERRY_PICK_DONE="Commit cherry-picked."
    T_BISECT_START="Bisect started."
    T_BISECT_GOOD="Commit marked good."
    T_BISECT_BAD="Commit marked bad."
    T_BISECT_RESET="Bisect reset."
    T_REPO_CREATE_OK="GitHub repo '%s' created."
    T_REPO_CREATE_FAIL="Failed to create repo."
    T_CLONE_OK="Clone complete."
    T_CLONE_FAIL="Clone failed."
    T_GIST_CREATED="Gist created."
    T_GIST_EDITED="Gist edited."
    T_GIST_DELETED="Gist deleted."
    T_ISSUE_CREATED="Issue created."
    T_ISSUE_CLOSED="Issue #%s closed."
    T_PR_CREATED="PR created."
    T_PR_MERGED="PR #%s merged."
    T_PR_CHECKOUT="Checked out PR #%s."
    T_PR_REVIEWED="Reviewed PR #%s."
    T_RELEASE_CREATED="Release '%s' created."
    T_RELEASE_DELETED="Release '%s' deleted."
    T_ACTIONS_WATCH="Watching run #%s."
    T_ACTIONS_TRIGGER="Workflow '%s' triggered."
    T_BACKUP_DONE="Backup finished."
    T_STATS_COMMIT_BY="Commits by %s:"
    T_STATS_LINES="Total lines of code:"
    T_STATS_LANG="Dominant language:"
    T_DAEMON_START="Gitzen daemon running (sync every %s seconds)..."
    T_WEBHOOK_OK="Webhook sent."
    T_WEBHOOK_FAIL="Webhook failed."
    T_KEYGEN_OK="Key created: %s"
    T_KEYGEN_FAIL="Failed to create key."
    T_CONFIG_SET="%s set to %s."
    T_CONFIG_SET_FAIL="Failed to set %s."
    T_CONFIG_REMOTE_OK="Remote configured."
    T_UNDO_COMMIT="Last commit undone (files kept)."
    T_UNDO_FILE="File '%s' restored."
    T_UNDO_HARD="All changes discarded."
    T_SETUP_DONE="Setup complete. Try: gitzen help"
    T_ALREADY_LOGIN="Already logged into GitHub."
    T_LOGIN_PROMPT="Please login to GitHub:"
    T_CONFIRM_RESET_HARD="Hard reset will discard local changes."
    T_CONFIRM_UNDO_HARD="Hard undo will discard all local changes."
    T_DAEMON_RUNNING="Daemon is already running."
    T_INVALID_BRANCH="Detached HEAD or invalid branch."
fi

# ==================== UI FUNCTIONS ====================
info()  { echo "[INFO] $*"; }
ok()    { echo "[OK] $*"; }
fail()  { echo "[FAIL] $*" >&2; }

run() {
    local success_message="$1"
    shift

    "$@"
    ok "$success_message"
}

confirm() {
    local prompt="$1"
    read -r -p "$prompt [y/N]: " answer
    [[ "$answer" =~ ^[Yy]$ ]]
}

get_current_branch() {
    local branch
    branch="$(git symbolic-ref --short HEAD 2>/dev/null || true)"

    if [ -z "$branch" ]; then
        fail "$T_INVALID_BRANCH"
        exit 1
    fi

    echo "$branch"
}

banner() {
    echo ""
    echo "╭────────────────────────────────────────────────╮"
    echo "│  Gitzen v5.0 — Cross-Platform CLI Assistant"
    echo "│ Developer By: Ziferd"
    echo "╰────────────────────────────────────────────────╯"
    echo ""
}

# ==================== ENVIRONMENT DETECTION ====================
is_termux() { [ -n "${TERMUX_VERSION:-}" ]; }
detect_os() {
    local os="unknown"
    case "$(uname -s)" in
        Linux)
            if is_termux; then os="termux"
            else os="linux"
            fi ;;
        Darwin) os="macos" ;;
    esac
    echo "$os"
}
OS="$(detect_os)"

# ==================== DEPENDENCY INSTALLER ====================
install_deps() {
    local pkgs=("git" "gh" "jq" "curl" "openssh")
    
    info "Detecting package manager & installing dependencies..."

    if is_termux; then
        pkg update -y -qq && pkg upgrade -y -qq
        pkg install -y "${pkgs[@]}"
    elif command -v apt >/dev/null; then
        sudo apt update -qq && sudo apt install -y "${pkgs[@]}"
    elif command -v pacman >/dev/null; then
        sudo pacman -Syu --noconfirm "${pkgs[@]}"
    elif command -v brew >/dev/null; then
        brew install "${pkgs[@]}"
    elif command -v dnf >/dev/null; then
        sudo dnf install -y "${pkgs[@]}"
    else
        fail "Unsupported package manager. Install manually: git, gh, jq, curl, openssh"
        return 1
    fi

    ok "Dependencies installed."

    if ! gh auth status &>/dev/null; then
        info "$T_LOGIN_PROMPT"
        gh auth login
    else
        ok "$T_ALREADY_LOGIN"
    fi
    ok "$T_SETUP_DONE"
}

# ==================== VALIDATION ====================
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

# ==================== CORE COMMANDS ====================
cmd_deploy() {
    local message="${1:-"deploy: $(date)"}"
    local branch="${2:-$(get_current_branch)}"
    check_git || return 1
    info "$T_DEPLOY_START '$branch'..."
    git add . 2>/dev/null && ok "$T_FILE_STAGED" || fail "$T_FILE_STAGE_FAILED"
    if git diff --cached --quiet 2>/dev/null; then
        info "$T_NO_CHANGES"
    else
        git commit -m "$message" && ok "$T_COMMIT_OK $message" || fail "$T_COMMIT_FAILED"
    fi
    info "$T_PULL_INFO"
    git pull origin "$branch" --rebase && ok "$T_PULL_OK" || info "$T_PULL_SKIP"
    info "$T_PUSH_INFO"
    git push origin "$branch" && ok "$T_PUSH_OK" || fail "$T_PUSH_FAILED"
    ok "$T_DEPLOY_DONE"
}

cmd_push() {
    local branch="${1:-$(get_current_branch)}"
    check_git || return 1
    git push origin "$branch" && ok "Push ke '$branch' berhasil." || fail "Push gagal."
}

cmd_pull() {
    local branch="${1:-$(get_current_branch)}"
    check_git || return 1
    git pull origin "$branch" && ok "Pull dari '$branch' berhasil." || fail "Pull gagal."
}

cmd_sync() {
    local branch="${1:-$(get_current_branch)}"
    check_git || return 1
    git pull origin "$branch" --rebase && ok "$T_PULL_OK" || info "$T_PULL_SKIP"
    git add . 2>/dev/null
    git commit -m "sync: $(date)" 2>/dev/null || info "$T_NO_CHANGES"
    git push origin "$branch" && ok "$T_PUSH_OK" || fail "$T_PUSH_FAILED"
    ok "$T_SYNC_OK"
}

cmd_status() {
    check_git || return 1
    git status
    echo ""
    info "Branch: $(get_current_branch)"
    info "Remote: $(git remote get-url origin 2>/dev/null || echo 'tidak disetel')"
}

cmd_log() { check_git || return 1; git log --oneline --graph --decorate --all -20; }
cmd_diff() { check_git || return 1; git diff "${1:-HEAD}"; }

cmd_stash() {
    check_git || return 1
    case "${1:-list}" in
        list) git stash list ;;
        save) git stash push -m "${2:-"stash: $(date)"}" && ok "$T_STASH_SAVED" ;;
        pop)  git stash pop && ok "$T_STASH_POPPED" ;;
        drop) git stash drop "${2:-0}" && ok "$T_STASH_DROPPED" ;;
        *)    fail "Gunakan: list, save [pesan], pop, drop" ;;
    esac
}

cmd_tag() {
    check_git || return 1
    case "${1:-list}" in
        list)   git tag -l ;;
        create) local t="$2"; [ -z "$t" ] && { fail "Nama tag diperlukan."; return 1; }
                git tag "$t" && ok "$(printf "$T_TAG_CREATED" "$t")" ;;
        push)   git push --tags && ok "$T_TAG_PUSHED" ;;
        delete) local t="$2"; [ -z "$t" ] && { fail "Nama tag diperlukan."; return 1; }
                git tag -d "$t" 2>/dev/null && git push origin --delete "$t" 2>/dev/null && ok "$(printf "$T_TAG_DELETED" "$t")" ;;
        *)      fail "Gunakan: list, create <nama>, push, delete <nama>" ;;
    esac
}

cmd_remote() {
    check_git || return 1
    case "${1:-show}" in
        show)   git remote -v ;;
        add)    [ -z "$3" ] && { fail "Gunakan: gitzen remote add <nama> <url>"; return 1; }
                git remote add "$2" "$3" && ok "$(printf "$T_REMOTE_ADDED" "$2")" ;;
        set)    [ -z "$3" ] && { fail "Gunakan: gitzen remote set <nama> <url>"; return 1; }
                git remote set-url "$2" "$3" && ok "$(printf "$T_REMOTE_UPDATED" "$2")" ;;
        delete) [ -z "$2" ] && { fail "Nama remote diperlukan."; return 1; }
                git remote remove "$2" && ok "$(printf "$T_REMOTE_DELETED" "$2")" ;;
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
    ok "$(printf "$T_REPO_INIT" "$name")"
}

cmd_branch() {
    check_git || return 1
    case "${1:-list}" in
        list)   git branch -a ;;
        create) [ -z "$2" ] && { fail "Gunakan: gitzen branch create <nama>"; return 1; }
                git checkout -b "$2" && ok "$(printf "$T_BRANCH_CREATED" "$2")" ;;
        switch) [ -z "$2" ] && { fail "Gunakan: gitzen branch switch <nama>"; return 1; }
                git checkout "$2" && ok "$(printf "$T_BRANCH_SWITCHED" "$2")" ;;
        delete) [ -z "$2" ] && { fail "Gunakan: gitzen branch delete <nama>"; return 1; }
                git branch -d "$2" 2>/dev/null && ok "$(printf "$T_BRANCH_DELETED" "$2")" || fail "Gagal menghapus branch." ;;
        rename) [ -z "$2" ] || [ -z "$3" ] && { fail "Gunakan: gitzen branch rename <lama> <baru>"; return 1; }
                git branch -m "$2" "$3" && ok "$(printf "$T_BRANCH_RENAMED" "$2" "$3")" ;;
        *)      fail "Gunakan: list, create <nama>, switch <nama>, delete <nama>, rename <lama> <baru>" ;;
    esac
}

cmd_merge() {
    check_git || return 1
    [ -z "$1" ] && { fail "Gunakan: gitzen merge <branch>"; return 1; }
    git merge "$1" && ok "$T_MERGE_OK" || fail "$T_MERGE_CONFLICT"
}

cmd_fetch() { check_git || return 1; git fetch --all && ok "$T_FETCH_OK"; }

cmd_reset() {
    check_git || return 1
    local mode="${1:-soft}"
    local target="${2:-HEAD~1}"
    case "$mode" in
        soft) git reset --soft "$target" && ok "$(printf "$T_RESET_SOFT" "$target")" ;;
        hard)
            confirm "$T_CONFIRM_RESET_HARD" || exit 1
            git reset --hard "$target" && ok "$(printf "$T_RESET_HARD" "$target")"
            ;;
        *)    fail "Gunakan: gitzen reset [soft|hard] [target]" ;;
    esac
}

cmd_reflog() { check_git || return 1; git reflog -20; }
cmd_squash() {
    check_git || return 1
    local n="${1:-2}"
    git reset --soft HEAD~"$n" && git commit -m "squash: $n commits" && ok "$T_SQUASH_DONE"
}

cmd_rebase() {
    check_git || return 1
    local target="${1:-main}"
    git rebase "$target" && ok "$T_REBASE_DONE" || fail "$T_REBASE_CONFLICT"
}

cmd_cherrypick() {
    check_git || return 1
    [ -z "$1" ] && { fail "Gunakan: gitzen cherry-pick <commit>"; return 1; }
    git cherry-pick "$1" && ok "$T_CHERRY_PICK_DONE"
}

cmd_bisect() {
    check_git || return 1
    case "${1:-start}" in
        start) git bisect start && ok "$T_BISECT_START" ;;
        good)  git bisect good "${2:-HEAD}" && ok "$T_BISECT_GOOD" ;;
        bad)   git bisect bad "${2:-HEAD}" && ok "$T_BISECT_BAD" ;;
        reset) git bisect reset && ok "$T_BISECT_RESET" ;;
        *)     fail "Gunakan: start, good, bad, reset" ;;
    esac
}

# GitHub API wrappers
cmd_repo() {
    [ -z "$1" ] && { fail "Gunakan: gitzen repo <nama> [public|private]"; return 1; }
    gh repo create "$1" --"${2:-public}" --clone && ok "$(printf "$T_REPO_CREATE_OK" "$1")" || fail "$T_REPO_CREATE_FAIL"
}

cmd_clone() {
    [ -z "$1" ] && { fail "Gunakan: gitzen clone <user/repo>"; return 1; }
    gh repo clone "$1" && ok "$T_CLONE_OK" || fail "$T_CLONE_FAIL"
}

cmd_gist() {
    case "${1:-list}" in
        list)   gh gist list ;;
        create) [ -z "$2" ] && { fail "Gunakan: gitzen gist create <file>"; return 1; }
                gh gist create "$2" -d "Gist from Gitzen" && ok "$T_GIST_CREATED" ;;
        edit)   [ -z "$2" ] && { fail "Gunakan: gitzen gist edit <id>"; return 1; }
                gh gist edit "$2" && ok "$T_GIST_EDITED" ;;
        delete) [ -z "$2" ] && { fail "Gunakan: gitzen gist delete <id>"; return 1; }
                gh gist delete "$2" && ok "$T_GIST_DELETED" ;;
        *)      fail "Gunakan: list, create <file>, edit <id>, delete <id>" ;;
    esac
}

cmd_issue() {
    case "${1:-list}" in
        list)   gh issue list ;;
        create) [ -z "$2" ] && { fail "Gunakan: gitzen issue create '<judul>'"; return 1; }
                gh issue create -t "$2" && ok "$T_ISSUE_CREATED" ;;
        close)  [ -z "$2" ] && { fail "Gunakan: gitzen issue close <nomor>"; return 1; }
                gh issue close "$2" && ok "$(printf "$T_ISSUE_CLOSED" "$2")" ;;
        view)   [ -z "$2" ] && { fail "Gunakan: gitzen issue view <nomor>"; return 1; }
                gh issue view "$2" ;;
        *)      fail "Gunakan: list, create <judul>, close <nomor>, view <nomor>" ;;
    esac
}

cmd_pr() {
    case "${1:-list}" in
        list)     gh pr list ;;
        create)   [ -z "$2" ] && { fail "Gunakan: gitzen pr create '<judul>'"; return 1; }
                  gh pr create -t "$2" && ok "$T_PR_CREATED" ;;
        merge)    [ -z "$2" ] && { fail "Gunakan: gitzen pr merge <nomor>"; return 1; }
                  gh pr merge "$2" && ok "$(printf "$T_PR_MERGED" "$2")" ;;
        checkout) [ -z "$2" ] && { fail "Gunakan: gitzen pr checkout <nomor>"; return 1; }
                  gh pr checkout "$2" && ok "$(printf "$T_PR_CHECKOUT" "$2")" ;;
        review)   [ -z "$2" ] && { fail "Gunakan: gitzen pr review <nomor>"; return 1; }
                  gh pr review "$2" && ok "$(printf "$T_PR_REVIEWED" "$2")" ;;
        *)        fail "Gunakan: list, create <judul>, merge <nomor>, checkout <nomor>, review <nomor>" ;;
    esac
}

cmd_release() {
    case "${1:-list}" in
        list)   gh release list ;;
        create) [ -z "$2" ] && { fail "Gunakan: gitzen release create <tag>"; return 1; }
                gh release create "$2" && ok "$(printf "$T_RELEASE_CREATED" "$2")" ;;
        delete) [ -z "$2" ] && { fail "Gunakan: gitzen release delete <tag>"; return 1; }
                gh release delete "$2" && ok "$(printf "$T_RELEASE_DELETED" "$2")" ;;
        *)      fail "Gunakan: list, create <tag>, delete <tag>" ;;
    esac
}

cmd_actions() {
    case "${1:-list}" in
        list)    gh run list ;;
        watch)   [ -z "$2" ] && { fail "Gunakan: gitzen actions watch <run_id>"; return 1; }
                 gh run watch "$2" && ok "$(printf "$T_ACTIONS_WATCH" "$2")" ;;
        trigger) [ -z "$2" ] && { fail "Gunakan: gitzen actions trigger <workflow>"; return 1; }
                 gh workflow run "$2" && ok "$(printf "$T_ACTIONS_TRIGGER" "$2")" ;;
        *)       fail "Gunakan: list, watch <id>, trigger <workflow>" ;;
    esac
}

cmd_backup() {
    local dest="${1:-$HOME/gitzen-backups}"
    mkdir -p "$dest"
    info "Backing up all repos to $dest..."
    gh repo list --json nameWithOwner --jq '.[].nameWithOwner' | while read -r r; do
        local dir="$dest/$(echo "$r" | cut -d/ -f2)"
        if [ -d "$dir" ]; then git -C "$dir" pull &>/dev/null; else gh repo clone "$r" "$dir" &>/dev/null; fi
    done
    ok "$T_BACKUP_DONE"
}

cmd_stats() {
    echo "$(printf "$T_STATS_COMMIT_BY" "$(git config user.name)")"
    git shortlog -sn --all | head -10
    echo "$T_STATS_LINES"
    git ls-files | xargs wc -l 2>/dev/null | tail -1
    echo "$T_STATS_LANG"
    git ls-files | sed 's/.*\.//' | sort | uniq -c | sort -rn | head -5
}

cmd_daemon() {
    local int="${1:-600}"
    info "$(printf "$T_DAEMON_START" "$int")"
    while true; do cmd_sync; sleep "$int"; done
}

cmd_webhook() {
    [ -z "$WEBHOOK_URL" ] && { fail "Setel WEBHOOK_URL terlebih dahulu."; return 1; }
    curl -s -X POST "$WEBHOOK_URL" -H "Content-Type: application/json" \
      -d '{"event":"ping","tool":"gitzen","timestamp":"'"$(date -Iseconds)"'"}' && ok "$T_WEBHOOK_OK" || fail "$T_WEBHOOK_FAIL"
}

cmd_keygen() {
    local email="${1:-gitzen@termux.local}"
    local key="$HOME/.ssh/id_ed25519_gitzen"
    mkdir -p "$HOME/.ssh"
    ssh-keygen -t ed25519 -C "$email" -f "$key" -N "" -q && ok "$(printf "$T_KEYGEN_OK" "$key")" || fail "$T_KEYGEN_FAIL"
    info "Public key:"
    cat "$key.pub"
}

# ==================== BUG FIX: cmd_config ====================
cmd_config() {
    case "${1:-show}" in
        show)   git config --list ;;
        set)    if [ $# -lt 3 ]; then
                    if [ "$GITZEN_LANG" = "id" ]; then
                        fail "Gunakan: gitzen config set <key> <value>"
                    else
                        fail "Usage: gitzen config set <key> <value>"
                    fi
                    return 1
                fi
                git config --global "$2" "$3" && ok "$(printf "$T_CONFIG_SET" "$2" "$3")" || fail "$(printf "$T_CONFIG_SET_FAIL" "$2")"
                ;;
        remote) [ -z "$2" ] && { fail "Gunakan: gitzen config remote <url>"; return 1; }
                git remote add origin "$2" 2>/dev/null || git remote set-url origin "$2"
                ok "$T_CONFIG_REMOTE_OK" ;;
        *)      fail "Gunakan: show, set <key> <value>, remote <url>" ;;
    esac
}

cmd_undo() {
    case "${1:-commit}" in
        commit) git reset --soft HEAD~1 && ok "$T_UNDO_COMMIT" ;;
        file)   [ -z "$2" ] && { fail "Gunakan: gitzen undo file <nama>"; return 1; }
                git restore -- "$2" && ok "$(printf "$T_UNDO_FILE" "$2")" ;;
        hard)
            confirm "$T_CONFIRM_UNDO_HARD" || exit 1
            git reset --hard HEAD && ok "$T_UNDO_HARD"
            ;;
        *)      fail "Gunakan: commit, file <nama>, hard" ;;
    esac
}

# ==================== SETUP & HELP ====================
cmd_setup() {
    install_deps
}

cmd_help() {
    echo ""
    if [ "$GITZEN_LANG" = "id" ]; then
        echo "╔═══════════【★】「 GITZEN v5.0 (Cross-Platform) 」【★】"
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
        if is_termux; then
            echo "║ • export GITZEN_LANG=id untuk Bahasa Indonesia"
            echo "║ • export WEBHOOK_URL=\"https://...\" untuk notifikasi"
        else
            echo "║ • export GITZEN_LANG=id for Indonesian"
            echo "║ • export WEBHOOK_URL=\"https://...\" for notifications"
        fi
        echo "╚═══════════【★】"
    else
        echo "╔═══════════【★】「 GITZEN v5.0 (Cross-Platform) 」【★】"
        echo "║ GitHub CLI Assistant"
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
        if is_termux; then
            echo "║ • export GITZEN_LANG=id for Indonesian"
            echo "║ • export WEBHOOK_URL=\"https://...\" for notifications"
        else
            echo "║ • export GITZEN_LANG=id for Indonesian"
            echo "║ • export WEBHOOK_URL=\"https://...\" for notifications"
        fi
        echo "╚═══════════【★】"
    fi
    echo ""
}

# ==================== MAIN DISPATCHER ====================
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