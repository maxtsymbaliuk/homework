#!/bin/sh

# Send an HTTP GET request to the /healthz endpoint of your application
response=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:5000/healthz)

# Check the HTTP response code
if [ "$response" = "200" ]; then
  exit 0 # Health check passed
else
  exit 1 # Health check failed
fi

