#!/bin/bash
#set -x

############################################################################################
##
## Script to download Desktop Wallpaper
##
###########################################

# Define variables
wallpaperUrl="https://github.com/kranushealth/kh-it-ops/raw/main/MDM/Wallpaper/KranusHealth.jpg"
wallpaperDir="/Library/_MEM/Wallpaper"
wallpaperFile="KranusHealth.jpg"
logDir="/Library/Logs/Microsoft/IntuneScripts/Wallpaper"
logFile="getDesktopWallpaper"
log="$logDir/$logFile.log" 

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
echo "# $(date) | Starting download of Desktop Wallpaper"
echo "############################################################"
echo ""

##
## Checking if Wallpaper directory exists and create it if it's missing
##
if [ -d $wallpaperDir ]
then
  echo "$(date) | Wallpaper dir [$wallpaperDir] already exists"
else
  echo "$(date) | Creating [$wallpaperDir]"
  mkdir -p $wallpaperDir
fi

##
## Attempt to download the image file. No point checking if it already exists since we want to overwrite it anyway
##
echo "$(date) | Downloading Wallpaper from [$wallpaperUrl] to [$wallpaperDir/$wallpaperFile]"
curl -L -o $wallpaperDir/$wallpaperFile $wallpaperUrl
if [ "$?" = "0" ]; then
  echo "$(date) | Wallpaper [$wallpaperUrl] downloaded to [$wallpaperDir/$wallpaperFile]"
  #killall Dock
  exit 0
else
  echo "$(date) | Failed to download wallpaper image from [$wallpaperUrl]"
  exit 1
fi