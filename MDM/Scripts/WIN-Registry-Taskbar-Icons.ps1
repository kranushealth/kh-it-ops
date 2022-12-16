Function Set-TaskbarIcons {

# Removes Task View from the Taskbar
New-itemproperty 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'ShowTaskViewButton' -Value 0 -PropertyType Dword
 
# Removes Widgets from the Taskbar
New-itemproperty 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'TaskbarDa' -Value 0 -PropertyType Dword
 
# Removes Chat from the Taskbar
New-itemproperty 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'TaskbarMn' -Value 0 -PropertyType Dword
 
# Default StartMenu alignment 0=Left
# New-itemproperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarAl" -Value "0" -PropertyType Dword
 
# Removes Search from the Taskbar
New-itemproperty 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Search' -Name 'SearchboxTaskbarMode' -Value 0 -PropertyType Dword

}

Set-TaskbarIcons