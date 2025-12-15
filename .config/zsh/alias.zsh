command -v bat > /dev/null && alias cat='bat -p'
command -v btm > /dev/null && alias top='btm -b'

if command -v eza > /dev/null; then
  alias ll='eza -l'
  alias la='eza -la'
  alias tree='eza --tree'
fi

if command -v nvim > /dev/null; then
  alias vi='nvim'
  alias vim='nvim'
fi

if command -v nvr > /dev/null; then
  [ -n "$NVIM" ] && alias nvim='nvr -l'
fi
