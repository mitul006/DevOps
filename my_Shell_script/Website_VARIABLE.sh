#!/bin/bash

# Variable Declaration
PACKAGES="httpd wget unzip"
SERVICE="httpd"
URL='https://templatemo.com/tm-zip-files-2020/templatemo_589_lugx_gaming.zip'
ARTIFACT_NAME='templatemo_589_lugx_gaming'
TEMP_DIR="/tmp/webfiles"

# Stop the service if it's running
echo "Stopping $SERVICE service"
sudo systemctl stop $SERVICE

# Remove existing content in the web folder
echo "Removing existing content from /var/www/html"
sudo rm -rf /var/www/html/*

# Uninstall packages
echo "Uninstalling packages: $PACKAGES"
sudo yum remove $PACKAGES -y

# Update the system
echo "Updating the system"
sudo yum update -y > /dev/null 

# Install required packages
echo "Installing packages: $PACKAGES"
sudo yum install $PACKAGES -y > /dev/null

# Start and enable the HTTPD service
echo "Starting and enabling $SERVICE service"
sudo systemctl start $SERVICE
sudo systemctl enable $SERVICE

# Create a temporary directory for artifact deployment
echo "Creating a temporary directory: $TEMP_DIR"
mkdir -p $TEMP_DIR
cd $TEMP_DIR

# Download and unzip the template
echo "Downloading, unzipping, and copying the template to /var/www/html"
wget $URL
unzip "$ARTIFACT_NAME.zip" > /dev/null
sudo cp -r "$ARTIFACT_NAME"/* /var/www/html

# Restart the HTTPD service
echo "Restarting $SERVICE service"
sudo systemctl restart $SERVICE

# Clean up temporary files
echo "Cleaning up temporary files"
rm -rf $TEMP_DIR

# Display IP address to access the website
echo "Your server's IP address:"
hostname -I

# Show the status of the HTTPD service
echo "Status of $SERVICE service:"
sudo systemctl status $SERVICE

