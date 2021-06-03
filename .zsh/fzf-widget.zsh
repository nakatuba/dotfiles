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
  git rev-parse --is-inside-work-tree > /dev/null 2>&1 || return
  local branch=$(git branch -v | grep -v '^\*' | sed 's/^  *//' | fzf --height 40% --reverse | awk '{print $1}')
  if [ -n "$branch" ]; then
    BUFFER="git checkout $branch"
    zle accept-line
  fi
  zle reset-prompt
}
zle     -N     fzf-git-checkout-widget
bindkey '^o' fzf-git-checkout-widget
