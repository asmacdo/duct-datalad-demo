#!/bin/bash

# Demo utility functions for duct+datalad OHBM demo

banner() {
    local title="$1"
    local message="$2"
    local color="${3:-36}"  # Default to cyan

    # Clear screen and set colors
    # TODO re-enable, left out for development
    clear
    echo -e "\033[${color}m"

    # Print banner
    echo "=================================="
    echo "  $title"
    echo "=================================="
    echo
    if [ -n "$message" ]; then
        echo "$message"
        echo
    fi

    # Reset color to white for subsequent commands
    echo -e "\033[0m"
}
