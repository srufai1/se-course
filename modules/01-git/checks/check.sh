#!/usr/bin/env bash
# Week 1 checks. Usage: bash modules/01-git/checks/check.sh ~/practice/git-week1
# Read-only: it looks at your practice repository and changes nothing.
repo="${1:-$HOME/practice/git-week1}"
fails=0
pass() { echo "PASS $1"; }
fail() { echo "FAIL $1 -> $2"; fails=$((fails + 1)); }

if ! git -C "$repo" rev-parse --git-dir >/dev/null 2>&1; then
  echo "FAIL $repo is not a Git repository. Did you run 'git init -b main' there?"
  exit 1
fi

[ -n "$(git config user.name)" ] && [ -n "$(git config user.email)" ] \
  && pass "your name and email are set" || fail "name/email" "run git config --global user.name / user.email"

[ "$(git -C "$repo" branch --show-current)" = "main" ] \
  && pass "you are on main" || fail "branch" "run: git switch main"

[ -f "$repo/students.txt" ] && [ "$(grep -c . "$repo/students.txt")" -ge 4 ] \
  && pass "students.txt has at least 4 names (exercises 1-2)" || fail "students.txt" "it needs 4 names, one per line"

git -C "$repo" log --format=%s | grep -qx "Add students list" \
  && pass "commit 'Add students list' exists" || fail "commit message" "commit exactly: Add students list"

[ "$(git -C "$repo" rev-list --count HEAD)" -ge 5 ] \
  && pass "at least 5 commits" || fail "commits" "keep committing small steps"

git -C "$repo" show-ref --verify --quiet refs/heads/add-classes && [ -f "$repo/classes.txt" ] \
  && pass "branch add-classes was made and merged (classes.txt is on main)" || fail "add-classes" "follow Learn 2"

[ "$(git -C "$repo" rev-list --merges --count HEAD)" -ge 1 ] \
  && pass "you finished a real merge commit (exercise 4)" || fail "conflict" "do exercise 4: merge the rename branch"

grep -qE '^(<<<<<<<|=======|>>>>>>>)' "$repo"/*.txt 2>/dev/null \
  && fail "markers" "conflict markers are still in a file" || pass "no conflict markers left"

[ -z "$(git -C "$repo" status --porcelain)" ] \
  && pass "everything is committed" || fail "clean" "git status shows uncommitted changes"

echo
[ "$fails" -eq 0 ] && echo "Week 1 practice: all checks PASS" || { echo "$fails check(s) failed"; exit 1; }
