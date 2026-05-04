# Global Rules

## Path Resolution

When resolving `~` or `$HOME` in file paths, always derive the home directory from the `Working directory` provided in the `<env>` block (e.g. if `Working directory` is `/Users/foo/projects/bar`, then `~` is `/Users/foo`). Never guess or hallucinate the home directory path.
