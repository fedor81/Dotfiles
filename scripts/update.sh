#!/bin/bash

git clone git@github.com:fedor81/Dotfiles.git ~

source plugins-install.sh

# Синхронизация tmux
~/.tmux/plugins/tpm/bin/install_plugins
 
# Синхронизация плагинов nvim
nvim --headless +"Lazy! sync" +qa
