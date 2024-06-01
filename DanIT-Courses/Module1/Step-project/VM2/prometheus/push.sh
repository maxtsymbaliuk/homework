#!/bin/bash

function send_push_gw () {
  cat << EOF | curl --data-binary @- http://192.168.131.176:9091/metrics/job/pushtest/instance/localhost
  cpu_usage $1
EOF
}

while true; do
  CPU_USAGE=$(top -bn1 | grep "%Cpu(s)" | awk '{print $2}' | cut -d '%' -f1)
  send_push_gw $CPU_USAGE
  sleep 5
done
