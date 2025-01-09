Function Set-ExplorerSettings {

Set-Itemproperty -path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'HideFileExt' -value 0 #Show file extensions
Set-Itemproperty -path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'LaunchTo' -value 1 #Open file explorer to This PC
Set-Itemproperty -path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'AutoCheckSelect' -value 0 #Do not show item checkboxes

}

Set-ExplorerSettings
