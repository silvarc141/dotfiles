. $env:USERPROFILE\.config\scripts-commands\hide-dot-files-in-directory.ps1 $env:USERPROFILE

Start-Process -FilePath "$env:USERPROFILE\scripts\hotkeys\de-elevated-run-init.ahk"

$ScoopAppsPath = "$env:USERPROFILE\scoop\apps"
Start-Process -FilePath "$ScoopAppsPath\micaforeveryone\current\MicaForEveryone.exe"
Start-Process -FilePath "$ScoopAppsPath\everything\current\Everything.exe" -ArgumentList "-startup"
Start-Process -FilePath "$ScoopAppsPath\sharex\current\ShareX.exe"
Start-Process -FilePath "$ScoopAppsPath\fluent-search\current\FluentSearch.exe"
#Start-Process -FilePath "$ScoopAppsPath\roundedtb\current\RoundedTB.exe"
#Start-Process -FilePath "$ScoopAppsPath\translucenttb\current\TranslucentTB.exe"
#Start-Process -FilePath "$ScoopAppsPath\eartrumpet\current\EarTrumpet.exe"