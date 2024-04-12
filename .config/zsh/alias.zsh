command -v bat > /dev/null && alias cat='bat -p'

if command -v exa > /dev/null; then
  alias ll='exa --icons -l'
  alias la='exa --icons -la'
  alias tree='exa --icons --tree'
fi

if command -v nvim > /dev/null; then
  alias vi='nvim'
  alias vim='nvim'
fi

if command -v nvr > /dev/null; then
  [ -n "$NVIM" ] && alias nvim='nvr -l'
fi
