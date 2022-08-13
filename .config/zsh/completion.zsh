command -v pip > /dev/null && eval "$(pip completion --zsh)"

command -v brew > /dev/null && FPATH="$(brew --prefix)/share/zsh/site-functions:$FPATH"

autoload -Uz compinit
compinit
