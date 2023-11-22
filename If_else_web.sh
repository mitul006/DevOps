#!/bin/bash

Packages="wget unzip httpd"
Service="httpd"
TemPath="/tmp/webfiles"
URLWeb="https://www.tooplate.com/zip-templates/2130_waso_strategy.zip"
WEBPath="2130_waso_strategy"

# Function to check the success of the last command
check_success() {
  if [ $? -eq 0 ]; then
    echo "Success"
  else
    echo "Error: The last command did not execute successfully. Exiting..."
    exit 1
  fi
}

# Remove existing content in the web folder
echo "Removing existing content from /var/www/html"
sudo rm -rvf /var/www/html/*
check_success

# Uninstall packages
echo "Uninstalling packages: $Packages"
sudo yum erase $Packages -y
check_success

# Install required packages
echo "Installing packages: $Packages"
sudo yum install $Packages -y >> /dev/null
check_success

# Start and enable the HTTPD service
echo "Starting and enabling $Service service"
sudo systemctl start $Service
sudo systemctl enable $Service
check_success

# Create a temporary directory for artifact deployment
echo "Creating a temporary directory: $TemPath"
mkdir -p $TemPath
cd $TemPath
check_success

# Download and unzip the template
echo "Downloading, unzipping, and copying the template to /var/www/html"
wget $URLWeb
check_success
unzip $WEBPath.zip >> /dev/null
check_success
sudo cp -rvf $WEBPath/* /var/www/html >> /dev/null
check_success

# Restart the HTTPD service
echo "Restarting $Service service"
systemctl restart $Service
check_success

# Clean up temporary files
echo "Cleaning up temporary files"
rm -rvf $TemPath
check_success

echo "Script executed successfully."
