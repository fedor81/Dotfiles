#!/bin/bash

# Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# TODO: Скрипт прерывается после установки oh-,y-zsh
git clone git@github.com:fedor81/Dotfiles.git ~
# TODO: Для клонирования каталог должен быть пустым

PACKAGES=(
neovim
eza
thefuck

yazi
# Следующие плагины нужны для поддержки yazi
ffmpegthumbnailer
unarchiver
jq
poppler
fd

# Плагины для быстрого поиска
ripgrep
fzf
zoxide
)

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

for PACKAGE in "${PACKAGES[@]}"
do
   $INSTALLER $PACKAGE
done


# Менеджер плагинов для tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins

# Синхронизация плагинов nvim
nvim --headless +"Lazy! sync" +qa
nvim --headless "+MasonUpdate" +qa
