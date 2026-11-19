#!/bin/bash
# The check: the report for the day exists and has the three headings.
# Usage: ./check.sh [YYYY-MM-DD]   (default: today)
cd "$(dirname "$0")" || exit 1
day="${1:-$(date +%F)}"
file="reports/$day.md"
[ -s "$file" ] || { echo "FAIL: $file is missing or empty"; exit 1; }
for heading in "What changed" "What looks risky" "What to do next"; do
  grep -q "^## $heading" "$file" || { echo "FAIL: $file has no heading '$heading'"; exit 1; }
done
echo "PASS: $file"
