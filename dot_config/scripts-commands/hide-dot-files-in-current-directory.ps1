param([string]$folderPath = ".")
$dotItems = Get-ChildItem -Path $folderPath -Filter ".*" -Force

foreach ($item in $dotItems) {
    if (-not ($item.Attributes -band [System.IO.FileAttributes]::Hidden)) {
        $item.Attributes = $item.Attributes -bor [System.IO.FileAttributes]::Hidden
        Write-Host "Hiding $($item.FullName)"
    }
}
