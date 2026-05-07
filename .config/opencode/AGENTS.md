# Global Rules

## Path Resolution

- At the start of every session, run `pwd` to confirm the current working directory before performing any file operations.
- All file paths MUST be based on the confirmed working directory. NEVER fabricate or infer paths from training data.
- When resolving `~` or `$HOME`, extract the home directory from the working directory path (e.g. `/Users/foo/projects/bar` → `~` is `/Users/foo`).
