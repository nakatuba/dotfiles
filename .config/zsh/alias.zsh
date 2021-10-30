if command -v nvim > /dev/null; then
  alias vi='nvim'
  alias vim='nvim'
  [ -n "$VIM" ] && alias nvim='nvr -l'
fi

if command -v exa > /dev/null; then
  alias ls='exa --icons'
  alias ll='exa --icons -l'
  alias la='exa --icons -la'
  alias tree='exa --icons --tree'
fi

command -v bat > /dev/null && alias cat='bat --paging=never'
