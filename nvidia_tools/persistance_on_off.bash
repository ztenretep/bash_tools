#!/usr/bin/bash
#
# The command nvidia-smi is part of the NVIDIA driver package installation.
#
# When persistence mode is enabled, the NVIDIA driver remains loaded even when no 
# active clients such nvidia-smi exists. This minimizes the driver load latency
# with respect to running applications like CUDA programs.
#
# Allowed settings for persistance mode (pm):
#    pm on : 1 or ENABLED
#    pm off: 0 or DISABLED

# Set the device.
DEV=0

# Set the status.
# STATUS=1
STATUS="ENABLED"

# Change persistance mode of device.
nvidia-smi -i "${DEV}" -pm "${STATUS}"

# Exit script without error.
exit 0
