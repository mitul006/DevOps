#!/bin/bash

# Variables
PACKAGES="wget unzip httpd"
SERVICE="httpd"
TEMP_PATH="/tmp/webfiles"
URL_WEB="https://www.tooplate.com/zip-templates/2137_barista_cafe.zip"
WEB_PATH="2137_barista_cafe"

# Function to clean up temporary files
cleanup_temp_files() {
  echo "Cleaning up temporary files in $TEMP_PATH"
  rm -rf $TEMP_PATH
}

# Main script
main() {
  # Remove existing content in the web folder
  echo "Removing existing content from /var/www/html"
  sudo rm -rf /var/www/html/*

  # Uninstall packages
  echo "Uninstalling packages: $PACKAGES"
  sudo yum erase $PACKAGES -y

  # Install required packages
  echo "Installing packages: $PACKAGES"
  sudo yum install $PACKAGES -y > /dev/null

  # Start and enable the HTTPD service
  echo "Starting and enabling $SERVICE service"
  sudo systemctl start $SERVICE
  sudo systemctl enable $SERVICE

  # Create a temporary directory for artifact deployment
  echo "Creating a temporary directory: $TEMP_PATH"
  mkdir -p $TEMP_PATH
  cd $TEMP_PATH

  # Download and unzip the template
  echo "Downloading, unzipping, and copying the template to /var/www/html"
  wget $URL_WEB
  unzip "$WEB_PATH.zip" > /dev/null
  sudo cp -rvf "$WEB_PATH"/* /var/www/html > /dev/null

  # Restart the HTTPD service
  echo "Restarting $SERVICE service"
  sudo systemctl restart $SERVICE

  # Clean up temporary files
  cleanup_temp_files
}

# Run the main script
main
