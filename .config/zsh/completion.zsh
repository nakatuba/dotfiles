# pip
command -v pip > /dev/null && eval "$(pip completion --zsh)"

# brew
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi
