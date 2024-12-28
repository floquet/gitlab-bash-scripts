#!/usr/bin/env bash
# Script to set up the environment, customize the terminal, and record environment variables.
# Author: Daniel
# Improvements and comments: Achates (ChatGPT, OpenAI, December 2024)

# Print the current date and script name in bold for logging purposes.
printf '%s\n' "$(date), $(tput bold)\"${BASH_SOURCE[0]}\"$(tput sgr0)"

## --------------------------------------------------
## Set terminal title and prompt
## --------------------------------------------------

# Reference: How to rename terminal tab title in Gnome Terminal:
# http://unix.stackexchange.com/questions/177572/how-to-rename-terminal-tab-title-in-gnome-terminal
host_name=$(hostname) # Store the hostname for reuse in the prompt and terminal title.
PROMPT_COMMAND='echo -ne "\033]0;${host_name}\007"' # Update terminal title dynamically.

# Define a colorful and informative prompt (PS1) for the terminal.
alias myprompt="export PS1='\[\033[00;35m\]\u\[\033[00m\]@\[\033[00;35m\]\H\[\033[00m\]:\[\033[00;33m\]\W\[\033[00m\] \[\033[00;36m\]\$ '"
myprompt # Apply the custom prompt.

## --------------------------------------------------
## Define utility functions for terminal styling
## --------------------------------------------------

# Function: bold
# Description: Outputs the ANSI escape sequence for bold text.
# Pedantic note (by Achates): This function dynamically executes `tput bold` every time it's called.
# This ensures compatibility with the current terminal environment and avoids exporting static variables
# that might become stale if the terminal settings change.
bold() { tput bold; }

# Function: normal
# Description: Outputs the ANSI escape sequence to reset text to normal formatting.
# Pedantic note (by Achates): Similarly to `bold`, this function dynamically executes `tput sgr0`.
# This guarantees proper formatting even if the terminal state changes, such as after a color reset.
normal() { tput sgr0; }

## --------------------------------------------------
## Environment variable setup
## --------------------------------------------------

# Set the library path for the CDF tool.
export CDF_LIB="${HOME}/apps/cdf-3.8.0/lib"

## --------------------------------------------------
## Environment logging utilities
## --------------------------------------------------

# Directory to store environment logs. Ensure it exists.
locker="${HOME}/env_locker"
mkdir -p "$locker"

# Function: environment_tasker
# Description: Orchestrates the recording of environment variables by calling helper functions.
# Arguments:
#   $1 - Name of the file to store the environment variable assignments.
environment_tasker() {
    write_environment_assignments "${locker}/${1}"
}

# Function: write_environment_assignments
# Description: Writes the current environment variables to a specified file, preceded by a standard header.
# Arguments:
#   $1 - File path to write environment variables to.
write_environment_assignments() {
    write_standard_header "environment variables" "${1}"
    echo "env:" >> "${1}"
    env >> "${1}" # Record all current environment variables.
}

# Stub for the write_standard_header function (assuming it's defined elsewhere).
# Uncomment or define this function if needed.
# write_standard_header() {
#     echo "=== $1 ===" >> "$2"
# }

# Execute the environment logging task.
environment_tasker "environment-variables.txt"

## --------------------------------------------------
## User-friendly aliases
## --------------------------------------------------

# Alias: contents_environment
# Description: Outputs a description of how to write environment variables to a file.
contents_environment() {
    echo "Write list of environment commands to environment_variables.txt"
}

# End of script

