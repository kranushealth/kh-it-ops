#Fill this variable with the Winget package ID
$PackageName = "AgileBits.1Password"

#Creating Loggin Folder
if (!(Test-Path -Path C:\_MEM\WinGetLogs\Uninstall)) {
    New-Item -Path C:\_MEM\WinGetLogs\Uninstall -Force -ItemType Directory
}
#Start Logging
Start-Transcript -Path "C:\_MEM\WinGetLogs\Uninstall\$($PackageName)_Uninstall.log" -Append

#Detect Apps
$InstalledApps = winget list --id $PackageName

if ($InstalledApps) {
    
    Write-Host "Trying to uninstall $($PackageName)"
    
    try {        
        $ResolveWingetPath = Resolve-Path "C:\Program Files\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe"
        if ($ResolveWingetPath){
               $WingetPath = $ResolveWingetPath[-1].Path
        }
    
        $config
        cd $WingetPath

        .\winget.exe uninstall $PackageName --silent
    }
    catch {
        Throw "Failed to uninstall $($PackageName)"
    }
}
else {
    Write-Host "$($PackageName) is not installed or detected"
}

Stop-Transcript