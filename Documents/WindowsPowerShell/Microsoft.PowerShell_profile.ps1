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

# oh-my-posh --init --shell pwsh --config C:\| Invoke-Expression
# oh-my-posh --init --shell pwsh | Invoke-Expression

$env:PATH += ";C:\Program Files\Git\bin"
