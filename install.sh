#!/bin/bash

set -eu

DOTFILES=$(cd $(dirname $0) && pwd)

ln -sf $DOTFILES/.zlogin ~
ln -sf $DOTFILES/.zlogout ~
ln -sf $DOTFILES/.zpreztorc ~
ln -sf $DOTFILES/.zprofile ~
ln -sf $DOTFILES/.zshenv ~
ln -sf $DOTFILES/.zshrc ~

mkdir -p ~/.config

ln -sf $DOTFILES/.config/git ~/.config
ln -sf $DOTFILES/.config/nvim ~/.config
ln -sf $DOTFILES/.config/tmux ~/.config
ln -sf $DOTFILES/.config/zsh ~/.config

if [ "$(uname)" = "Darwin" ]; then
  ln -sf $DOTFILES/.config/karabiner ~/.config
  ln -sf $DOTFILES/.config/skhd ~/.config
  ln -sf $DOTFILES/.config/yabai ~/.config

  # Install homebrew
  if command -v brew > /dev/null; then
    brew update
  else
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi

  # Install homebrew packages
  ln -sf $DOTFILES/.Brewfile ~
  brew bundle --global

  # Setup hammerspoon
  mkdir -p ~/.hammerspoon
  ln -sf $DOTFILES/.config/hammerspoon/init.lua ~/.hammerspoon
  if [ -d ~/.hammerspoon/stackline ]; then
    (cd ~/.hammerspoon/stackline && git pull)
  else
    git clone https://github.com/AdamWagner/stackline.git ~/.hammerspoon/stackline
  fi

  # Setup launchd
  mkdir -p ~/Library/LaunchAgents
  ln -sf $DOTFILES/.config/launchd/agents/*.plist ~/Library/LaunchAgents
  for plist in $DOTFILES/.config/launchd/agents/*.plist; do
    launchctl unload ~/Library/LaunchAgents/$(basename $plist)
    launchctl load ~/Library/LaunchAgents/$(basename $plist)
  done

  # Setup vscode
  mkdir -p ~/Library/Application\ Support/Code/User
  ln -sf $DOTFILES/.config/vscode/keybindings.json ~/Library/Application\ Support/Code/User
  ln -sf $DOTFILES/.config/vscode/settings.json ~/Library/Application\ Support/Code/User
  defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
fi

# Install prezto
if [ -d ~/.zprezto ]; then
  (cd ~/.zprezto && git pull && git submodule sync --recursive && git submodule update --init --recursive)
else
  git clone --recursive https://github.com/sorin-ionescu/prezto.git ~/.zprezto
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
ln -sf $DOTFILES/.tool-versions ~
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
pyenv install --skip-existing 2.7.18
pyenv global 3.11.7 2.7.18
pip install --upgrade pip

# Install pipx packages
pipx install --include-deps ansible
pipx install git+https://github.com/nakatuba/pgcli.git
pipx install mycli neovim-remote poetry powerline-status trash-cli
pipx inject pgcli psycopg_binary  # https://github.com/dbcli/pgcli/issues/1413

# Install tmux plugins
if [ -d ~/.config/tmux/plugins/tpm ]; then
  (cd ~/.config/tmux/plugins/tpm && git pull)
else
  git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
fi
~/.config/tmux/plugins/tpm/bin/install_plugins

# Clone my repositories
ghq get https://github.com/nakatuba/notes.nvim.git
