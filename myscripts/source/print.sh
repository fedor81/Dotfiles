#!/bin/bash

GREEN='\033[0;32m'
NOCOLOR='\033[0m'

print() {
    echo -e "${GREEN}\n=== $1 ===\n${NOCOLOR}"
}
