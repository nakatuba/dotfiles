---
description: Stage changes and create a git commit
---

Look at the changes in this project by running `git status` and `git diff` (both staged and unstaged).

Follow these steps:

1. Run `git status` and `git diff` to understand all changes
2. Run `git log --oneline -5` to understand the recent commit message style
3. Stage the relevant changes with `git add`
   - Do NOT stage files that likely contain secrets (.env, credentials, etc.)
4. Draft a concise commit message that:
   - Follows the existing commit message style in this repository
   - Focuses on the "why" rather than the "what"
   - Is 1-2 sentences maximum
5. Create the commit with `git commit -m "..."`
6. Run `git status` to verify the commit was successful
7. Do NOT push to the remote repository

$ARGUMENTS
