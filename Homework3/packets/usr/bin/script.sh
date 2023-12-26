#!/bin/bash

# Check distribution
if [[ $(lsb_release -is) != "Ubuntu" ]]; then
  echo "This script is only compatible with Ubuntu distributions." >&2
  exit 1
fi

# Get CPU usage for the last hour
cpu_usage=$(sar -u -r -f /var/log/sysstat/sa1 | tail -n 1 | awk '{print $8}')

# Output to log file
echo "$(date) - CPU usage: $cpu_usage" >> cpu-usage.log
