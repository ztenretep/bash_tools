#!/usr/bin/bash
#
# E.g. A NVIDIA GeForce RTX 3070 Ti OC can vary power in a range of 100 Watt to 320 Watt.
# Setting power limit to 100 Watt reduce the power draw in process to 100 Watt or less.

# Set the device.
POWER_LIMIT=100

# Change persistance mode.
nvidia-smi -i "${DEV}" -pl "${POWER_LIMIT}"

# Exit script without error.
exit 0
