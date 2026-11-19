# Demo folder: a basic loop in one prompt

From the CloudYeti live session "Learn how loop and harness engineering work together" (2026-11-19). Needs Claude Code installed and logged in.

## What is here

- `PROMPT.md`: the prompt to paste into Claude Code or Codex. Slide 12 shows the same prompt in six lines.
- `live-loop/`: the finished result of the prompt. One fresh agent session every minute, 5 runs, then stop.
- `example-result/`: a second example, a daily loop that writes a report of the last 24 hours of git commits.

## Run the live loop

```
cd live-loop
./loop.sh
```

- Each run takes the next unchecked task in `TASKS.md`, writes `reports/run-N.md`, checks the box and adds a line to `LOG.md`.
- The task "Rename the file" is unclear on purpose. The agent saves a question to `HITL.md` and stops. Write the answer after `**Answer:**` and a later run does the task.
- `./reset.sh` puts the folder back to its start state.
- `EVERY=15 RUNS=3 ./loop.sh` runs a shorter loop.

`loop.sh` calls `claude -p` with the Haiku model and removes `ANTHROPIC_API_KEY` from the environment, so the runs use the Claude subscription you are logged in with.

## Which part is which

| File | Loop or harness |
|---|---|
| `loop.sh` | Loop: the clock (60 seconds) and the stop rule (5 runs) |
| `GOAL.md`, `TASKS.md` | Loop: the job |
| `AGENTS.md` | Harness: rules and guardrails every run reads |
| `check.sh` | Harness: the check after each run |
| `HITL.md`, `LOG.md` | Both: questions for the human, and memory between runs |

## Status

`live-loop/` was run live on 2026-11-19. In `example-result/`, `check.sh` is tested; `run.sh` and the cron line are examples and were not run on a schedule.
