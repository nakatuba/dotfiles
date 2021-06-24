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
    BUFFER="cd $(ghq root)/$dir"
    zle accept-line
  fi
  zle reset-prompt
}
zle     -N     fzf-ghq-widget
bindkey '^g^g' fzf-ghq-widget

fzf-git-checkout-widget() {
  git rev-parse HEAD > /dev/null 2>&1 || return
  local branch=$(git branch -a --color=always | grep -v HEAD | sort |
    fzf --height 50% --min-height 20 --border --bind ctrl-/:toggle-preview "$@" --ansi --tac --preview-window right:70% \
        --preview 'git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1)' |
    sed 's/^..//' | cut -d' ' -f1 |
    sed 's#remotes/[^/]*/##')
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
bindkey '^q' fzf-tmux-attach-widget
