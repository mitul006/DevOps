#!/bin/bash

# Update the system 
# /dev/null is for not show the all details when we run the command
echo "#################################"
echo "Install or Update the system"
echo "#################################"
sudo yum update -y > /dev/null 
echo 

#installing Dependencies
echo "#################################"
echo "Install packages"
echo "#################################"
sudo yum install wget unzip httpd -y > /dev/null
echo

#Start & Enable Service
echo "#################################"
echo "Start and Enalbe HTTPD service"
echo "#################################"
sudo systemctl start httpd
sudo systemctl enable httpd
echo

# Create Tmp Directory 
echo "#################################"
echo "Starting Artifact Deployment"
echo "#################################"
mkdir -p /tmp/webfiles
cd /tmp/webfiles
echo 

# Download and Unzip the template
echo "#################################"
echo "Download, unzip and copy the Template to the htmp folder"
echo "#################################"
wget https://www.tooplate.com/zip-templates/2110_character.zip
unzip 2110_character.zip > /dev/null
sudo cp -r 2110_character/* /var/www/html
echo

# Bounce Service
echo "#################################"
echo "Restart HTTPD service"
echo "#################################"
systemctl restart httpd 
systemctl status httpd
echo

# Clean Up
echo "#################################"
echo "Removing Temporary Files"
echo "#################################"
rm -rvf /tmp/webfiles
echo "#################################"
echo "Remved all files"
echo "#################################"
echo 

# Show Ip address to run on Browser
echo "#################################"
echo "Ip address show"
echo "#################################"
ifconfig
hostname -i 
echo




