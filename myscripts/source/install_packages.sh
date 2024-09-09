#!/bin/bash

# Список пакетов
PACKAGES=()
source $SCRIPT_DIR/packages/packages.sh

# Определение os и установщика пакетов
OS="$(uname)"
INSTALLER=""
FULL_UPDATE=""

if [[ "$OSTYPE" == "darwin"* ]]; then   # MacOS
    INSTALLER="brew install"
    FULL_UPDATE="brew upgrade"
    source $SCRIPT_DIR/packages/packages_mac.sh
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if [[ -f /etc/arch-release || -f /etc/manjaro-release ]]; then
        # Arch Linux or Manjaro
        INSTALLER="sudo pacman -S --noconfirm"
        FULL_UPDATE="sudo pacman -Syu --noconfirm"
        source $SCRIPT_DIR/packages/packages_arch.sh

        if [ "$INSTALL_HYPR" = true ]; then
            source $SCRIPT_DIR/packages/packages_hypr.sh
        fi
    fi
fi

print "Установка пакетов"
for PACKAGE in "${PACKAGES[@]}"
do
    echo $PACKAGE
    # $INSTALLER $PACKAGE
done
