autoload bashcompinit && bashcompinit

command -v asdf > /dev/null && FPATH="$HOME/.asdf/completions:$FPATH"

command -v brew > /dev/null && FPATH="$(brew --prefix)/share/zsh/site-functions:$FPATH"

command -v pip > /dev/null && eval "$(pip completion --zsh)"

command -v terraform > /dev/null && complete -o nospace -C $(which terraform) terraform

autoload -Uz compinit && compinit
