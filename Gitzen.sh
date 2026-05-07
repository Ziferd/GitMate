#!/data/data/com.termux/files/usr/bin/bash
# ============================================================
# Gitzen v4.0 — GitHub CLI Assistant for Termux
# Developer By: Ziferd
# Bilingual (EN / ID) — set GITZEN_LANG=id for Indonesian
# ============================================================

set -euo pipefail

GITZEN_LANG="${GITZEN_LANG:-en}"

# Translation tables
if [ "$GITZEN_LANG" = "id" ]; then
    T_DEPENDENCIES_OK="Semua dependensi terpenuhi!"
    T_DEPENDENCIES_MISSING="Dependensi berikut belum terinstall:"
    T_RUN_SETUP="Jalankan: gitzen setup"
    T_NOT_GIT_REPO="Bukan repositori Git. Jalankan 'git init' atau clone repo dulu."
    T_DEPLOY_START="Deploy ke branch"
    T_FILE_STAGED="File di-stage."
    T_FILE_STAGE_FAILED="Gagal stage file."
    T_NO_CHANGES="Ga ada perubahan, skip commit."
    T_COMMIT_OK="Commit:"
    T_COMMIT_FAILED="Gagal commit."
    T_PULL_INFO="Pull dulu biar ga konflik..."
    T_PULL_OK="Pull oke."
    T_PULL_SKIP="Pull skip."
    T_PUSH_INFO="Push ke remote..."
    T_PUSH_OK="Push berhasil!"
    T_PUSH_FAILED="Push gagal."
    T_WEBHOOK_OK="Webhook terkirim."
    T_WEBHOOK_FAILED="Webhook gagal."
    T_DEPLOY_DONE="Deploy selesai!"
    T_PUSH_OK_BRANCH="Push ke"
    T_PUSH_OK_BRANCH_END="berhasil!"
    T_PULL_OK_BRANCH="Pull dari"
    T_PULL_OK_BRANCH_END="berhasil!"
    T_SYNC_DONE="Sync selesai!"
    T_BRANCH_CURRENT="Branch:"
    T_REMOTE_CURRENT="Remote:"
    T_STASH_SAVED="Perubahan disimpan."
    T_STASH_POPPED="Stash dikeluarin."
    T_STASH_DROPPED="Stash dihapus."
    T_TAG_CREATED="Tag"
    T_TAG_CREATED_END="dibuat."
    T_TAG_DELETED="Tag"
    T_TAG_DELETED_END="dihapus."
    T_TAG_PUSHED="Tag di-push."
    T_REMOTE_ADDED="Remote"
    T_REMOTE_ADDED_END="ditambahkan."
    T_REMOTE_UPDATED="Remote diupdate."
    T_REMOTE_DELETED="Remote dihapus."
    T_REPO_INIT="Repo dibuat. Tinggal tambah remote: gitzen remote add origin <url>"
    T_BRANCH_CREATED="Branch"
    T_BRANCH_CREATED_END="dibuat."
    T_BRANCH_SWITCHED="Pindah ke"
    T_BRANCH_DELETED="Branch"
    T_BRANCH_DELETED_END="dihapus."
    T_BRANCH_RENAMED="Branch"
    T_BRANCH_RENAMED_END="jadi"
    T_MERGE_INFO="Merge"
    T_MERGE_INFO_END="ke"
    T_MERGE_OK="Merge berhasil!"
    T_MERGE_CONFLICT="Merge konflik, selesaikan dulu."
    T_FETCH_OK="Fetch selesai."
    T_RESET_SOFT="Reset soft ke"
    T_RESET_HARD="Reset hard ke"
    T_RESET_SOFT_END="berhasil."
    T_RESET_HARD_END="berhasil."
    T_SQUASH_DONE="Squash selesai."
    T_REBASE_DONE="Rebase selesai."
    T_REBASE_CONFLICT="Rebase konflik."
    T_CHERRY_PICK_DONE="Commit di-cherry-pick."
    T_BISECT_START="Bisect dimulai."
    T_BISECT_GOOD="Commit ditandai good."
    T_BISECT_BAD="Commit ditandai bad."
    T_BISECT_RESET="Bisect direset."
    T_REPO_CREATE="Bikin repo"
    T_REPO_CREATE_END="..."
    T_REPO_READY="Repo siap!"
    T_CLONE_OK="Clone selesai!"
    T_GIST_CREATED="Gist dibuat."
    T_GIST_EDITED="Gist diedit."
    T_GIST_DELETED="Gist dihapus."
    T_ISSUE_CREATED="Issue dibuat."
    T_ISSUE_CLOSED="Issue ditutup."
    T_PR_CREATED="PR dibuat."
    T_PR_MERGED="PR di-merge."
    T_PR_CHECKOUT="Checkout PR."
    T_PR_REVIEWED="Review PR."
    T_RELEASE_CREATED="Release dibuat."
    T_RELEASE_DELETED="Release dihapus."
    T_ACTIONS_WATCH="Menonton run."
    T_ACTIONS_TRIGGER="Workflow dijalankan."
    T_BACKUP_DONE="Backup selesai."
    T_STATS_COMMIT_BY="Commit oleh"
    T_STATS_LINES="Total baris kode:"
    T_STATS_LANG="Bahasa dominan:"
    T_DAEMON_START="Gitzen daemon jalan (sync tiap"
    T_DAEMON_START_END="detik)..."
    T_WEBHOOK_TEST="Webhook terkirim."
    T_KEYGEN_OK="Key dibuat:"
    T_CONFIG_SET="diatur."
    T_CONFIG_REMOTE_OK="Remote diatur."
    T_UNDO_COMMIT="Commit terakhir dibatalkan (file aman)."
    T_UNDO_FILE="dikembalikan."
    T_UNDO_HARD="Semua perubahan dibuang."
    T_SETUP_DONE="Setup selesai. Coba: gitzen help"
    T_LOGIN_GH="Udah login GitHub."
    T_LOGIN_GH_PROMPT="Login ke GitHub:"
    T_HELP_LINE="Ketik 'gitzen help' buat liat daftar perintah."
    T_FAIL_UNKNOWN="Perintah ga dikenal:"
