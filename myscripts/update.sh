#!/bin/bash

# Определяем директорию, в которой находится скрипт
SCRIPT_DIR=$(dirname "$(realpath "$0")")

cd $HOME

if ! git pull -X theirs origin master; then
    echo "Конфликт при выполнении git pull. Откат изменений."
    git merge --abort
    echo "Выполните git pull вручную и перезапустите скрипт"
    exit 1
fi

source $SCRIPT_DIR/source/main.sh $@
source $SCRIPT_DIR/source/nvim_update.sh
