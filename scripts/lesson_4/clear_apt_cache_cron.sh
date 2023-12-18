#!/bin/bash

# Remove any existing apt clear comands
crontab -l | grep -v "sudo apt-get clean" | crontab -
echo "Existing comands removed"

# Add the new cron job
echo "0 16 1 * * sudo apt-get clean" | crontab -u "$USER" -

echo "🕹️  Job scheduled, make sure scheduled task has the right permission set 💡💡💡"
