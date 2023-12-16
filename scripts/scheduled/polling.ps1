$LocalPath = "$env:USERPROFILE/Sync"
$RemotePath = "gdrive:/Sync"
$FilterFilePath = "$env:USERPROFILE/Sync/.rclone_filter.txt"

# Simple command to check connection
$TitleMsg = "Autosync to remote path: `"$RemotePath`""
$DescriptionMsg = "Checking connection for local path `"$LocalPath`""
Write-Output "$TitleMsg`n$DescriptionMsg`n"
rclone tree "gdrive:Sync" --level 1 -d | out-null

if($?)
{
    $DescriptionMsg = "Connection exists. Syncing local path `"$LocalPath`""
    Write-Output "$DescriptionMsg`n"

    # Sync
    rclone bisync $LocalPath $RemotePath --filters-file $FilterFilePath --verbose --drive-acknowledge-abuse --check-access --check-filename ".rclone_check_access.txt"
}

if(!$?)
{
    $DescriptionMsg = "Syncing failed for local path `"$LocalPath`".`nResyncing."
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
    rclone bisync $LocalPath $RemotePath --filters-file $FilterFilePath --verbose --drive-acknowledge-abuse --resync

    if(!$?)
    {
        $DescriptionMsg = "Resyncing failed for local path `"$LocalPath`"`" even though connection was okay."
        Write-Output "$DescriptionMsg`n"

        # Resync failed notification
        $balmsg.BalloonTipIcon = [System.Windows.Forms.ToolTipIcon]::Error
        $balmsg.BalloonTipTitle = $TitleMsg
        $balmsg.BalloonTipText = $DescriptionMsg
        $balmsg.Visible = $true
        $balmsg.ShowBalloonTip(20000)
    }
}