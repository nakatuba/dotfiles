# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

path=(
  $HOME/.local/bin(N-/)
  $path
)

fpath=(
  $HOME/.asdf/completions(N-/)
  $HOME/.config/zsh/completions(N-/)
  $fpath
)

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"

export PATH="$HOME/.cargo/bin:$PATH"

[ -x /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"

autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-max 1000

source-safe() { [ -f $1 ] && source $1 }
source-safe ~/.zprezto/init.zsh
source-safe ~/.p10k.zsh
source-safe ~/.asdf/asdf.sh
source-safe ~/.fzf.zsh
source-safe ~/.config/zsh/alias.zsh
source-safe ~/.config/zsh/bindkey.zsh
source-safe ~/.config/zsh/completion.zsh
source-safe ~/.config/zsh/fzf-config.zsh
source-safe ~/.config/zsh/fzf-git.zsh
source-safe ~/.config/zsh/fzf-widget.zsh