else
    T_DEPENDENCIES_OK="All dependencies satisfied!"
    T_DEPENDENCIES_MISSING="Missing dependencies:"
    T_RUN_SETUP="Run: gitzen setup"
    T_NOT_GIT_REPO="Not a Git repository. Run 'git init' or clone first."
    T_DEPLOY_START="Deploy to branch"
    T_FILE_STAGED="Files staged."
    T_FILE_STAGE_FAILED="Failed to stage files."
    T_NO_CHANGES="No changes, skipping commit."
    T_COMMIT_OK="Commit:"
    T_COMMIT_FAILED="Commit failed."
    T_PULL_INFO="Pulling to avoid conflicts..."
    T_PULL_OK="Pull ok."
    T_PULL_SKIP="Pull skipped."
    T_PUSH_INFO="Pushing to remote..."
    T_PUSH_OK="Push successful!"
    T_PUSH_FAILED="Push failed."
    T_WEBHOOK_OK="Webhook sent."
    T_WEBHOOK_FAILED="Webhook failed."
    T_DEPLOY_DONE="Deploy finished!"
    T_PUSH_OK_BRANCH="Pushed to"
    T_PUSH_OK_BRANCH_END="successfully!"
    T_PULL_OK_BRANCH="Pulled from"
    T_PULL_OK_BRANCH_END="successfully!"
    T_SYNC_DONE="Sync complete!"
    T_BRANCH_CURRENT="Branch:"
    T_REMOTE_CURRENT="Remote:"
    T_STASH_SAVED="Changes stashed."
    T_STASH_POPPED="Stash popped."
    T_STASH_DROPPED="Stash dropped."
    T_TAG_CREATED="Tag"
    T_TAG_CREATED_END="created."
    T_TAG_DELETED="Tag"
    T_TAG_DELETED_END="deleted."
    T_TAG_PUSHED="Tags pushed."
    T_REMOTE_ADDED="Remote"
    T_REMOTE_ADDED_END="added."
    T_REMOTE_UPDATED="Remote updated."
    T_REMOTE_DELETED="Remote deleted."
    T_REPO_INIT="Repo initialized. Add remote: gitzen remote add origin <url>"
    T_BRANCH_CREATED="Branch"
    T_BRANCH_CREATED_END="created."
    T_BRANCH_SWITCHED="Switched to"
    T_BRANCH_DELETED="Branch"
    T_BRANCH_DELETED_END="deleted."
    T_BRANCH_RENAMED="Branch"
    T_BRANCH_RENAMED_END="renamed to"
    T_MERGE_INFO="Merging"
    T_MERGE_INFO_END="into"
    T_MERGE_OK="Merge successful!"
    T_MERGE_CONFLICT="Merge conflict, resolve manually."
    T_FETCH_OK="Fetch complete."
    T_RESET_SOFT="Soft reset to"
    T_RESET_HARD="Hard reset to"
    T_RESET_SOFT_END="successful."
    T_RESET_HARD_END="successful."
    T_SQUASH_DONE="Squash complete."
    T_REBASE_DONE="Rebase complete."
    T_REBASE_CONFLICT="Rebase conflict."
    T_CHERRY_PICK_DONE="Commit cherry-picked."
    T_BISECT_START="Bisect started."
    T_BISECT_GOOD="Commit marked good."
    T_BISECT_BAD="Commit marked bad."
    T_BISECT_RESET="Bisect reset."
    T_REPO_CREATE="Creating repo"
    T_REPO_CREATE_END="..."
    T_REPO_READY="Repo ready!"
    T_CLONE_OK="Clone complete!"
    T_GIST_CREATED="Gist created."
    T_GIST_EDITED="Gist edited."
    T_GIST_DELETED="Gist deleted."
    T_ISSUE_CREATED="Issue created."
    T_ISSUE_CLOSED="Issue closed."
    T_PR_CREATED="PR created."
    T_PR_MERGED="PR merged."
    T_PR_CHECKOUT="PR checked out."
    T_PR_REVIEWED="PR reviewed."
    T_RELEASE_CREATED="Release created."
    T_RELEASE_DELETED="Release deleted."
    T_ACTIONS_WATCH="Watching run."
    T_ACTIONS_TRIGGER="Workflow triggered."
    T_BACKUP_DONE="Backup finished."
    T_STATS_COMMIT_BY="Commits by"
    T_STATS_LINES="Total lines of code:"
    T_STATS_LANG="Dominant language:"
    T_DAEMON_START="Gitzen daemon running (sync every"
    T_DAEMON_START_END="seconds)..."
    T_WEBHOOK_TEST="Webhook responded."
    T_KEYGEN_OK="Key created:"
    T_CONFIG_SET="set."
    T_CONFIG_REMOTE_OK="Remote configured."
    T_UNDO_COMMIT="Last commit undone (files kept)."
    T_UNDO_FILE="restored."
    T_UNDO_HARD="All changes discarded."
    T_SETUP_DONE="Setup complete. Try: gitzen help"
    T_LOGIN_GH="Already logged into GitHub."
    T_LOGIN_GH_PROMPT="Login to GitHub:"
    T_HELP_LINE="Type 'gitzen help' for command list."
    T_FAIL_UNKNOWN="Unknown command:"
