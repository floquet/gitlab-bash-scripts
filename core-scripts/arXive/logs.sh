#! /usr/bin/env bash

# Print script info
printf "%s\n" "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

# Script: logs.sh
# Purpose: Manage and standardize logging environments across machines
# Author: Achates (with Daniel's input)
# Date: $(date)

# Default logs directory
logs_dir="$HOME/logs"

# Function to create the logs directory if it doesn't exist
create_logs_dir() {
    if [ ! -d "${logs_dir}" ]; then
        echo "Logs directory not found. Creating: ${logs_dir}"
        mkdir -p "${logs_dir}" || {
            echo "Error: Unable to create logs directory at ${logs_dir}" >&2
            exit 1
        }
    else
        echo "Logs directory already exists: ${logs_dir}"
    fi
}

# Function to archive old logs
archive_logs() {
    archive_dir="${logs_dir}/archive"
    create_logs_dir  # Ensure logs directory exists
    mkdir -p "${archive_dir}"  # Create archive directory if not found
    
    echo "Archiving old logs..."
    find "${logs_dir}" -type f -not -path "${archive_dir}/*" -name "*.log" -exec mv {} "${archive_dir}" \;
    echo "Archived logs moved to: ${archive_dir}"
}

# Function to clear all logs
clear_logs() {
    echo "Clearing all logs from: ${logs_dir}"
    find "${logs_dir}" -type f -name "*.log" -delete
    echo "All logs cleared."
}

# Example Usage:
#   $core/logs.sh create  # Ensures the logs directory exists
#   $core/logs.sh archive # Moves all .log files to an archive subdirectory
#   $core/logs.sh clear   # Deletes all .log files in the logs directory
#   $core/logs.sh         # Displays usage instructions if no arguments are provided

# Main
case "$1" in
    create)
        mkdir -p "${logs_dir}"
        echo "Logs directory created at ${logs_dir}"
        ;;
    archive)
        tar -czf "${logs_dir}_$(date +%Y%m%d%H%M%S).tar.gz" "${logs_dir}" && rm -r "${logs_dir}"
        echo "Logs archived and cleared."
        ;;
    clear)
        rm -r "${logs_dir}" && mkdir -p "${logs_dir}"
        echo "Logs cleared."
        ;;
    *)
        echo "No argument provided. Defaulting to 'create'."
        mkdir -p "${logs_dir}"
        ;;
esac


