#!/usr/bin/bash

# Set grafic card number
DEV=0

# Print power draw of Nvidia grafic card to screen.
nvidia-smi -i $DEV --query-gpu=power.draw --format=csv --loop-ms=1000

# Exit script without error.
exit 0
