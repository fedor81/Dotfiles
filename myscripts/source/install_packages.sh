#!/bin/bash

# Определение os и установщика пакетов
OS="$(uname)"
INSTALLER=""
FULL_UPDATE=""

if [[ "$OSTYPE" == "darwin"* ]]; then   # MacOS
    INSTALLER="brew install"
    FULL_UPDATE="brew upgrade"
    PACKAGES+=(
        iterm2
        sevenzip
    )
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if [[ -f /etc/arch-release || -f /etc/manjaro-release ]]; then
        # Arch Linux or Manjaro
        INSTALLER="sudo pacman -S --noconfirm"
        FULL_UPDATE="sudo pacman -Syu --noconfirm"
        PACKAGES+=(
            timeshift
            ttf-jetbrains-mono-nerd
            pipewire
            p7zip
            yay
        )

        if [ "$INSTALL_HYPR" = true ]; then
            source $SCRIPT_DIR/packages_hypr.sh
        fi
    fi
fi

print "Установка пакетов"
for PACKAGE in "${PACKAGES[@]}"
do
    $INSTALLER $PACKAGE
done
