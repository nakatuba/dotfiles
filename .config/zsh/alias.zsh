if command -v nvim > /dev/null; then
  alias vi='nvim'
  alias vim='nvim'
  [ -n "$VIM" ] && alias nvim='nvr -l'
fi

command -v bat > /dev/null && alias cat='bat --paging=never'
