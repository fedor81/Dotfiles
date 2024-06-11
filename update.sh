#!/bin/bash

# Синхронизация tmux
~/.tmux/plugins/tpm/bin/install_plugins
 
# Синхронизация плагинов nvim
nvim --headless +"Lazy! sync" +qa
