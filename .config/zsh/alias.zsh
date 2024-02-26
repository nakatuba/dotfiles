command -v bat > /dev/null && alias cat='bat'

if command -v exa > /dev/null; then
  alias ll='exa --icons -l'
  alias la='exa --icons -la'
  alias tree='exa --icons --tree'
fi

if command -v nvim > /dev/null; then
  alias vi='nvim'

  if command -v tmux > /dev/null; then
    [ -n "$TMUX" ] || alias vi='tmux new -A -s $(basename $PWD) nvim'
  fi

  if command -v nvr > /dev/null; then
    [ -n "$NVIM" ] && alias vi='nvr -l'
  fi
fi
