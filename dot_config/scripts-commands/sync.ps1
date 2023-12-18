# Custom file sync solution using rclone (file filtering support)

if($null -eq $env:SYNCPATHLOCAL) {$env:SYNCPATHLOCAL = "$env:USERPROFILE\sync"}
if($null -eq $env:SYNCPATHREMOTE) {$env:SYNCPATHREMOTE = "gdrive:sync"}
if($null -eq $env:SYNCPATHFILTER) {$env:SYNCPATHFILTER = "$env:USERPROFILE\sync\.rclone_filter.txt"}

if(-not (Test-Path $env:SYNCPATHLOCAL -PathType Container))
{
    New-Item -ItemType Directory -Force $env:SYNCPATHLOCAL
}

# Simple command to check connection
$TitleMsg = "Autosync to remote path: `"$env:SYNCPATHREMOTE`""
$DescriptionMsg = "Checking connection for local path `"$env:SYNCPATHLOCAL`""
Write-Output "$TitleMsg`n$DescriptionMsg`n"
rclone tree "gdrive:sync" --level 1 -d | out-null

if($?)
{
    $DescriptionMsg = "Connection exists. Syncing local path `"$env:SYNCPATHLOCAL`""
    Write-Output "$DescriptionMsg`n"

    # Sync
    rclone bisync $env:SYNCPATHLOCAL $env:SYNCPATHREMOTE --filters-file $env:SYNCPATHFILTER --verbose --drive-acknowledge-abuse --check-access --check-filename ".rclone_check_access.txt"
}

if(!$?)
{
    $DescriptionMsg = "Syncing failed for local path `"$env:SYNCPATHLOCAL`".`nResyncing."
    Write-Output "$DescriptionMsg`n"

    # Sync failed notification
    Add-Type -AssemblyName System.Windows.Forms
    $global:balmsg = New-Object System.Windows.Forms.NotifyIcon
    $path = (Get-Process -id $pid).Path
    $balmsg.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon($path)
    $balmsg.BalloonTipIcon = [System.Windows.Forms.ToolTipIcon]::Warning
    $balmsg.BalloonTipTitle = $TitleMsg
    $balmsg.BalloonTipText = $DescriptionMsg
    $balmsg.Visible = $true
    $balmsg.ShowBalloonTip(20000)

    # Resync
    rclone bisync $env:SYNCPATHLOCAL $env:SYNCPATHREMOTE --filters-file $env:SYNCPATHFILTER --verbose --drive-acknowledge-abuse --resync

    if(!$?)
    {
        $DescriptionMsg = "Resyncing failed for local path `"$env:SYNCPATHLOCAL`"`" even though connection was okay."
        Write-Output "$DescriptionMsg`n"

        # Resync failed notification
        $balmsg.BalloonTipIcon = [System.Windows.Forms.ToolTipIcon]::Error
        $balmsg.BalloonTipTitle = $TitleMsg
        $balmsg.BalloonTipText = $DescriptionMsg
        $balmsg.Visible = $true
        $balmsg.ShowBalloonTip(20000)
    }
}