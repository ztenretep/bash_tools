#!/usr/bin/bash
#
# Allowed settings for persistance mode (pm):
#    pm on : 1 or ENABLED
#    pm off: 0 or DISABLED

# Set the device.
DEV=0

# Set the status.
STATUS=ENABLED

# Change persistance mode.
nvidia-smi -i "${DEV}" -pm "${STATUS}"

# Exit script without error.
exit 0
