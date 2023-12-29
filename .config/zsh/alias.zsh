if command -v nvim > /dev/null; then
  alias vi='nvim'
  alias vim='nvim'
  [ -n "$VIM" ] && alias nvim='nvr -l'
fi

if command -v exa > /dev/null; then
  alias ll='exa --icons -l'
  alias la='exa --icons -la'
  alias tree='exa --icons --tree'
fi

command -v bat > /dev/null && alias cat='bat'
command -v mycli > /dev/null && alias mysql='mycli'
command -v pgcli > /dev/null && alias psql='pgcli'
