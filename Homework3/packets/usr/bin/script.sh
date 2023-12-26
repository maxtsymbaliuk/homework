#!/bin/bash

if [ -f /etc/os-release ]; then
    source /etc/os-release
    distribution=$ID
else
    echo "Error: Unable to determine distribution."
    exit 1
fi

# Check if it's Ubuntu
if [ "$distribution" != "ubuntu" ]; then
    echo "Error: This script is intended for Ubuntu distribution only."
    exit 1
fi
echo "Distribution is ubuntu"

# Get CPU usage for the last hour using mpstat
cpu_usage=$(mpstat 1 3600 | awk '$12 ~ /[0-9.]+/ { print 100 - $12 }')

# Output to log file
echo "$(date) - CPU usage: $cpu_usage%" >> cpu-usage.log
