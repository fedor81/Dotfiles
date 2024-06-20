#!/bin/bash

# Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

source plugins-install.sh

# Менеджер плагинов для tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins

# Синхронизация плагинов nvim
nvim --headless +"Lazy! sync" +qa
nvim --headless "+MasonUpdate" +qa
