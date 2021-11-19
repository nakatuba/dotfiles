if command -v nvim > /dev/null; then
  alias vi='nvim'
  alias vim='nvim'
  [ -n "$VIM" ] && alias nvim='nvr'
fi

if command -v exa > /dev/null; then
  alias ll='exa --icons -l'
  alias la='exa --icons -la'
fi

command -v bat > /dev/null && alias cat='bat --paging=never'
