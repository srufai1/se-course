#!/usr/bin/env bash
# Week 2 checks. Usage: bash modules/02-web-html/checks/check.sh mini-sms
# Read-only: it reads your HTML pages and changes nothing.
dir="${1:-mini-sms}"
fails=0
pass() { echo "PASS $1"; }
fail() { echo "FAIL $1 -> $2"; fails=$((fails + 1)); }
has() { grep -qiE "$2" "$1"; }

for page in index.html about.html classes.html; do
  f="$dir/$page"
  if [ ! -f "$f" ]; then fail "$page" "create $f"; continue; fi
  has "$f" '^<!doctype html>' && pass "$page starts with <!doctype html>" || fail "$page doctype" "the first line must be <!doctype html>"
  has "$f" '<html[^>]*lang="[a-z]+' && pass "$page has <html lang=...>" || fail "$page lang" "add lang=\"en\" to <html>"
  has "$f" '<meta[^>]*charset' && pass "$page has a charset meta" || fail "$page charset" "add <meta charset=\"utf-8\">"
  has "$f" 'name="viewport"' && pass "$page has the viewport meta (phones)" || fail "$page viewport" "add the viewport meta"
  grep -qiE '<title>[^<[:space:]][^<]*</title>' "$f" && pass "$page has a title" || fail "$page title" "the <title> must not be empty"
  [ "$(grep -oi '<h1' "$f" | wc -l)" -eq 1 ] && pass "$page has exactly one <h1>" || fail "$page h1" "use exactly one <h1>"
  for tag in header nav main footer; do
    has "$f" "<$tag[ >]" && pass "$page uses <$tag>" || fail "$page <$tag>" "add a <$tag> element"
  done
  if grep -qi '<img' "$f"; then
    grep -oiE '<img[^>]*>' "$f" | grep -viq 'alt=' && fail "$page alt" "every <img> needs alt=\"...\"" || pass "$page: every image has alt text"
  fi
  for link in $(grep -oiE 'href="[^"#:]+\.html"' "$f" | sed -E 's/href="([^"]+)"/\1/I'); do
    [ -f "$dir/$link" ] && pass "$page links to $link, which exists" || fail "$page link" "$link does not exist (typo?)"
  done
done
f="$dir/classes.html"
[ -f "$f" ] && has "$f" '<table' && has "$f" '<th' && pass "classes.html has a table with headings" || fail "classes table" "use <table> with <th> headings"
[ -f "$f" ] && [ "$(grep -oi '<tr' "$f" | wc -l)" -ge 5 ] && pass "classes.html lists at least 4 classes" || fail "classes rows" "add more classes"
if grep -qiE 'style=|<style' "$dir"/*.html 2>/dev/null; then fail "no CSS" "no CSS this week; it comes in Week 3"; else pass "no CSS yet (correct for this week)"; fi

echo
[ "$fails" -eq 0 ] && echo "Week 2 pages: all checks PASS" || { echo "$fails check(s) failed"; exit 1; }
