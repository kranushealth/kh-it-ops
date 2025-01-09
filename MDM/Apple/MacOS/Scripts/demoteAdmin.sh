#!/bin/bash

# Specify the usernames of the users who should be excluded, separated by a space
excludedUsers=("it-support" "local-admin")

# Specify the path to the log folder
logFolder="/Library/Logs/Microsoft/IntuneScripts"

## Check if the log directory has been created and start logging
if [ -d $logFolder ]; then
    ## Already created
    echo "# $(date) | Log directory already exists - $logFolder"
else
    ## Creating Metadirectory
    echo "# $(date) | creating log directory - $logFolder"
    mkdir -p $logFolder
fi

# Get the current user's username
currentUser=$(ls -l /dev/console | awk '{print $3}')

# Check if the current user is an admin and is not one of the excluded users
if dseditgroup -o checkmember -m $currentUser admin | grep -q "yes" && [[ ! " ${excludedUsers[@]} " =~ " ${currentUser} " ]]; then
    # Remove the current user from the admin group
    dseditgroup -o edit -d $currentUser -t user admin
    echo "Admin rights have been removed for $currentUser."
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Admin rights have been removed for $currentUser." >> "$logFolder/demoteAdminUsers.log"
else
    echo "$currentUser is not an admin or is one of the excluded users."
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $currentUser is not an admin or is one of the excluded users." >> "$logFolder/demoteAdminUsers.log"
fi
