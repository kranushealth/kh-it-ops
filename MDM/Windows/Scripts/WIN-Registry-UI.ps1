#Create the folders _MEM\Wallpaper in C:\

$folderPath = "C:\_MEM\Wallpaper"

if (-Not (Test-Path -Path $folderPath)) {
    # Folder does not exist, create it
    New-Item -ItemType Directory -Path $folderPath -Force | Out-Null
} else {
   # Folder already exists
}

#Copies the Wallpaper from GitHub project kh-it-ops
Invoke-WebRequest -Uri "https://github.com/kranushealth/kh-it-ops/raw/main/MDM/Wallpaper/KranusHealth.jpg" -OutFile "C:\_MEM\Wallpaper\KranusHealth.jpg"


Function Set-WallPaper($Value) {
   
   #Set the registry key for the wallpaper
	Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name WallPaper -Value $Value
	
	#Set the registry keys for the size of the wallpaper to fixed
    New-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name WallPaperStyle -PropertyType String -Value 6 -Force
    New-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name TileWallPaper -PropertyType String -Value 0 -Force
	
	#Set the registry key for backgroundcolor to white
	Set-ItemProperty -Path 'HKCU:\Control Panel\Colors' -Name Background -Value "255 255 255" -Force
	
	#Set the registry keys for dark mode
	Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize' -Name AppsUseLightTheme -Value 0
	Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize' -Name SystemUsesLightTheme -Value 0

	#Show This PC on Desktop
	Set-Itemproperty -path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel' -Name '{20D04FE0-3AEA-1069-A2D8-08002B30309D}' -Value 0 
}

Set-WallPaper -Value "C:\_MEM\Wallpaper\KranusHealth.jpg"
