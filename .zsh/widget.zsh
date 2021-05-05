fzf-cdr-widget() {
  local dir="$(cdr -l | sed 's/^[^ ][^ ]*  *//' | fzf --height 40% --reverse)"
  if [[ -n "$dir" ]]; then
    BUFFER="cd $dir"
    zle accept-line
  fi
  zle reset-prompt
}
zle     -N   fzf-cdr-widget
bindkey '^]' fzf-cdr-widget

fzf-ghq-widget() {
  local dir="$(ghq list | fzf --height 40% --reverse)"
  if [[ -n "$dir" ]]; then
    BUFFER="cd $(ghq root)/$dir"
    zle accept-line
  fi
  zle reset-prompt
}
zle     -N   fzf-ghq-widget
bindkey '^g' fzf-ghq-widget

fzf-git-add-widget() {
  local file="$(_gf)"
  if [[ -n "$file" ]]; then
    BUFFER="git add $file"
    zle accept-line
  fi
  zle reset-prompt
}
zle     -N    fzf-git-add-widget
bindkey '^ga' fzf-git-add-widget

fzf-git-checkout-widget() {
  local branch="$(_gb)"
  if [[ -n "$branch" ]]; then
    BUFFER="git checkout $branch"
    zle accept-line
  fi
  zle reset-prompt
}
zle     -N   fzf-git-checkout-widget
bindkey '^gc' fzf-git-checkout-widget
