#!/usr/bin/bash

# Get filename from command line argument.
FN=$1

# Remove trailing whitespaces from file.
sed -i 's/[[:space:]]*$//' "${FN}"

# Exit script without error.
exit 0
