Start-Process -FilePath "$env:USERPROFILE\.config\autohotkey\init.ahk"
#Start-Process -FilePath "$env:USERPROFILE\Projects\GlazeWM\GlazeWM.exe"

$ScoopAppsPath = "$env:USERPROFILE\scoop\apps"
Start-Process -FilePath "$ScoopAppsPath\glazewm\current\GlazeWM.exe"
Start-Process -FilePath "$ScoopAppsPath\everything\current\Everything.exe" -ArgumentList "-startup"
# komorebic start -c $env:USERPROFILE\.config\komorebi\komorebi.json
