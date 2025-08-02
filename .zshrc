# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[ -x /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"

path=(
  $HOME/.local/bin(N-/)
  $path
)

fpath=(
  $HOME/.config/zsh/completions(N-/)
  $fpath
)

eval "$(mise activate zsh)"

source-if-exists() { [ -f $1 ] && source $1 }
source-if-exists ~/.zprezto/init.zsh

for file in ~/.config/zsh/*.zsh; do
  source $file
done
