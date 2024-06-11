#!/bin/bash

# Определение os и установщика пакетов
OS="$(uname)"
INSTALLER=""

if [ "$OS" == "Darwin" ]; then
    # MacOS
    INSTALLER="brew install"
else
    # Ubuntu/Debian
    INSTALLER="sudo apt-get install -y"
fi

install_package() {
    $INSTALLER $1
}

# Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Установка пакетов
install_package tmux
install_package neovim

# Менеджер плагинов tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins

# Синхронизация плагинов nvim
nvim --headless +"Lazy! sync" +qa
