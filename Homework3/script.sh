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
echo "Distribution  is ubuntu"

# Get CPU usage for the last hour
cpu_usage=$(sar -u 60 60 2>&1 | awk 'END{print 100-$NF}')

# Output CPU usage to a file
log_file="/path/to/cpu-usage.log"
echo "$(date '+%Y-%m-%d %H:%M:%S') CPU Usage: $cpu_usage%" >> "$log_file"

echo "CPU usage logged to $log_file"
