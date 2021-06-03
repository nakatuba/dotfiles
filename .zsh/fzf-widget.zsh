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
bindkey '^g' fzf-ghq-widget

fzf-git-checkout-widget() {
  git rev-parse HEAD > /dev/null 2>&1 || return
  local branch=$(git branch | grep -v '^\*' | sed 's/^  *//' | fzf --height 50% --min-height 20 --border --bind ctrl-/:toggle-preview "$@" --reverse --preview-window right:70% --preview 'git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" {}')
  if [ -n "$branch" ]; then
    BUFFER="git checkout $branch"
    zle accept-line
  fi
  zle reset-prompt
}
zle     -N     fzf-git-checkout-widget
bindkey '^o' fzf-git-checkout-widget
