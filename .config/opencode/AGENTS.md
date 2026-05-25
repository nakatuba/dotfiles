# Global Rules

## Path Resolution

- At the start of every session, run `pwd` to confirm the current working directory before performing any file operations.
- All file paths MUST be based on the confirmed working directory. NEVER fabricate or infer paths from training data.
- When resolving `~` or `$HOME`, extract the home directory from the working directory path (e.g. `/Users/foo/projects/bar` → `~` is `/Users/foo`).

## Git

- NEVER run `git push` or any variant (`git push origin`, `git push --force`, etc.). Pushing to remote repositories must always be done manually by the user.
- `git add`, `git commit`, and other local git operations are allowed when explicitly requested.
