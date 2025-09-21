export FZF_DEFAULT_OPTS="--cycle --bind 'alt-v:preview-page-up,ctrl-v:preview-page-down,alt-<:preview-top,alt->:preview-bottom'"

if command -v fd > /dev/null; then
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
  export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
  export FZF_CTRL_T_COMMAND='fd --type f --type d --hidden --follow --exclude .git'
fi

command -v bat > /dev/null && export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always {}'"

command -v fzf > /dev/null && source <(fzf --zsh)
