#!/bin/bash

echo "Установка ohmyzsh"
# Download the installer script
curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -o ohmyzsh_install.sh
# Make a backup of the original installer
cp ohmyzsh_install.sh ohmyzsh_install.sh.bak
# Remove the line that changes the shell
sed -i '' '/env zsh -l/d' ohmyzsh_install.sh
# Run the modified installer
sh ohmyzsh_install.sh

echo "Клонирование конфига"
SCRIPT_DIR=$(dirname "$BASH_SOURCE")
git clone https://github.com/fedor81/Dotfiles.git $SCRIPT_DIR
mv $SCRIPT_DIR/* ~

PACKAGES=(
    neovim
    eza
    thefuck
    alacritty

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

    # Для c++
    llvm
    cppcheck

    # Для Rust
    graphviz
)

# Определение os и установщика пакетов
OS="$(uname)"
INSTALLER=""

if [[ "$OSTYPE" == "darwin"* ]]; then
    # MacOS
    INSTALLER="brew install"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if [[ -f /etc/arch-release || -f /etc/manjaro-release ]]; then
        # Arch Linux or Manjaro
        INSTALLER="sudo pacman -S --noconfirm"
        # Ubuntu/Debian
    else
        INSTALLER="sudo apt-get install -y"
    fi
fi

echo "Установка пакетов"
for PACKAGE in "${PACKAGES[@]}"
do
    $INSTALLER $PACKAGE
done

echo "Установка zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo "Установка zsh-completions"
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions

echo "Настройка alacritty"
mkdir -p ~/.config/alacritty/themes
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes

echo "Установка Rust"
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh

echo "Установка менеджера плагинов tmux"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins

echo "Синхронизация плагинов nvim"
nvim --headless +"Lazy! sync" +qa
nvim --headless "+MasonUpdate" +qa

# Переключение на установленную zsh
exec zsh -l
