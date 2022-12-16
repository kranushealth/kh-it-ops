# array of preinstalled apps which needs to be deinstalled
$ProgramArray = @('Clipchamp.Clipchamp_yxz26nhyzhsrt','Microsoft.549981C3F5F10_8wekyb3d8bbwe','Microsoft.BingNews_8wekyb3d8bbwe','Microsoft.BingWeather_8wekyb3d8bbwe','Microsoft.GamingApp_8wekyb3d8bbwe','Microsoft.MicrosoftOfficeHub_8wekyb3d8bbwe','Microsoft.MicrosoftSolitaireCollection_8wekyb3d8bbwe','Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe','Microsoft.MixedReality.Portal_8wekyb3d8bbwe','Microsoft.Office.OneNote_8wekyb3d8bbwe','Microsoft.OneDriveSync_8wekyb3d8bbwe','Microsoft.People_8wekyb3d8bbwe','Microsoft.PowerAutomateDesktop_8wekyb3d8bbwe','Microsoft.SkypeApp_kzf8qxf38zg5c','Microsoft.Todos_8wekyb3d8bbwe','Microsoft.WindowsFeedbackHub_8wekyb3d8bbwe','Microsoft.WindowsMaps_8wekyb3d8bbwe','Microsoft.WindowsStore_8wekyb3d8bbwe','Microsoft,Xbox.TCUI_8wekyb3d8bbwe','Microsoft.XboxGameOverlay_8wekyb3d8bbwe','Microsoft.XboxGamingOverlay_8wekyb3d8bbwe','Microsoft.XboxIdentityProvider_8wekyb3d8bbwe','Microsoft.XBocSpeechToTextOverlay_8wekyb3d8bbwe','Microsoft.YourPhone_8wekyb3d8bbwe','Microsoft.ZuneMusic_8wekyb3d8bbwe','Microsoft.ZuneVideo_8wekyb3d8bbwe','MicrosoftTeams_8wekyb3d8bbwe','Microsoft.OneDrive','microsoft.windowscommunicationsapps_8wekyb3d8bbwe','Microsoft.Getstarted_8wekyb3d8bbwe','Microsoft.Paint_8wekyb3d8bbwe','Microsoft.WindowsNotepad_8wekyb3d8bbwe')

foreach ( $ProgramName in $ProgramArray )
{
	$Path_local = "$Env:Programfiles\_MEM"
	Start-Transcript -Path "$Path_local\Log\uninstall\$ProgramName-uninstall.log" -Force -Append

	winget uninstall --exact --id $ProgramName --silent

	Stop-Transcript
}