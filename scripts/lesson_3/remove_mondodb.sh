# Stop the MongoDB service
sudo systemctl stop mongod

# Remove MongoDB packages and configuration files
sudo apt-get purge mongodb-org*

# Remove MongoDB data directory
sudo rm -r /var/log/mongodb
sudo rm -r /var/lib/mongodb

# Remove MongoDB user and group
sudo userdel -r mongodb
sudo groupdel mongodb

# Remove MongoDB repository files (if added)
sudo rm /etc/apt/sources.list.d/mongodb*.list

# Update the package manager
sudo apt-get autoremove
sudo apt-get update