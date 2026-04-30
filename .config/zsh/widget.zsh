fzf-zoxide-widget() {
  local dir=$(zoxide query --list | fzf --height 40% --reverse)
  if [ -n "$dir" ]; then
    BUFFER="cd ${(q)dir}"
    zle accept-line
  fi
  zle reset-prompt
}
zle -N fzf-zoxide-widget
bindkey '^]' fzf-zoxide-widget

fzf-ghq-widget() {
  local dir=$(ghq list | fzf --height 40% --reverse)
  if [ -n "$dir" ]; then
    BUFFER="cd $(ghq root)/$dir"
    zle accept-line
  fi
  zle reset-prompt
}
zle -N fzf-ghq-widget
bindkey '^g^g' fzf-ghq-widget

git-checkout-widget() {
  git rev-parse --is-inside-work-tree > /dev/null 2>&1 || return

  if [[ "$(git rev-parse --git-dir)" == ".git" ]]; then
    local selected=$(git branch -v --color=always | grep -v '^\*' | fzf --ansi --height 40% --reverse)
  else
    local selected=$(git branch -v --color=always | grep '^\+' | fzf --ansi --height 40% --reverse)
  fi

  if [ -n "$selected" ]; then
    if [[ "$selected" == +* ]]; then
      local branch=$(echo "$selected" | awk '{print $2}')
      BUFFER="gwq cd $branch"
    else
      local branch=$(echo "$selected" | awk '{print $1}')
      BUFFER="git checkout $branch"
    fi
    zle accept-line
  fi
  zle reset-prompt
}
zle -N git-checkout-widget
bindkey '^g^o' git-checkout-widget

tmux-new-widget() {
  BUFFER="tmux new -A -s $(basename $PWD)"
  zle accept-line
}
zle -N tmux-new-widget
bindkey '^o' tmux-new-widget

tmux-attach-widget() {
  local session=$(tmux list-sessions 2>/dev/null | fzf --height 40% --reverse | cut -d ':' -f 1)
  if [ -n "$session" ]; then
    BUFFER="tmux attach -t $session"
    zle accept-line
  fi
  zle reset-prompt
}
zle -N tmux-attach-widget
bindkey '^s' tmux-attach-widget
