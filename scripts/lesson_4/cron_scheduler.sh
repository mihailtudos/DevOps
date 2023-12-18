#!/bin/bash

# Prompt the user for time values
read -p "Enter the minute (0-59): " minute
read -p "Enter the hour (0-23): " hour
read -p "Enter the day of the month (1-31): " day
read -p "Enter the month (1-12): " month
read -p "Enter the day of the week (0-6, Sunday to Saturday): " day_of_week

# Validate input
if ![[ "$minute" =~ ^[0-5]?[0-9]$ && "$hour" =~ ^[0-2]?[0-9]$ && "$day" =~ ^[0-3]?[0-9]$ && "$month" =~ ^(0[1-9]|1[0-2])$ && "$day_of_week" =~ ^[0-6]$ ]]; then
    echo "Invalid input. Please enter valid values."
    exit 1
fi

# Prompt the user for the command to run
read -p "Enter the command to run: " command_to_run

# Create a temporary file for the cron job
temp_cron_file=$(mktemp)


# Add the cron job to the temporary file
echo "$minute $hour $day $month $day_of_week" >> "$temp_cron_file"

# Schedule the cron job
crontab "$temp_cron_file"

# Remove the temporary file
rm "$temp_cron_file"

echo "Cron job scheduled successfully."
