#!/bin/bash

# Log Analyzer Script

# Set variables
LOG_DIR="/path/to/logs"
REPORT_FILE="/path/to/report.txt"
DATE=$(date +"%Y-%m-%d %H:%M:%S")

# Analyze logs and generate report
echo "Log Analysis Report - ${DATE}" > "${REPORT_FILE}"

for log_file in "${LOG_DIR}"/*.log; do
    echo "=== ${log_file} ===" >> "${REPORT_FILE}"
    grep "ERROR" "${log_file}" >> "${REPORT_FILE}"
    echo -e "\n" >> "${REPORT_FILE}"
done

echo "Report generation completed."
