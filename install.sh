#!/bin/bash

set -eu

DOTFILES=$(cd $(dirname $0) && pwd)

ln -sf $DOTFILES/.tmux.conf ~
ln -sf $DOTFILES/.zlogin ~
ln -sf $DOTFILES/.zlogout ~
ln -sf $DOTFILES/.zpreztorc ~
ln -sf $DOTFILES/.zprofile ~
ln -sf $DOTFILES/.zshenv ~
ln -sf $DOTFILES/.zshrc ~

mkdir -p ~/.config

ln -sf $DOTFILES/.config/* ~/.config

# Install prezto
if [ -d ~/.zprezto ]; then
  (cd ~/.zprezto && git pull && git submodule sync --recursive && git submodule update --init --recursive)
else
  git clone --recursive https://github.com/sorin-ionescu/prezto.git ~/.zprezto
fi

# Install homebrew
if [ "$(uname)" = "Darwin" ]; then
  if command -v brew > /dev/null; then
    brew update
    brew upgrade
  else
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi

  ln -sf $DOTFILES/.Brewfile ~
  brew bundle --global
fi

# Install asdf
if [ "$(uname)" = "Linux" ]; then
  if command -v asdf > /dev/null; then
    asdf update
    asdf plugin update --all
  else
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf
    source ~/.asdf/asdf.sh
  fi

  ln -sf $DOTFILES/.tool-versions ~
  cat ~/.tool-versions | while read plugin version; do
    asdf plugin add $plugin
    asdf install $plugin $version
    asdf global $plugin $version
  done
fi

# Install cargo
if command -v rustup > /dev/null; then
  rustup update
else
  curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path
  source ~/.cargo/env
fi
cargo install bat exa fd-find ripgrep tealdeer zoxide

# Install fzf
if [ -d ~/.fzf ]; then
  (cd ~/.fzf && git pull && ./install --all --no-update-rc)
else
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install --all --no-update-rc
fi

# Install pyenv
if command -v pyenv > /dev/null; then
  pyenv update
else
  git clone https://github.com/pyenv/pyenv.git ~/.pyenv
  git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
  git clone https://github.com/pyenv/pyenv-update.git ~/.pyenv/plugins/pyenv-update
  export PATH="$HOME/.pyenv/bin:$PATH"
  eval "$(pyenv init -)"
fi
pyenv install --skip-existing 3.11.7
pyenv global 3.11.7

# Install nodenv
if command -v nodenv > /dev/null; then
  nodenv update
else
  git clone https://github.com/nodenv/nodenv.git ~/.nodenv
  git clone https://github.com/nodenv/node-build.git ~/.nodenv/plugins/node-build
  git clone https://github.com/nodenv/nodenv-update.git ~/.nodenv/plugins/nodenv-update
  export PATH="$HOME/.nodenv/bin:$PATH"
  eval "$(nodenv init -)"
fi
nodenv install --skip-existing 20.10.0
nodenv global 20.10.0

# Install rbenv
if command -v rbenv > /dev/null; then
  (cd "$(rbenv root)" && git pull)
  (cd "$(rbenv root)"/plugins/ruby-build && git pull)
else
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi
rbenv install --skip-existing 3.1.4
rbenv global 3.1.4

# Install goenv
if command -v goenv > /dev/null; then
  (cd "$(goenv root)" && git pull)
else
  git clone https://github.com/go-nv/goenv.git ~/.goenv
  export PATH="$HOME/.goenv/bin:$PATH"
  eval "$(goenv init -)"
fi
goenv install --skip-existing 1.20.0
goenv global 1.20.0

# Install pipx
pip install --upgrade pip
pip install pipx
pipx install git+https://github.com/nakatuba/pgcli.git
pipx install mycli neovim-remote poetry powerline-status trash-cli
pipx reinstall-all
