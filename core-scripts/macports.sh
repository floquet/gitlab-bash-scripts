#! /usr/bin/env bash
printf "%s\n" "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

# MacPorts PATH management
alias macports_yes="export OLD_PATH='$PATH'; export PATH='/opt/local/bin:/opt/local/sbin:$PATH'; echo 'MacPorts PATH enabled.'"
alias macports_no="export PATH='$OLD_PATH'; echo 'Reverted to original PATH.'"

# GCC and Python version selection
alias mp_gcc11='echo "sudo port select --set gcc mp-gcc11"; sudo port select --set gcc mp-gcc11'
alias mp_gcc10='echo "sudo port select --set gcc mp-gcc10"; sudo port select --set gcc mp-gcc10'

# MacPorts Maintenance
mp_maintenance() {
    if ! command -v port &>/dev/null; then
        echo "❌ MacPorts (port) is not installed or not in PATH. Aborting."
        return 1
    fi

    echo "========== Starting MacPorts Maintenance =========="

    echo "1. Performing selfupdate..."
    if sudo port -v selfupdate; then
        echo "✅ Selfupdate completed successfully."
    else
        echo "⚠️ Selfupdate failed. Continuing with the next step..."
    fi

    echo ""
    echo "2. Upgrading outdated ports..."
    if sudo port -v upgrade outdated; then
        echo "✅ Upgrade completed successfully."
    else
        echo "⚠️ Upgrade failed. Please check the logs."
    fi

    echo ""
    echo "3. Reclaiming unused space..."
    if sudo port -v reclaim; then
        echo "✅ Reclaim completed successfully."
    else
        echo "⚠️ Reclaim failed. Please check the logs."
    fi

    echo "========== MacPorts Maintenance Complete =========="
}

# Help function
mp_help() {
    echo "Available MacPorts Utilities:"
    echo "  mp_maintenance     - Perform MacPorts maintenance (selfupdate, upgrade, reclaim)."
    echo "  macports_yes       - Enable MacPorts-enhanced PATH."
    echo "  macports_no        - Revert to the original PATH."
    echo "  mp_gcc[8-11]       - Select specific GCC versions."
}

