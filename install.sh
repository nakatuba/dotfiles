#!/bin/bash

set -eu

DOTFILES=$(cd $(dirname $0) && pwd)

ln -s $DOTFILES/.tmux.conf ~
ln -s $DOTFILES/.zlogin ~
ln -s $DOTFILES/.zlogout ~
ln -s $DOTFILES/.zpreztorc ~
ln -s $DOTFILES/.zprofile ~
ln -s $DOTFILES/.zshenv ~
ln -s $DOTFILES/.zshrc ~

mkdir -p ~/.config

ln -s $DOTFILES/.config/* ~/.config

# Install prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git ~/.zprezto

# Install homebrew
if [ "$(uname)" = "Darwin" ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Install asdf
if [ "$(uname)" = "Linux" ]; then
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf
  source ~/.asdf/asdf.sh
fi

# Install cargo
curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path
source ~/.cargo/env
cargo install bat exa fd-find ripgrep tealdeer zoxide

# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all --no-update-rc

# Install pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
git clone https://github.com/pyenv/pyenv-update.git ~/.pyenv/plugins/pyenv-update
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
pyenv install 3.11.7
pyenv global 3.11.7

# Install nodenv
git clone https://github.com/nodenv/nodenv.git ~/.nodenv
git clone https://github.com/nodenv/node-build.git ~/.nodenv/plugins/node-build
git clone https://github.com/nodenv/nodenv-update.git ~/.nodenv/plugins/nodenv-update
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"
nodenv install 20.10.0
nodenv global 20.10.0

# Install rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
rbenv install 3.1.4
rbenv global 3.1.4

# Install goenv
git clone https://github.com/go-nv/goenv.git ~/.goenv
export PATH="$HOME/.goenv/bin:$PATH"
eval "$(goenv init -)"
goenv install 1.20.0
goenv global 1.20.0

# Install pipx
pip install --upgrade pip
pip install pipx
pipx install git+https://github.com/nakatuba/pgcli.git
pipx install mycli neovim-remote poetry powerline-status trash-cli
