$ProgramName = "9WZDNCRFJ3PZ"

$wingetPrg_Existing = & $winget_exe list --id $ProgramName --exact --accept-source-agreements
if ($wingetPrg_Existing -like "*$ProgramName*"){
	Write-Host "Found it!"
}