# pip
command -v pip > /dev/null && eval "$(pip completion --zsh)"

# brew
command -v brew > /dev/null && FPATH="$(brew --prefix)/share/zsh/site-functions:$FPATH"

autoload -Uz compinit
compinit

# terraform
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform
