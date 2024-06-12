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

# Установка плагинов из plugins.txt
while IFS= read -r plugin
do
   install_package $plugin
done < plugins.txt
