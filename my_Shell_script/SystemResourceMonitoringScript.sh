#!/bin/bash

# Resource Monitoring Script

# Set variables
LOG_FILE="/path/to/resource_usage.log"

# Collect system resource data
echo "$(date +"%Y-%m-%d %H:%M:%S") $(top -bn1 | grep 'Cpu' | awk '{print $2, $4, $6}' | tr -d '%')" >> "${LOG_FILE}"
echo "$(date +"%Y-%m-%d %H:%M:%S") $(free -m | awk '/Mem/{print $3, $4}')" >> "${LOG_FILE}"
echo "$(date +"%Y-%m-%d %H:%M:%S") $(df -h | awk '/\/dev\/sda1/{print $3, $4}')" >> "${LOG_FILE}"
