fzf-cdr-widget() {
  local dir=$(cdr -l | sed 's/^[^ ][^ ]*  *//' | fzf --height 40% --reverse)
  if [ -n "$dir" ]; then
    BUFFER="cd $dir"
    zle accept-line
  fi
  zle reset-prompt
}
zle     -N   fzf-cdr-widget
bindkey '^]' fzf-cdr-widget

fzf-ghq-widget() {
  local dir=$(ghq list | fzf --height 40% --reverse)
  if [ -n "$dir" ]; then
    local session=$(basename $dir)
    if [ -z "$TMUX" ]; then
      BUFFER="tmux new -A -c $(ghq root)/$dir -s $session"
    else
      if tmux has -t $session 2>/dev/null; then
        BUFFER="tmux switch -t $session"
      else
        BUFFER="tmux new -d -c $(ghq root)/$dir -s $session && tmux switch -t $session"
      fi
    fi
    zle accept-line
  fi
  zle reset-prompt
}
zle     -N     fzf-ghq-widget
bindkey '^g^g' fzf-ghq-widget

fzf-git-checkout-widget() {
  git rev-parse --is-inside-work-tree > /dev/null 2>&1 || return
  local branch=$(git branch -v | grep -v '^\*' | sed 's/^  *//' | fzf --height 40% --reverse | awk '{print $1}')
  if [ -n "$branch" ]; then
    BUFFER="git checkout $branch"
    zle accept-line
  fi
  zle reset-prompt
}
zle     -N     fzf-git-checkout-widget
bindkey '^g^o' fzf-git-checkout-widget

fzf-tmux-attach-widget() {
  [ -z "$TMUX" ] || return
  local session=$(tmux list-sessions 2>/dev/null | fzf --height 40% --reverse | cut -d ':' -f 1)
  if [ -n "$session" ]; then
    BUFFER="tmux attach -t $session"
    zle accept-line
  fi
  zle reset-prompt
}
zle     -N   fzf-tmux-attach-widget
bindkey '^s' fzf-tmux-attach-widget
