---
description: Runs Playwright end-to-end browser tests against the dev server. Uses playwright-cli skill.
mode: subagent
permission:
  edit: deny
  bash: allow
---
Load the playwright-cli skill. Start dev server, run Playwright E2E tests, stop server. Report pass/fail with failure details and screenshots.
