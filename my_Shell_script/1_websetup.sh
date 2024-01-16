#!/bin/bash

#Variable Declaration
PACKAGE="httpd wget unzip"
SVC="httpd"
URL='https://www.tooplate.com/zip-templates/2103_central.zip'
ART_NAME='2103_central'
TEMPDIR="/tmp/webfiles"

systemctl stop httpd
sudo rm -rvf /var/www/html/*
sudo yum remove $PACKAGE -y
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
sudo yum install $PACKAGE -y > /dev/null
echo

#Start & Enable Service
echo "#################################"
echo "Start and Enalbe HTTPD service"
echo "#################################"
sudo systemctl start $SVC
sudo systemctl enable $SVC
echo

# Create Tmp Directory 
echo "#################################"
echo "Starting Artifact Deployment"
echo "#################################"
mkdir -p $TEMPDIR
cd $TEMPDIR
echo 

# Download and Unzip the template
echo "#################################"
echo "Download, unzip and copy the Template to the htmp folder"
echo "#################################"
wget $URL
unzip $ART_NAME.zip > /dev/null
sudo cp -r $ART_NAME/* /var/www/html
echo

# Bounce Service
echo "#################################"
echo "Restart HTTPD service"
echo "#################################"
systemctl restart $SVC 
echo

# Clean Up
echo "#################################"
echo "Removing Temporary Files"
echo "#################################"
rm -rvf $TEMPDIR
echo "#################################"
echo "Remved all files"
echo "#################################"
echo 

# Show Ip address to run on Browser
echo "#################################"
echo "Ip address show"
echo "#################################"
hostname -i 
systemctl status httpd
echo




