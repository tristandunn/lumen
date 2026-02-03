---
allowed-tools:
  - Bash(git checkout -b td-dependencies)
  - Bash(git branch --list td-dependencies)
  - Bash(bumpit -c)
  - Bash(git diff --name-only)
  - Bash(rm -fr node_modules/ yarn.lock)
  - Bash(yarn install)
  - Bash(bin/ci)
  - Bash(git add -A)
  - Bash(git commit:*)
  - Bash(git status)
  - Bash(git status --porcelain)
---

Bump dependencies and create a commit.

Follow these steps exactly, stopping and reporting if any step fails:
1. Check for uncommitted changes with `git status --porcelain`. If there are any
   changes, report the error and stop.
2. Check if branch `td-dependencies` already exists with `git branch --list
   td-dependencies`. If it exists, report the error and stop.
3. Create and switch to branch `td-dependencies` with `git checkout -b
   td-dependencies`.
4. Run `bumpit -c` to bump dependencies. Save the output - this will be the
   commit message.
5. Check if `package.json` was modified using `git diff --name-only`. If it was:
   - Run `rm -fr node_modules/ yarn.lock`
   - Run `yarn install`
6. Run `bin/ci` to verify everything works. If it fails, report the error
   and stop.
7. Stage all changes with `git add -A`.
8. Create a commit using the exact output from `bumpit -c` as the commit
   message. Do not include attribution.

Report success or any failures clearly to the user.
