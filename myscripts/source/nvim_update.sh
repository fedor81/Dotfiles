#!/bin/bash

print "Синхронизация плагинов nvim"
nvim --headless +"Lazy! sync" +qa
# nvim --headless +"MasonInstallAll" +qa
