#!/bin/bash

# Website Backup Script

# Set variables
WEB_DIR="/var/www/html"
DB_NAME="mydatabase"
BACKUP_DIR="/path/to/backups"
DATE=$(date +"%Y%m%d")

# Backup website files
tar -czvf "${BACKUP_DIR}/web_backup_${DATE}.tar.gz" -C "${WEB_DIR}" .

# Backup database
mysqldump -u root -p"${DB_PASSWORD}" "${DB_NAME}" > "${BACKUP_DIR}/db_backup_${DATE}.sql"
