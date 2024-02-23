#!/bin/bash

# Backup Script

# Set variables
SOURCE_DIR="/path/to/source"
DESTINATION_DIR="/path/to/backup"
DATE=$(date +"%Y%m%d_%H%M%S")

# Create backup archive
tar -czvf "${DESTINATION_DIR}/backup_${DATE}.tar.gz" -C "${SOURCE_DIR}" .
