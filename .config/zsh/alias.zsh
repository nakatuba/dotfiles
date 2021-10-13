if command -v nvim > /dev/null; then
  alias vi='nvim'
  alias vim='nvim'
  [ -n "$VIM" ] && alias nvim="nvr -cc 'split | only' -c 'set number'"
fi
