---
allowed-tools:
  - Bash(git diff --staged)
  - Bash(git status)
  - Bash(git log --format=%s:*)
---

Write a commit message for the staged changes listed in `git diff --staged`.

- One imperative sentence ending in a period, with no subject, emoji or trailer.
- Name one change and one object. Do not list several things with commas or
  "and". If the diff has several changes, describe only the main one.
- Prefer plain verbs: Add, Fix, Update, Use, Set, Remove, Move, Disable,
  Require, Sort, Skip, Exclude, Rename, Replace, Combine, Standardize.
- Never use quality words such as improve, tighten, stricter or better. They
  describe an opinion, not a change.
- Refer to things the way the repository does, such as "the bump-it command",
  "in Claude Code" or "in the mise configuration". Leave out file names, class
  names and status codes.
- Run `git log -30 --format=%s` and match the tone, then read the full staged
  diff.
- DO NOT include any changes or files that are not staged.
- DO NOT run `git commit` or any other git-modifying command.

Examples of the expected style:

- Use the Haiku model for the bump-it command.
- Disable documentation generation when installing gems.
- Sort directory listings in byte order.
- Move swayosd to a systemd user service.
- Skip the payee lookup for new transactions.
- Add canonical URL tags to pages.
- Remove continuous deployment.
- Update dependencies.

Maximum 72 characters. Count them before answering. If over, cut it down and
recount. Output only the message, with no commentary.