fi

info() { echo -e "\033[1;36m[INFO]\033[0m  $*"; }
ok()   { echo -e "\033[1;32m[OK]\033[0m    $*"; }
fail() { echo -e "\033[1;31m[FAIL]\033[0m  $*"; }

banner() {
    echo ""
    echo -e "\033[1;36m  Gitzen v4.0\033[0m - GitHub CLI Assistant for Termux"
    echo "  Developer By: Ziferd"
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

# Core Commands
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
    git push origin "$branch" && ok "$T_PUSH_OK_BRANCH $branch $T_PUSH_OK_BRANCH_END" || fail "$T_PUSH_FAILED"
}

cmd_pull() {
    local branch="${1:-$(git branch --show-current)}"
    check_git || return 1
    git pull origin "$branch" && ok "$T_PULL_OK_BRANCH $branch $T_PULL_OK_BRANCH_END" || fail "Pull failed."
}

cmd_sync() {
    local branch="${1:-$(git branch --show-current)}"
    check_git || return 1
    git pull origin "$branch" --rebase 2>/dev/null && ok "$T_PULL_OK" || info "$T_PULL_SKIP"
    git add . 2>/dev/null
    git commit -m "sync: $(date)" 2>/dev/null || info "$T_NO_CHANGES"
    git push origin "$branch" 2>/dev/null && ok "$T_PUSH_OK" || fail "$T_PUSH_FAILED"
    ok "$T_SYNC_DONE"
}

