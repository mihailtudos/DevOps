#!/bin/bash

# Function to check if a command is available
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check if mongod is installed
if command_exists mongod; then
    echo "MongoDB is already installed."
    exit 0
fi

# Get the distribution information
distribution=$(lsb_release -is)

echo "Installing mongodb on your Ubuntu OS..."


if [ "$distribution" != "Ubuntu" ]; then
    echo "The system is not running $distribution."
    exit 1
fi


# Updating the package index files
sudo apt-get -y update


# Check if gpg is installed
if ! command_exists gpg; then
    echo "Installing GnuPG (gpg)..."
    sudo apt-get install -y gnupg
fi

# Check if curl is installed
if ! command_exists curl; then
    echo "Installing curl..."
    sudo apt-get install -y curl
fi


# Import the public key used by the package management system
curl -fsSL https://pgp.mongodb.com/server-7.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
   --dearmor


# Create the list file /etc/apt/sources.list.d/mongodb-enterprise-7.0.list 
# for your version of Ubuntu.
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] " \
    " https://repo.mongodb.com/apt/ubuntu jammy/mongodb-enterprise/7.0 multiverse" \
    | sudo tee /etc/apt/sources.list.d/mongodb-enterprise-7.0.list


# Reload local package database
sudo apt-get -y update


# Install the MongoDB Enterprise packages
sudo apt-get install -y mongodb-enterprise

# Reloading the source
source ~/.bashrc

# Check if mongod is installed
if ! command_exists mongod; then
    echo "Failed to install MongoDB, try again."
    exit 1
else
    echo "MongoDB is already installed."
    exit 0
fi