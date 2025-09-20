# Coding Agent Instructions for dotfiles

## Build/Test Commands
- **Install**: `./install.sh` - Installs all dotfiles and dependencies
- **CI Test**: GitHub Actions runs install.sh on push (see .github/workflows/ci.yml)
- **Python**: Use pyenv (3.13.6), pipx for global tools
- **Neovim Plugins**: Located in .config/nvim/lua/plugins/, use Lua modules

## Code Style Guidelines
- **Shell Scripts**: Use bash with `set -eu`, quote paths with spaces
- **Symlinks**: Create with `ln -sf` in install.sh for new configs
- **Config Structure**: Place configs in .config/<tool>/ directory
- **Lua (Neovim)**: Follow existing plugin patterns, return table with setup
- **Platform-specific**: Wrap macOS-only code in `if [ "$(uname)" = "Darwin" ]`
- **Error Handling**: Always use set -eu in bash scripts
- **Git**: Never commit secrets, use environment variables for tokens
- **Dependencies**: Document in install.sh, use mise/pyenv/pipx/cargo appropriately
- **Testing**: Run install.sh to verify changes work on fresh system

## File Organization
- Dotfiles go in repo root (e.g., .zshrc, .Brewfile)
- Config directories go in .config/
- macOS-specific: karabiner, skhd, yabai, hammerspoon, launchd