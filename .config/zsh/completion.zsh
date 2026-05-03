autoload -Uz compinit && compinit
autoload -Uz bashcompinit && bashcompinit

command -v gwq > /dev/null && eval "$(gwq completion zsh)"

command -v mise > /dev/null && eval "$(mise completion zsh)"

command -v pip > /dev/null && eval "$(pip completion --zsh)"

command -v pipx > /dev/null && eval "$(register-python-argcomplete pipx)"

command -v terraform > /dev/null && complete -o nospace -C $(which terraform) terraform

command -v uv > /dev/null && eval "$(uv generate-shell-completion zsh)"

command -v uvx > /dev/null && eval "$(uvx --generate-shell-completion zsh)"
