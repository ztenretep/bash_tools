#!/usr/bin/bash
#
# The nvidia-smi command is shipped with the graphics card driver from Nvidia.
# After setting the power of an installed Nvidia graphics card, this script
# displays the current power consumption at an interval of 1000 milliseconds.

# Set the grafic card number to monitor.
DEV=0

# Function which is called from trap.
trap_ctrl_c() {
    echo '<CTRL+C> has been trapped!'
    exit 1
}

# Set up trap for CTRL+C.
trap trap_ctrl_c INT

# Print the current power draw of the Nvidia grafic card to the screen.
nvidia-smi -i ${DEV} --query-gpu=power.draw --format=csv --loop-ms=1000

# Exit script without error.
exit 0
