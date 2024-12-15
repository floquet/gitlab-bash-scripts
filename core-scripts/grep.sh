#! /usr/bin/env bash

printf "%s\n" "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

# Script generated on: Sat Dec 14 17:15:02 MST 2024
# rep-related routines 
#! /usr/bin/env bash

# Notes on Special Characters in Grep:
# - Some characters have special meanings in grep patterns (e.g., `.` matches any character, `*` matches zero or more of the preceding element).
# - To match these characters literally, use a backslash `\` to escape them (e.g., to match a literal `*`, use `\*`).
# - If your pattern includes shell special characters (e.g., `$`, `&`, `|`), wrap the pattern in single quotes to prevent the shell from interpreting them.
# - Commonly escaped characters: `.` (dot), `*` (asterisk), `?` (question mark), `[ ]` (brackets), `^` (caret), `$` (dollar sign), `|` (pipe), and `(` `)` (parentheses).
# - Use `grep -F` for fixed-string search to avoid interpreting special characters altogether.

# Why Use `-inr` in Grep Commands:
# - `-i`: Ignore case distinctions in both the pattern and input files, making searches case-insensitive.
# - `-n`: Display the line numbers of matching lines, which is helpful for locating matches in files.
# - `-r`: Recursively search through directories, ensuring that all files matching the criteria in subdirectories are included.

# Grep on specific file types

# g-tex: Searches recursively in .tex files for the given pattern
# Usage: g-tex <pattern>
function g-tex() {
    echo "Searching in .tex files for: \${1}"
    grep -inr --include=*.tex "$1"
}

# g-fortran: Searches recursively in .f08 files for the given pattern
# Usage: g-fortran <pattern>
function g-fortran() {
    echo "Searching in .f08 files for: $1"
    grep -inr --include=*.f08 "$1"
}

# g-general: Searches recursively in all Fortran files (.f*) for the given pattern
# Usage: g-general <pattern>
function g-general() {
    echo "Searching in Fortran files (.f*) for: $1"
    grep -inr --include=*.f* "$1"
}

# g-filetype: Searches recursively in files of a specified extension
# Written by Achates
# Usage: g-filetype <extension> <pattern>
function g-filetype() {
    local ext="$1"
    shift
    echo "Searching in .$ext files for: $* 2>/dev/null"
    grep -inr --include=*.$ext "$@" 2>/dev/null
}

# g-achates: Searches for both "\newcommand{<pattern>}" and "\newcommand{ <pattern> }"
function g-newcommand-tex() {
    local pattern="$1"
    echo "Searching for in .tex files for \newcommand{${pattern} or \newcommand{ ${pattern} 2>/dev/null"
    grep -inr --include=*.tex -e '\\newcommand{\\'"${pattern}"'' -e '\\newcommand{ \\'"${pattern}"'' 2>/dev/null
}

# g-log: Logs grep results to a file
# Written by Achates
# Usage: g-log <pattern> [log_file]
function g-log() {
    local log_file="${2:-grep_results.log}"
    echo "Searching for: $1 and saving results to $log_file"
    grep -inr "$1" > "$log_file"
    echo "Results saved to $log_file"
}

# g-achates: Searches for both "\newcommand{<pattern>}" and "\newcommand{ <pattern> }"
# Written by Achates
# Usage: g-achates <pattern>
# function g-achates() {
#     local pattern="$1"
#     echo "Searching for: \\newcommand{\\${pattern}}"
#     #grep -inr --include=*.tex "\\newcommand{\\${pattern}"
#     #rep -inr --include=*.tex "\\newcommand{\\$1"
}

# grep_list: Lists available grep routines
# Written by Achates
# Usage: grep_list
function grep_list() {
    echo "Available grep routines:"
    echo "  g-tex <pattern>         - Search recursively in .tex files."
    echo "  g-fortran <pattern>     - Search recursively in .f08 files."
    echo "  g-general <pattern>     - Search recursively in Fortran files (.f*)."
    echo "  g-filetype <ext> <pattern> - Search recursively in files with specified extension."
    echo "  g-log <pattern> [file]  - Search and log results to a file."
    echo "  g-achates <pattern>     - Search for \newcommand patterns with or without spaces."
}
