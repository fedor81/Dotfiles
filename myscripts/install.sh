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

INSTALL_HYPR=false

HYPR_PACKAGES=(
    # hyprland и разное
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

# Обработка флагов
while [ -n "$1" ]
do
    case "$1" in
        --hypr) INSTALL_HYPR=true ;;
        -h|--help)
            echo "Usage: $0 [options]"
            echo "Options:"
            echo "  --hypr       Install Hypr on Arch Linux"
            echo "  -h, --help   Show this help message"
            exit 0
            ;;
    esac
    shift
done

# Определение os и установщика пакетов
OS="$(uname)"
INSTALLER=""

if [[ "$OSTYPE" == "darwin"* ]]; then   # MacOS
    INSTALLER="brew install"
    PACKAGES+=(
        iterm2
    )
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if [[ -f /etc/arch-release || -f /etc/manjaro-release ]]; then
        # Arch Linux or Manjaro
        INSTALLER="sudo pacman -S --noconfirm"
        PACKAGES+=(
            timeshift
            ttf-jetbrains-mono-nerd
        )

        if [ "$INSTALL_HYPR" = true ]; then
            PACKAGES+=("${HYPR_PACKAGES[@]}")
        fi
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
