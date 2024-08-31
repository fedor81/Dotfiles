#!/bin/bash

# Подключаем "Красивый" вывод
source $SCRIPT_DIR/print.sh

# Все флаги
INSTALL_HYPR=false

# Обработка флагов
source $SCRIPT_DIR/flags.sh $@

# Список пакетов
PACKAGES=()
source $SCRIPT_DIR/packages.sh

# Установка пакетов
source $SCRIPT_DIR/install_packages.sh
