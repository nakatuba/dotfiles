autoload -Uz compinit && compinit
autoload -Uz bashcompinit && bashcompinit

command -v gwq > /dev/null && eval "$(gwq completion zsh)"

command -v mise > /dev/null && eval "$(mise completion zsh)"

command -v pip > /dev/null && eval "$(pip completion --zsh)"

command -v terraform > /dev/null && complete -o nospace -C $(which terraform) terraform