cmd_status() {
    check_git || return 1
    git status
    echo ""
    info "$T_BRANCH_CURRENT $(git branch --show-current)"
    info "$T_REMOTE_CURRENT $(git remote get-url origin 2>/dev/null || echo 'not set')"
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
        *)    fail "Usage: list, save [msg], pop, drop" ;;
    esac
}

cmd_tag() {
    check_git || return 1
    case "${1:-list}" in
        list)   git tag -l ;;
        create) local t="$2"; [ -z "$t" ] && { fail "Tag name required"; return 1; }
                git tag "$t" && ok "$T_TAG_CREATED $t $T_TAG_CREATED_END" ;;
        push)   git push --tags && ok "$T_TAG_PUSHED" ;;
        delete) local t="$2"; [ -z "$t" ] && { fail "Tag name required"; return 1; }
                git tag -d "$t" && git push origin --delete "$t" 2>/dev/null && ok "$T_TAG_DELETED $t $T_TAG_DELETED_END" ;;
        *)      fail "Usage: list, create <name>, push, delete <name>" ;;
    esac
}

cmd_remote() {
    check_git || return 1
    case "${1:-show}" in
        show)   git remote -v ;;
        add)    [ -z "$3" ] && { fail "Usage: gitzen remote add <name> <url>"; return 1; }
                git remote add "$2" "$3" && ok "$T_REMOTE_ADDED $2" ;;
        set)    [ -z "$3" ] && { fail "Usage: gitzen remote set <name> <url>"; return 1; }
                git remote set-url "$2" "$3" && ok "$T_REMOTE_UPDATED" ;;
        delete) [ -z "$2" ] && { fail "Usage: gitzen remote delete <name>"; return 1; }
                git remote remove "$2" && ok "$T_REMOTE_DELETED" ;;
        *)      fail "Usage: show, add, set, delete" ;;
    esac
}

cmd_init() {
    local name="${1:-my-project}"
    [ -d "$name" ] && { fail "Directory '$name' already exists."; return 1; }
    mkdir "$name" && cd "$name"
    git init
    echo "# $name" > README.md
    echo "node_modules/" > .gitignore
    git add . && git commit -m "init: first commit" 2>/dev/null
    ok "$T_REPO_INIT"
}

cmd_branch() {
    check_git || return 1
    case "${1:-list}" in
        list)   git branch -a ;;
        create) [ -z "$2" ] && { fail "Usage: gitzen branch create <name>"; return 1; }
                git checkout -b "$2" && ok "$T_BRANCH_CREATED '$2' $T_BRANCH_CREATED_END" ;;
        switch) [ -z "$2" ] && { fail "Usage: gitzen branch switch <name>"; return 1; }
                git checkout "$2" && ok "$T_BRANCH_SWITCHED '$2'" ;;
        delete) [ -z "$2" ] && { fail "Usage: gitzen branch delete <name>"; return 1; }
                git branch -d "$2" 2>/dev/null && ok "$T_BRANCH_DELETED '$2' $T_BRANCH_DELETED_END" ;;
        rename) [ -z "$2" ] || [ -z "$3" ] && { fail "Usage: gitzen branch rename <old> <new>"; return 1; }
                git branch -m "$2" "$3" && ok "$T_BRANCH_RENAMED '$2' $T_BRANCH_RENAMED_END '$3'" ;;
        *)      fail "Usage: list, create, switch, delete, rename" ;;
    esac
}

cmd_merge() {
    check_git || return 1
    [ -z "$1" ] && { fail "Usage: gitzen merge <branch>"; return 1; }
    git merge "$1" && ok "$T_MERGE_OK" || fail "$T_MERGE_CONFLICT"
}

