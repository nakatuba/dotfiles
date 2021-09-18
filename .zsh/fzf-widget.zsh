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

fzf-cd-parent-directory-widget() {
  local declare dirs=()
  get_parent_dirs() {
    if [[ -d "${1}" ]]; then dirs+=("$1"); else return; fi
    if [[ "${1}" == '/' ]]; then
      for _dir in "${dirs[@]}"; do echo $_dir; done
    else
      get_parent_dirs $(dirname "$1")
    fi
  }
  local dir=$(get_parent_dirs $(dirname $PWD) | fzf --height 40%)
  if [ -n "$dir" ]; then
    BUFFER="cd $dir"
    zle accept-line
  fi
  zle reset-prompt
}
zle     -N    fzf-cd-parent-directory-widget
bindkey '^[p' fzf-cd-parent-directory-widget
