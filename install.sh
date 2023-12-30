ln -s ~/dotfiles/.tmux.conf ~
ln -s ~/dotfiles/.zlogin ~
ln -s ~/dotfiles/.zlogout ~
ln -s ~/dotfiles/.zpreztorc ~
ln -s ~/dotfiles/.zprofile ~
ln -s ~/dotfiles/.zshenv ~
ln -s ~/dotfiles/.zshrc ~

mkdir -p ~/.config

ln -s ~/dotfiles/.config/* ~/.config

# Install prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git ~/.zprezto

# Install homebrew
if [ "$(uname)" = "Darwin" ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install asdf
if [ "$(uname)" = "Linux" ]; then
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf
fi

# Install cargo
curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path

# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all --no-update-rc

# Install pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
git clone https://github.com/pyenv/pyenv-update.git ~/.pyenv/plugins/pyenv-update

# Install nodenv
git clone https://github.com/nodenv/nodenv.git ~/.nodenv
git clone https://github.com/nodenv/node-build.git ~/.nodenv/plugins/node-build
git clone https://github.com/nodenv/nodenv-update.git ~/.nodenv/plugins/nodenv-update

# Install rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

# Install goenv
git clone https://github.com/go-nv/goenv.git ~/.goenv