cmd_fetch() { check_git || return 1; git fetch --all && ok "$T_FETCH_OK"; }

cmd_reset() {
    check_git || return 1
    local mode="${1:-soft}"
    local target="${2:-HEAD~1}"
    case "$mode" in
        soft) git reset --soft "$target" && ok "$T_RESET_SOFT $target $T_RESET_SOFT_END" ;;
        hard) git reset --hard "$target" && ok "$T_RESET_HARD $target $T_RESET_HARD_END" ;;
        *)    fail "Usage: gitzen reset [soft|hard] [commit]" ;;
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
    [ -z "$1" ] && { fail "Usage: gitzen cherry-pick <commit>"; return 1; }
    git cherry-pick "$1" && ok "$T_CHERRY_PICK_DONE"
}

cmd_bisect() {
    check_git || return 1
    case "${1:-start}" in
        start) git bisect start && ok "$T_BISECT_START" ;;
        good)  git bisect good "${2:-HEAD}" && ok "$T_BISECT_GOOD" ;;
        bad)   git bisect bad "${2:-HEAD}" && ok "$T_BISECT_BAD" ;;
        reset) git bisect reset && ok "$T_BISECT_RESET" ;;
        *)     fail "Usage: gitzen bisect start|good|bad|reset" ;;
    esac
}

# GitHub API
cmd_repo() {
    [ -z "$1" ] && { fail "Usage: gitzen repo <name> [public|private]"; return 1; }
    gh repo create "$1" --"${2:-public}" --clone && ok "$T_REPO_READY"
}

cmd_clone() {
    [ -z "$1" ] && { fail "Usage: gitzen clone <user/repo>"; return 1; }
    gh repo clone "$1" && ok "$T_CLONE_OK"
}

cmd_gist() {
    case "${1:-list}" in
        list)   gh gist list ;;
        create) [ -z "$2" ] && { fail "Usage: gitzen gist create <file>"; return 1; }
                gh gist create "$2" -d "Gist from Gitzen" && ok "$T_GIST_CREATED" ;;
        edit)   [ -z "$2" ] && { fail "Usage: gitzen gist edit <id>"; return 1; }
                gh gist edit "$2" && ok "$T_GIST_EDITED" ;;
        delete) [ -z "$2" ] && { fail "Usage: gitzen gist delete <id>"; return 1; }
                gh gist delete "$2" && ok "$T_GIST_DELETED" ;;
        *)      fail "Usage: list, create, edit, delete" ;;
    esac
}

cmd_issue() {
    case "${1:-list}" in
        list)   gh issue list ;;
        create) [ -z "$2" ] && { fail "Usage: gitzen issue create '<title>'"; return 1; }
                gh issue create -t "$2" && ok "$T_ISSUE_CREATED" ;;
        close)  [ -z "$2" ] && { fail "Usage: gitzen issue close <number>"; return 1; }
                gh issue close "$2" && ok "$T_ISSUE_CLOSED" ;;
        view)   [ -z "$2" ] && { fail "Usage: gitzen issue view <number>"; return 1; }
                gh issue view "$2" ;;
        *)      fail "Usage: list, create, close, view" ;;
    esac
}

cmd_pr() {
    case "${1:-list}" in
        list)     gh pr list ;;
        create)   [ -z "$2" ] && { fail "Usage: gitzen pr create '<title>'"; return 1; }
                  gh pr create -t "$2" && ok "$T_PR_CREATED" ;;
        merge)    [ -z "$2" ] && { fail "Usage: gitzen pr merge <number>"; return 1; }
                  gh pr merge "$2" && ok "$T_PR_MERGED" ;;
        checkout) [ -z "$2" ] && { fail "Usage: gitzen pr checkout <number>"; return 1; }
                  gh pr checkout "$2" && ok "$T_PR_CHECKOUT" ;;
        review)   [ -z "$2" ] && { fail "Usage: gitzen pr review <number>"; return 1; }
                  gh pr review "$2" && ok "$T_PR_REVIEWED" ;;
        *)        fail "Usage: list, create, merge, checkout, review" ;;
    esac
}

