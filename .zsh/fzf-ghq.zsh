fzf-ghq-widget() {
  local dir="$(ghq list | fzf --height 40% --reverse)"
  if [[ -z "$dir" ]]; then
    zle redisplay
    return 0
  fi
  zle push-line # Clear buffer. Auto-restored on next prompt.
  BUFFER="cd $(ghq root)/${(q)dir}"
  zle accept-line
  local ret=$?
  unset dir # ensure this doesn't end up appearing in prompt expansion
  zle reset-prompt
  return $ret
}
zle     -N   fzf-ghq-widget
bindkey '^g' fzf-ghq-widget
