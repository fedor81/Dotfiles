#!/bin/bash

# Определяем директорию, в которой находится скрипт
SCRIPT_DIR=$(dirname "$(realpath "$0")")

source $SCRIPT_DIR/source/main.sh

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

source $SCRIPT_DIR/source/nvim_update.sh
