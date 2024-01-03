#!/bin/bash

set -eu

DOTFILES=$(cd $(dirname $0) && pwd)

ln -sf $DOTFILES/.zlogin ~
ln -sf $DOTFILES/.zlogout ~
ln -sf $DOTFILES/.zpreztorc ~
ln -sf $DOTFILES/.zprofile ~
ln -sf $DOTFILES/.zshenv ~
ln -sf $DOTFILES/.zshrc ~

if [ "$(uname)" = "Darwin" ]; then
  ln -sf $DOTFILES/macos/.Brewfile ~
  ln -sf $DOTFILES/macos/.tool-versions ~
elif [ "$(uname)" = "Linux" ]; then
  ln -sf $DOTFILES/linux/.tool-versions ~
fi

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
  else
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi

  brew bundle --global
fi

# Install asdf
if command -v asdf > /dev/null; then
  asdf update
  asdf plugin update --all
else
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf
  source ~/.asdf/asdf.sh
fi

# Install asdf plugins
cat ~/.tool-versions | while read plugin version; do
  asdf plugin add $plugin
  asdf install $plugin $version
  asdf global $plugin $version
done

# Install cargo
if command -v rustup > /dev/null; then
  rustup update
else
  curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path
  source ~/.cargo/env
fi

# Install cargo packages
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

# Install python
pyenv install --skip-existing 3.11.7
pyenv global 3.11.7

# Install pipx packages
pipx install git+https://github.com/nakatuba/pgcli.git
pipx install mycli neovim-remote poetry powerline-status trash-cli
pipx reinstall-all
