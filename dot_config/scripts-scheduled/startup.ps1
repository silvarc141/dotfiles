Start-Process -FilePath "$env:USERPROFILE\.config\autohotkey\de-elevated-run-init.ahk"
Start-Job { Start-Process -FilePath "$env:PROGRAMFILES\1Password\app\8\1Password.exe" -ArgumentList "--silent" }

$ScoopAppsPath = "$env:USERPROFILE\scoop\apps"
Start-Process -FilePath "$ScoopAppsPath\micaforeveryone\current\MicaForEveryone.exe"
Start-Process -FilePath "$ScoopAppsPath\sharex\current\ShareX.exe" -ArgumentList "-silent"
Start-Process -FilePath "$ScoopAppsPath\keypirinha\current\keypirinha.exe"
#Start-Process -FilePath "$ScoopAppsPath\fluent-search\current\FluentSearch.exe"
#Start-Process -FilePath "$ScoopAppsPath\roundedtb\current\RoundedTB.exe"
#Start-Process -FilePath "$ScoopAppsPath\translucenttb\current\TranslucentTB.exe"
#Start-Process -FilePath "$ScoopAppsPath\eartrumpet\current\EarTrumpet.exe"

. $env:USERPROFILE\.config\scripts-commands\hide-files-matching.ps1 "_*" $env:USERPROFILE
. $env:USERPROFILE\.config\scripts-commands\hide-files-matching.ps1 ".*" $env:USERPROFILE
