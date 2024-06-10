#!/bin/bash

# Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

brew install tmux
# Менеджер плагинов tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins

brew install neovim
# Синхронизация плагинов nvim
nvim --headless +"Lazy! sync" +qa
