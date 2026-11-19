# The loop prompt

Open an empty folder, start Claude Code or Codex, and paste this.

```
Set up a loop in this folder.

Schedule: run once every minute, 5 runs in total, then stop. Each run starts
a fresh agent session with the goal below.

Goal for each run: take the first unchecked task in TASKS.md, do that one
task, write the result to reports/run-N.md, and check the task's box.

Rules. Write them to AGENTS.md so every run reads them:
- Do one task per run, then stop.
- Write only inside this folder. Never commit, push, delete files or call
  a paid API.
- The run is done only when ./check.sh passes.
- If you have a question or you are unsure, do not guess. Add the question
  to HITL.md and stop.
- At the start of each run, read HITL.md for my answers and LOG.md for the
  last run.
- At the end of each run, add one line to LOG.md.

Create AGENTS.md, GOAL.md, TASKS.md, check.sh, HITL.md, LOG.md and loop.sh.
Show me loop.sh before you run it.
```

The finished result of this prompt is in `live-loop/`. Run it with `./loop.sh`.

To make the loop daily, change the schedule line to: "a cron job that runs every day at 9:00".

## Which line is which

| Line in the prompt | Loop or harness |
|---|---|
| Runs once every minute, in a fresh session | Loop: the clock |
| 5 runs in total, then stop | Loop: the stop rule |
| The goal for each run | Loop: the job |
| Rules in AGENTS.md | Harness: a file and guardrails |
| Done only when check.sh passes | Harness: a check |
| Questions go to HITL.md, then stop | Both |
| Read LOG.md first, add one line at the end | Both: memory between runs |
