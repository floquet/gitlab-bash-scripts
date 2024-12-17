#!/usr/bin/env bash
# platform-specific.sh: Hook for Apple-specific scripts
# Author: Daniel & Achates | Updated: $(date)

# Print a sentinel message for logging purposes
printf "%s\n" "$(date), $(tput bold)Sourcing platform-specific.sh$(tput sgr0)"

# Source apple.sh only if on an Apple system
if [[ "$(uname)" == "Darwin" ]]; then
    if [[ -f "${core}/apple.sh" ]]; then
        source "${core}/apple.sh"
    else
        echo "Warning: ${core}/apple.sh not found."
    fi
else
    echo "Platform is not macOS. Skipping Apple-specific configuration."
fi

printf "platform-specific.sh loaded successfully.\n"

