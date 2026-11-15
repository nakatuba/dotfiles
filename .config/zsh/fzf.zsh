export FZF_DEFAULT_OPTS="--cycle --bind 'ctrl-k:preview-half-page-up,ctrl-j:preview-half-page-down'"

if command -v fd > /dev/null; then
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
  export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
  export FZF_CTRL_T_COMMAND='fd --type f --type d --hidden --follow --exclude .git'
fi

command -v bat > /dev/null && export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always {}'"

command -v fzf > /dev/null && source <(fzf --zsh)

source-if-exists ~/.config/fzf/fzf-git.sh

_fzf_git_fzf() {
  fzf --height 50% \
    --layout reverse --multi --min-height 20+ \
    --no-separator --header-border horizontal \
    --border-label-pos 2 \
    --color 'label:blue' \
    --preview-window 'right,50%' --preview-border line \
    --bind 'ctrl-/:change-preview-window(down,50%|hidden|)' "$@"
}
