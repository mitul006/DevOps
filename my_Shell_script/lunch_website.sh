#!/bin/bash

# Function to display section headers
function section_header() {
    echo "#################################"
    echo "$1"
    echo "#################################"
}

# Function to check and handle errors
function check_error() {
    if [ $? -ne 0 ]; then
        echo "Error occurred. Exiting script."
        exit 1
    fi
}

# Update the system
section_header "Updating the system"
sudo yum update -y > /dev/null
check_error
echo

# Install Dependencies
section_header "Installing packages"
sudo yum install wget unzip httpd -y > /dev/null
check_error
echo

# Start & Enable Service
section_header "Starting and Enabling HTTPD service"
sudo systemctl start httpd
sudo systemctl enable httpd
check_error
echo

# Create Temporary Directory
section_header "Creating Temporary Directory for Artifact Deployment"
mkdir -p /tmp/webfiles
cd /tmp/webfiles
check_error
echo

# Download and Unzip the template
section_header "Downloading, unzipping, and copying the Template to the htmp folder"
wget https://www.tooplate.com/zip-templates/2110_character.zip
check_error
unzip 2110_character.zip > /dev/null
check_error
sudo cp -r 2110_character.zip/* /var/www/html
check_error
echo

# Restart Service
section_header "Restarting HTTPD service"
sudo systemctl restart httpd
check_error
sudo systemctl status httpd
check_error
echo

# Clean Up
section_header "Removing Temporary Files"
rm -rvf /tmp/webfiles
check_error
echo "#################################"
echo "Removed all temporary files"
echo "#################################"
echo

# Show IP address to run on Browser
section_header "IP Address"
ifconfig
hostname -i

