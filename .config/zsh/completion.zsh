autoload -Uz bashcompinit && bashcompinit

command -v terraform > /dev/null && complete -o nospace -C $(which terraform) terraform
command -v terragrunt > /dev/null && complete -o nospace -C $(which terragrunt) terragrunt
