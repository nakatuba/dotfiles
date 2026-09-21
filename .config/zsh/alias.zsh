command -v bat > /dev/null && alias cat='bat -p'
command -v btm > /dev/null && alias top='btm -b'

if command -v eza > /dev/null; then
  alias ll='eza -l'
  alias la='eza -la'
  alias tree='eza --tree'
fi

command -v nvim > /dev/null && alias vi='nvim'

if command -v nvr > /dev/null; then
  [ -n "$NVIM" ] && alias nvim='nvr -l'
fi

command -v opencode > /dev/null && alias oc='opencode'
command -v workmux > /dev/null && alias wm='workmux'
