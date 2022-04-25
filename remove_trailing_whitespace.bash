#!/usr/bin/bash

# Get filename from command line argument.
FN=$1

# Check if filename was given.
if [ "${FN}" = '' ]; then
    echo "No filename given. Bye!"
    exit 1
fi

# Remove trailing whitespaces from file.
sed -i 's/[[:space:]]*$//' "${FN}"

# Exit script without error.
exit 0
