export FZF_DEFAULT_OPTS="--cycle --bind 'shift-up:preview-half-page-up,shift-down:preview-half-page-down,shift-left:preview-top,shift-right:preview-bottom'"

if command -v fd > /dev/null; then
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
  export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
  export FZF_CTRL_T_COMMAND='fd --type f --type d --hidden --follow --exclude .git'
fi

command -v bat > /dev/null && export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always {}'"

command -v fzf > /dev/null && source <(fzf --zsh)
