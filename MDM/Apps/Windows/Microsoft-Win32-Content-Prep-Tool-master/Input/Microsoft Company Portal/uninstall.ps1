$ProgramName = "9WZDNCRFJ3PZ"
$Path_local = "$Env:Programfiles\_MEM"
Start-Transcript -Path "$Path_local\Log\uninstall\$ProgramName-uninstall.log" -Force -Append

winget uninstall --exact --id $ProgramName --silent --accept-package-agreements --accept-source-agreements

Stop-Transcript
