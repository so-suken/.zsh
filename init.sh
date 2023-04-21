#!/bin/zsh


# intall Homebrew to ~/.homebrew
mkdir $HOME/.homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C $HOME/.homebrew

# install pyenv and virtualenv
brew install pyenv virtualenv
brew unlink pyenv && brew link pyenv
# install pyenv update
git clone https://github.com/pyenv/pyenv-update.git $(pyenv root)/plugins/pyenv-update
# install pyenv packages
brew install xz

# install shell environment needed packages
brew install exa bat neovim lazygit

# install zplug
brew install zplug
