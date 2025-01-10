# Scale 100% = LogPixels Value 0x00000060
# Scale 125% = LogPixels Value 0x00000078
# Scale 150% = LogPixels Value 0x00000090

$exists = Get-ItemProperty -path 'HKCU:\Control Panel\Desktop' -Name 'LogPixels'

If ($exists -eq $null) {
New-ItemProperty -path 'HKCU:\Control Panel\Desktop' -Name 'LogPixels'-Value 0 -PropertyType Dword	
}

Set-ItemProperty -path 'HKCU:\Control Panel\Desktop' -Name 'LogPixels' -Value 0x00000060 


Set-ItemProperty -path 'HKCU:\Control Panel\Desktop' -Name 'Win8DpiScaling' -Value 1
