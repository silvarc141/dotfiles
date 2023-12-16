$prompt = ""
function invoke-starship-precommand {
    $current_location = $executioncontext.sessionstate.path.currentlocation
    if ($current_location.provider.name -eq "filesystem") {
        $ansi_escape = [char]27
        $provider_path = $current_location.providerpath -replace "\\", "/"
        $prompt = "$ansi_escape]7;file://${env:computername}/${provider_path}$ansi_escape\"
    }
    $host.ui.write($prompt)
}

function Invoke-Starship-TransientFunction {
    &starship module character
}

Invoke-Expression (&starship init powershell)
#Enable-TransientPrompt

# oh-my-posh --init --shell pwsh --config C:\| Invoke-Expression
# oh-my-posh --init --shell pwsh | Invoke-Expression

#TODO find a better way to pass arguments (maybe Invoke-Expression)
function Dotfiles-Bare-Git{
    & $env:USERPROFILE\scoop\apps\git\current\cmd\git.exe --git-dir=$env:USERPROFILE\.cfg\ --work-tree=$env:USERPROFILE $Args[0] $Args[1] $Args[2] $Args[3] $Args[4] $Args[5]
}

Set-Alias -Name config -Value Dotfiles-Bare-Git
