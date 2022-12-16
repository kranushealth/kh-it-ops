$ProgramName = "9WZDNCRFJ3PZ"
$Path_local = "$Env:Programfiles\_MEM"
Start-Transcript -Path "$Path_local\Log\$ProgramName-install.log" -Force -Append

winget install --exact --id $ProgramName --source msstore --silent --accept-package-agreements --accept-source-agreements --scope=machine

Stop-Transcript
