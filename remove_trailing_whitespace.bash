#!/usr/bin/bash
#
# The script removes only trailing whitespace from a given file. 
# This is a standard task for python as well as for shell scripts.
#
# The shell command sed is used for the task. The trailing
# whitespaces are in situ removed inside the file.
#
# Within sed one can use standard Posix bracket expression for
# the removal:
# [[:space:]] = all whitespace characters including line breaks
# [[:blank:]] = space and tab

# Get the filename from the command line argument.
FN=$1

# Check if filename was given. Otherwise exit script.
if [ "${FN}" = '' ]; then
    # Print farewell message.
    echo "No filename given. Bye!"
    # Exit script with error.
    exit 1
fi

# Remove trailing whitespaces from file.
sed -i 's/[[:space:]]*$//' "${FN}"

# Exit script without error.
exit 0
