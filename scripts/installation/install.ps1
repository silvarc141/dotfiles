# Self-elevate the script if required
if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
    if ([int](Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty BuildNumber) -ge 6000) {
        $CommandLine = "-File `"" + $MyInvocation.MyCommand.Path + "`" " + $MyInvocation.UnboundArguments
        Start-Process -FilePath PowerShell.exe -Verb Runas -ArgumentList $CommandLine
        Exit
    }
}

Write-Host "Installing package providers..." -ForegroundColor "Yellow"
winget upgrade winget --silent --accept-package-agreements

Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
"$(Invoke-RestMethod get.scoop.sh) -RunAsAdmin" | Invoke-Expression
scoop bucket add extras
scoop bucket add nerd-fonts
scoop bucket add sysinternals
# scoop bucket add DEV-tools https://github.com/anderlli0053/DEV-tools.git

Write-Host "Installing installation dependencies..." -ForegroundColor "Yellow"
scoop install main/aria2
scoop install main/git
scoop install main/chezmoi

Write-Host "Installing dotfiles..." -ForegroundColor "Yellow"
chezmoi init --apply https://github.com/silvarc141/dotfiles.git

$scriptsDir = "$env:USERPROFILE\scripts\installation"
& $scriptsDir/setup-windows.ps1
& $scriptsDir/schedule-tasks.ps1
& $scriptsDir/install-packages.ps1
