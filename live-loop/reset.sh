#!/bin/bash
# Put the folder back to its start state.
cd "$(dirname "$0")" || exit 1
cp .start/TASKS.md .start/HITL.md .start/LOG.md .
rm -f reports/run-1.md reports/run-2.md reports/run-3.md reports/run-4.md reports/run-5.md
echo "reset done"
