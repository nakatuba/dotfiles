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
  local branch=$(git branch -v | grep -v '^\*' | sed 's/^  *//' | fzf --height 40% --reverse | awk '{print $1}')
  if [ -n "$branch" ]; then
    BUFFER="git checkout $branch"
    zle accept-line
  fi
  zle reset-prompt
}
zle -N git-checkout-widget
bindkey '^g^o' git-checkout-widget

tmux-new-widget() {
  [ -n "$TMUX" ] && return
  BUFFER="tmux new -A -s $(basename $PWD)"
  zle accept-line
}
zle -N tmux-new-widget
bindkey '^o' tmux-new-widget

tmux-attach-widget() {
  [ -n "$TMUX" ] && return
  local session=$(tmux list-sessions 2>/dev/null | fzf --height 40% --reverse | cut -d ':' -f 1)
  if [ -n "$session" ]; then
    BUFFER="tmux attach -t $session"
    zle accept-line
  fi
  zle reset-prompt
}
zle -N tmux-attach-widget
bindkey '^s' tmux-attach-widget
