#!/bin/bash
# Cron runs this file once a day. Each run is a fresh agent session.
# Cron line (9:00 every day):
#   0 9 * * * /full/path/to/this/folder/run.sh
cd "$(dirname "$0")" || exit 1
claude -p "$(cat GOAL.md)" >> runs.log 2>&1
