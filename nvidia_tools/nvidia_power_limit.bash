#!/usr/bin/bash
#
# The command nvidia-smi is part of the NVIDIA driver package installation.
#
# E.g. A NVIDIA GeForce RTX 3070 Ti OC can vary power in a range of 100 Watt to 320 Watt.
# Setting power limit to 100 Watt reduce the power draw in process to 100 Watt or less.

# Set the device.
DEV=O

# Set the power limit.
POWER_LIMIT=100

# Change power limit of device.
nvidia-smi -i "${DEV}" -pl "${POWER_LIMIT}"

# Exit script without error.
exit 0
