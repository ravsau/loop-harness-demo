#!/bin/bash
# A basic loop: one fresh agent session every minute, 5 runs, then stop.
# Usage: ./loop.sh          (5 runs, 60 seconds apart)
#        RUNS=1 ./loop.sh   (one run)
cd "$(dirname "$0")" || exit 1
mkdir -p reports
RUNS="${RUNS:-5}"     # the stop rule
EVERY="${EVERY:-60}"  # the clock, in seconds
for n in $(seq 1 "$RUNS"); do
  start=$(date +%s)
  echo
  echo "=== run $n of $RUNS, $(date +%H:%M:%S) ==="
  env -u ANTHROPIC_API_KEY claude -p "This is run number $n. $(cat GOAL.md)" \
    --model haiku --permission-mode acceptEdits --allowedTools "Read,Edit,Write" < /dev/null
  ./check.sh "$n"
  if [ "$n" -lt "$RUNS" ]; then
    left=$(( EVERY - ($(date +%s) - start) ))
    if [ "$left" -gt 0 ]; then echo "next run in $left seconds"; sleep "$left"; fi
  fi
done
echo
echo "=== stop rule reached: $RUNS runs done ==="
