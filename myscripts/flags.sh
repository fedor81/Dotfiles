#!/bin/bash

while [ -n "$1" ]
do
    case "$1" in
        --hypr) INSTALL_HYPR=true ;;
        -h|--help)
            echo "Usage: $0 [options]"
            echo "Options:"
            echo "  --hypr       Install Hypr on Arch Linux"
            echo "  -h, --help   Show this help message"
            exit 0
            ;;
    esac
    shift
done