cmd_release() {
    case "${1:-list}" in
        list)   gh release list ;;
        create) [ -z "$2" ] && { fail "Usage: gitzen release create <tag>"; return 1; }
                gh release create "$2" && ok "$T_RELEASE_CREATED" ;;
        delete) [ -z "$2" ] && { fail "Usage: gitzen release delete <tag>"; return 1; }
                gh release delete "$2" && ok "$T_RELEASE_DELETED" ;;
        *)      fail "Usage: list, create, delete" ;;
    esac
}

cmd_actions() {
    case "${1:-list}" in
        list)    gh run list ;;
        watch)   [ -z "$2" ] && { fail "Usage: gitzen actions watch <run_id>"; return 1; }
                 gh run watch "$2" && ok "$T_ACTIONS_WATCH" ;;
        trigger) [ -z "$2" ] && { fail "Usage: gitzen actions trigger <workflow>"; return 1; }
                 gh workflow run "$2" && ok "$T_ACTIONS_TRIGGER" ;;
        *)       fail "Usage: list, watch, trigger" ;;
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
    echo "$T_STATS_COMMIT_BY $(git config user.name):"
    git shortlog -sn --all | head -10
    echo "$T_STATS_LINES"
    git ls-files | xargs wc -l 2>/dev/null | tail -1
    echo "$T_STATS_LANG"
    git ls-files | sed 's/.*\.//' | sort | uniq -c | sort -rn | head -5
}

cmd_daemon() {
    local int="${1:-600}"
    info "$T_DAEMON_START ${int}$T_DAEMON_START_END"
    while true; do cmd_sync; sleep "$int"; done
}

cmd_webhook() {
    [ -z "$WEBHOOK_URL" ] && { fail "Set WEBHOOK_URL first"; return 1; }
    curl -s -X POST "$WEBHOOK_URL" -H "Content-Type: application/json" \
      -d '{"event":"ping","tool":"gitzen","timestamp":"'"$(date -Iseconds)"'"}' && ok "$T_WEBHOOK_TEST"
}

cmd_keygen() {
    local email="${1:-gitzen@termux.local}"
    local key="$HOME/.ssh/id_ed25519_gitzen"
    mkdir -p "$HOME/.ssh"
    ssh-keygen -t ed25519 -C "$email" -f "$key" -N "" -q && ok "$T_KEYGEN_OK $key"
    info "Public key:"
    cat "$key.pub"
}

cmd_config() {
    case "${1:-show}" in
        show)   git config --list ;;
        set)    if [ $# -lt 2 ]; then
            fail "Usage: gitzen config set <key> <value>"
            return 1
        fi
        git config --global "$1" "$2" && ok "$1 $T_CONFIG_SET"
        ;;
        remote) [ -z "$2" ] && { fail "Usage: gitzen config remote <url>"; return 1; }
                git remote add origin "$2" 2>/dev/null || git remote set-url origin "$2"
                ok "$T_CONFIG_REMOTE_OK" ;;
        *)      fail "Usage: show, set, remote" ;;
    esac
}

cmd_undo() {
    case "${1:-commit}" in
        commit) git reset --soft HEAD~1 && ok "$T_UNDO_COMMIT" ;;
        file)   [ -z "$2" ] && { fail "Usage: gitzen undo file <name>"; return 1; }
                git checkout -- "$2" && ok "$2 $T_UNDO_FILE" ;;
        hard)   git reset --hard HEAD && ok "$T_UNDO_HARD" ;;
        *)      fail "Usage: commit, file, hard" ;;
    esac
}

cmd_setup() {
    pkg update -y -qq && pkg upgrade -y -qq
    pkg install -y git gh jq curl openssh -qq
    ok "Dependencies installed."
    if ! gh auth status &>/dev/null; then
        info "$T_LOGIN_GH_PROMPT"
        gh auth login
    else
        ok "$T_LOGIN_GH"
    fi
    ok "$T_SETUP_DONE"
}

