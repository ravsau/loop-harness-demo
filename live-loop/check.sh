#!/bin/bash
# The check for one run. Usage: ./check.sh N
cd "$(dirname "$0")" || exit 1
n="$1"
if [ -s "reports/run-$n.md" ]; then echo "CHECK PASS: reports/run-$n.md"; exit 0; fi
if grep -q "^## Run $n" HITL.md; then echo "CHECK STOPPED: run $n asked a question in HITL.md"; exit 0; fi
echo "CHECK FAIL: run $n wrote no report and asked no question"; exit 1
