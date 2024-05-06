export RUNEWIDTH_EASTASIAN=0
export FZF_DEFAULT_OPTS='--bind ctrl-j:preview-down,ctrl-k:preview-up'

if command -v fd > /dev/null; then
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
  export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
  export FZF_CTRL_T_COMMAND='fd --type f --type d --hidden --follow --exclude .git'
fi

command -v bat > /dev/null && export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always {}'"

if asdf where fzf > /dev/null 2>&1; then
  source "$(asdf where fzf)/shell/completion.zsh"
  source "$(asdf where fzf)/shell/key-bindings.zsh"
fi
