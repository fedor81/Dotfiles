#!/bin/bash

GREEN='\033[0;32m'
NOCOLOR='\033[0m'

print() {
    echo -e "${GREEN}\n=== $1 ===\n${NOCOLOR}"
}

PACKAGES=(
    zsh
    git
    curl
    neovim
    eza
    thefuck
    alacritty
    lazygit
    telegram-desktop
    discord

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

    # Для Neovim Rust
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
        PACKAGES+=(
            timeshift
            ttf-jetbrains-mono-nerd
            
            # hyprland and more
            hyprland
            waybar
            wofi
            dunst
            pipewire
            polkit-kde-agent
            qt5-wayland
            qt6-wayland
            cliphist
            thunar
            brightnessctl
            playerctl
        )
    else
        # Ubuntu/Debian
        INSTALLER="sudo apt-get install -y"
    fi
fi

print "Установка пакетов"
for PACKAGE in "${PACKAGES[@]}"
do
    $INSTALLER $PACKAGE
done

print "Установка Rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

print "Клонирование конфига"
CURRENT_DIR=$(pwd)
TEMP_DIR="$CURRENT_DIR/TEMP_DIR"
TARGET_DIR="$HOME"
REPO_URL="https://github.com/fedor81/Dotfiles.git"
git clone "$REPO_URL" "$TEMP_DIR"

cp -r "$TEMP_DIR/."* "$TARGET_DIR/"
rm -rf "$TEMP_DIR"

print "Установка zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
print "Установка zsh-completions"
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions

print "Настройка alacritty"
mkdir -p ~/.config/alacritty/themes
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes

print "Установка менеджера плагинов tmux"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins

print "Синхронизация плагинов nvim"
nvim --headless +"Lazy! sync" +qa
nvim --headless "+MasonInstallAll" +qa
