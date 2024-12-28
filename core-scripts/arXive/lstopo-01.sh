#! /usr/bin/env bash
printf "%s\n" "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

# Check if lstopo is installed
if type "lstopo" > /dev/null 2>&1; then
    export file_base="${locker}/lstopo"
    export file_lstopo="${file_base}.txt"

    # Generate lstopo outputs only if the main file doesn't exist
    if [ ! -f "${file_lstopo}" ]; then
        echo "Generating lstopo outputs..."
        lstopo "${file_lstopo}"
        lstopo -v "${file_base}-v.txt"
        lstopo -p "${file_base}-p.txt"
        lstopo "${file_base}.pdf"
    else
        echo "Skipping lstopo generation: ${file_lstopo} already exists."
    fi

    # Handle lstopo-no-graphics outputs
    export file_no_graphics="${locker}/lstopo-no-graphics.txt"
    if [ -f "${file_no_graphics}" ]; then
        echo "Removing existing lstopo-no-graphics file: ${file_no_graphics}"
        rm "${file_no_graphics}"
    fi
    lstopo-no-graphics "${file_no_graphics}"

    # Additional lstopo-no-graphics outputs
    for suffix in txt v.txt; do
        file="${locker}/lstopo-${suffix}"
        if [ ! -f "${file}" ]; then
            echo "Generating lstopo-no-graphics ${suffix}..."
            lstopo-no-graphics "${file}"
        else
            echo "Skipping lstopo-no-graphics generation: ${file} already exists."
        fi
    done

    # Export other formats with suppression of output
    for ext in pdf png xml; do
        file="${locker}/lstopo.${ext}"
        if [ ! -f "${file}" ]; then
            echo "Exporting lstopo to ${file}..."
            lstopo "${file}" > /dev/null 2>&1
        else
            echo "Skipping lstopo export: ${file} already exists."
        fi
    done
else
    echo "lstopo not found. Skipping."
fi

