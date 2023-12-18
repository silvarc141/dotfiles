$programs = @{
    "$Env:USERPROFILE\AppData\Local\VencordDesktop\Vesktop.exe"              = @()
    "$Env:USERPROFILE\scoop\apps\armcord\current\armcord.exe"              = @()
    "$Env:USERPROFILE\scoop\apps\obsidian\current\obsidian.exe"              = @()
    "$Env:USERPROFILE\AppData\Local\Programs\SparkDesktop\Spark Desktop.exe" = @()
    "$Env:USERPROFILE\AppData\Local\Programs\beeper\Beeper.exe"              = @()
    "$Env:USERPROFILE\scoop\apps\rider\current\IDE\bin\rider64.exe"          = @("$Env:USERPROFILE\Projects\Unity\Constructors\constructors.sln")
    "C:\Program Files\Unity Hub\Unity Hub.exe"                               = @()
    "C:\Program Files\Unity\Hub\Editor\2021.3.14f1\Editor\Unity.exe"         = @("-projectPath", "$Env:USERPROFILE\Projects\Unity\Constructors\")
    "C:\Program Files\PlasticSCM5\client\plastic.exe"                        = @()
}

foreach ($program in $programs.Keys) {
    $running = Get-Process | Where-Object { $_.Path -eq $program }

    # Check if program exists and is not currently running
    if ((Test-Path $program -PathType Leaf) -and ($null -eq $running)) {
        $arguments = if ($programs[$program] -and ($programs[$program].Count -gt 0)) { $programs[$program] }

        if ($arguments) {
            Start-Process -FilePath $program -ArgumentList $arguments
        }
        else {
            Start-Process -FilePath $program
        }
    }
}

Get-Process "Unity Hub" | %{ $_.CloseMainWindow() }
