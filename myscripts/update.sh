#!/bin/bash

if ! git pull -X theirs origin main; then
    echo "Конфликт при выполнении git pull. Откат изменений."
    git merge --abort
    exit 1
fi

# Определяем директорию, в которой находится скрипт
SCRIPT_DIR=$(dirname "$(realpath "$0")")

source $SCRIPT_DIR/main.sh
source $SCRIPT_DIR/nvim_update.sh
