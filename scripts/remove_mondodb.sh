#!/bin/bash

# Stop the MongoDB service:
sudo systemctl stop mongod

# Remove MongoDB packages
sudo apt-get purge mongodb-org*

# Remove the MongoDB data directory
sudo rm -r /var/log/mongodb
sudo rm -r /var/lib/mongodb

# Remove MongoDB configuration files
sudo rm /etc/mongod.conf

# Remove the MongoDB user and group
sudo userdel mongodb
sudo groupdel mongodb

# Remove the MongoDB repository file (if added)
sudo rm /etc/apt/sources.list.d/mongodb*.list

# Update the package manager
sudo apt-get -y autoremove
sudo apt-get -y update