# HELP COMMAND DENGAN TAMPILAN ZEONEBOT STYLE
cmd_help() {
    echo ""
    echo "╭───────────❍「 GITZEN v4.0 」❍"
    [ "$GITZEN_LANG" = "id" ] && echo "│ CLI Assistant untuk GitHub" || echo "│ GitHub CLI Assistant for Termux"
    echo "│ Developer By: Ziferd"
    echo "╰─────────────❍"
    echo ""

    echo "╭───────────❍「 PERINTAH DASAR 」❍"
    [ "$GITZEN_LANG" = "id" ] && echo "│ • gitzen deploy  \"pesan\" [branch]   → Stage, commit, push" || echo "│ • gitzen deploy  \"msg\" [branch]     → Stage, commit, push"
    [ "$GITZEN_LANG" = "id" ] && echo "│ • gitzen push    [branch]           → Push ke remote" || echo "│ • gitzen push    [branch]           → Push to remote"
    [ "$GITZEN_LANG" = "id" ] && echo "│ • gitzen pull    [branch]           → Pull dari remote" || echo "│ • gitzen pull    [branch]           → Pull from remote"
    [ "$GITZEN_LANG" = "id" ] && echo "│ • gitzen sync    [branch]           → Pull lalu push" || echo "│ • gitzen sync    [branch]           → Pull then push"
    [ "$GITZEN_LANG" = "id" ] && echo "│ • gitzen status                     → Status repo" || echo "│ • gitzen status                     → Repo status"
    [ "$GITZEN_LANG" = "id" ] && echo "│ • gitzen log                        → Riwayat commit" || echo "│ • gitzen log                        → Commit history"
    [ "$GITZEN_LANG" = "id" ] && echo "│ • gitzen diff                       → Perubahan" || echo "│ • gitzen diff                       → Changes"
    [ "$GITZEN_LANG" = "id" ] && echo "│ • gitzen stash list|save|pop|drop  → Simpan sementara" || echo "│ • gitzen stash list|save|pop|drop  → Temporary stash"
    [ "$GITZEN_LANG" = "id" ] && echo "│ • gitzen tag list|create|push|delete → Kelola tag" || echo "│ • gitzen tag list|create|push|delete → Manage tags"
    [ "$GITZEN_LANG" = "id" ] && echo "│ • gitzen remote show|add|set|delete → Kelola remote" || echo "│ • gitzen remote show|add|set|delete → Manage remotes"
    [ "$GITZEN_LANG" = "id" ] && echo "│ • gitzen init    [nama]             → Buat repo baru" || echo "│ • gitzen init    [name]             → Create new repo"
    echo "╰─────────────❍"
    echo ""

    echo "╭───────────❍「 BRANCH & MERGE 」❍"
    [ "$GITZEN_LANG" = "id" ] && echo "│ • gitzen branch list|create|switch|delete|rename → Kelola branch" || echo "│ • gitzen branch list|create|switch|delete|rename → Manage branches"
    [ "$GITZEN_LANG" = "id" ] && echo "│ • gitzen merge   <branch>           → Gabungkan branch" || echo "│ • gitzen merge   <branch>           → Merge branch"
    [ "$GITZEN_LANG" = "id" ] && echo "│ • gitzen fetch                      → Ambil metadata" || echo "│ • gitzen fetch                      → Fetch metadata"
    echo "╰─────────────❍"
    echo ""

    echo "╭───────────❍「 REWRITE HISTORY 」❍"
    [ "$GITZEN_LANG" = "id" ] && echo "│ • gitzen reset soft|hard [target]   → Reset ke commit" || echo "│ • gitzen reset soft|hard [target]   → Reset to commit"
    [ "$GITZEN_LANG" = "id" ] && echo "│ • gitzen reflog                     → Penyelamat HEAD" || echo "│ • gitzen reflog                     → HEAD recovery"
    [ "$GITZEN_LANG" = "id" ] && echo "│ • gitzen squash [jumlah]            → Gabung commit" || echo "│ • gitzen squash [count]            → Squash commits"
    [ "$GITZEN_LANG" = "id" ] && echo "│ • gitzen rebase [branch]            → Rebase" || echo "│ • gitzen rebase [branch]           → Rebase onto"
    [ "$GITZEN_LANG" = "id" ] && echo "│ • gitzen cherry-pick <commit>       → Ambil commit" || echo "│ • gitzen cherry-pick <commit>       → Pick commit"
    [ "$GITZEN_LANG" = "id" ] && echo "│ • gitzen bisect start|good|bad|reset → Cari bug" || echo "│ • gitzen bisect start|good|bad|reset → Find bug"
    echo "╰─────────────❍"
    echo ""

    echo "╭───────────❍「 GITHUB API 」❍"
    [ "$GITZEN_LANG" = "id" ] && echo "│ • gitzen repo  <name> [public|private] → Buat repo GitHub" || echo "│ • gitzen repo  <name> [public|private] → Create GitHub repo"
    [ "$GITZEN_LANG" = "id" ] && echo "│ • gitzen clone <user/repo>          → Clone repo" || echo "│ • gitzen clone <user/repo>          → Clone repo"
    [ "$GITZEN_LANG" = "id" ] && echo "│ • gitzen gist list|create|edit|delete → Kelola Gist" || echo "│ • gitzen gist list|create|edit|delete → Manage Gists"
    [ "$GITZEN_LANG" = "id" ] && echo "│ • gitzen issue list|create|close|view → Kelola Issue" || echo "│ • gitzen issue list|create|close|view → Manage Issues"
    [ "$GITZEN_LANG" = "id" ] && echo "│ • gitzen pr list|create|merge|checkout|review → Kelola PR" || echo "│ • gitzen pr list|create|merge|checkout|review → Manage PRs"
    [ "$GITZEN_LANG" = "id" ] && echo "│ • gitzen release list|create|delete → Kelola Release" || echo "│ • gitzen release list|create|delete → Manage Releases"
    [ "$GITZEN_LANG" = "id" ] && echo "│ • gitzen actions list|watch|trigger → GitHub Actions" || echo "│ • gitzen actions list|watch|trigger → GitHub Actions"
    echo "╰─────────────❍"
    echo ""

    echo "╭───────────❍「 AUTOMATION 」❍"
    [ "$GITZEN_LANG" = "id" ] && echo "│ • gitzen backup [folder]            → Backup semua repo" || echo "│ • gitzen backup [folder]            → Backup all repos"
    [ "$GITZEN_LANG" = "id" ] && echo "│ • gitzen stats                      → Statistik kontribusi" || echo "│ • gitzen stats                      → Contribution stats"
    [ "$GITZEN_LANG" = "id" ] && echo "│ • gitzen daemon [detik]             → Auto-sync" || echo "│ • gitzen daemon [seconds]           → Auto-sync"
    [ "$GITZEN_LANG" = "id" ] && echo "│ • gitzen webhook                    → Uji webhook" || echo "│ • gitzen webhook                    → Test webhook"
    echo "╰─────────────❍"
    echo ""

    echo "╭───────────❍「 SETUP & CONFIG 」❍"
    [ "$GITZEN_LANG" = "id" ] && echo "│ • gitzen setup                      → Install dependensi" || echo "│ • gitzen setup                      → Install dependencies"
    [ "$GITZEN_LANG" = "id" ] && echo "│ • gitzen config show|set|remote     → Konfigurasi git" || echo "│ • gitzen config show|set|remote     → Configure git"
    [ "$GITZEN_LANG" = "id" ] && echo "│ • gitzen undo commit|file|hard      → Batalkan perubahan" || echo "│ • gitzen undo commit|file|hard      → Undo changes"
    [ "$GITZEN_LANG" = "id" ] && echo "│ • gitzen keygen [email]             → Generate SSH key" || echo "│ • gitzen keygen [email]             → Generate SSH key"
    [ "$GITZEN_LANG" = "id" ] && echo "│ • gitzen help                       → Bantuan ini" || echo "│ • gitzen help                       → This help"
    echo "╰─────────────❍"
    echo ""

    echo "╭───────────❍「 TIPS 」❍"
    [ "$GITZEN_LANG" = "id" ] && echo "│ • export GITZEN_LANG=id untuk Bahasa Indonesia" || echo "│ • export GITZEN_LANG=id for Indonesian"
    echo "│ • export WEBHOOK_URL=\"https://...\" untuk notifikasi"
    echo "╰─────────────❍"
    echo ""
}

# Main
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