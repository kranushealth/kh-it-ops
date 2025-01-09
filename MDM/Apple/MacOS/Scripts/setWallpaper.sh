#!/bin/sh
#set -x

############################################################################################
##
## Script to set Desktop Wallpaper
##
###########################################

# Define variables
wallpaperDir="/Library/_MEM/Wallpaper"
wallpaperFile="KranusHealth.jpg"
logDir="/Library/Logs/Microsoft/IntuneScripts/Wallpaper"
logFile="setDesktopWallpaper"
log="$logDir/$logFile.log" 
db="~/Library/Application\ Support/Dock/desktoppicture.db"
loggedInUser=$(stat -f %Su /dev/console)


##
## Checking if Log directory exists and create it if it's missing
##
if [ ! -d $logDir ]
then
    mkdir -p $logDir
fi

# start logging
exec 1>> $log 2>&1

echo ""
echo "##############################################################"
echo "# $(date) | Starting setup of Desktop Wallpaper"
echo "############################################################"
echo ""

##
## Set the desktop image file and other necessary environment settings
##

echo "$(date) | Cleanup database [$db]. Remove everything from tables data, displays, pictures, preferences, prefs & spaces and inserting all Kranus specific values."
echo "User: $loggedInUser"

sqlite3 /Users/$loggedInUser/Library/Application\ Support/Dock/desktoppicture.db " \
    DELETE FROM data; \
    DELETE FROM displays; \
    DELETE FROM pictures; \
    DELETE FROM preferences; \
    DELETE FROM prefs; \
    DELETE FROM spaces; \
    INSERT INTO pictures (space_id, display_id) VALUES (null, null); \
    INSERT INTO data (value) VALUES ('$wallpaperDir'); \
    INSERT INTO data (value) VALUES (60); \
    INSERT INTO data (value) VALUES (3); \
    INSERT INTO data (value) VALUES (1.00); \
    INSERT INTO data (value) VALUES ('$wallpaperFile'); \
    INSERT INTO data (value) VALUES (1); \
    INSERT INTO preferences (key, data_id, picture_id) VALUES (2, 3, 1); \
    INSERT INTO preferences (key, data_id, picture_id) VALUES (3, 4, 1); \
    INSERT INTO preferences (key, data_id, picture_id) VALUES (4, 4, 1); \
    INSERT INTO preferences (key, data_id, picture_id) VALUES (5, 4, 1); \
    INSERT INTO preferences (key, data_id, picture_id) VALUES (9, 6, 1); \
    INSERT INTO preferences (key, data_id, picture_id) VALUES (10, 1, 1); \
    INSERT INTO preferences (key, data_id, picture_id) VALUES (11, 2, 1); \
    INSERT INTO preferences (key, data_id, picture_id) VALUES (12, 6, 1); \
    INSERT INTO preferences (key, data_id, picture_id) VALUES (16, 5, 1); \
" && killall Dock

echo "$(date) | Finished putting all Kranus values to the database"