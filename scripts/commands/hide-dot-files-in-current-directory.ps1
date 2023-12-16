# Define the folder path as a parameter
param([string]$folderPath = ".")

# Get all the files and folders starting with a dot in the folder
$dotItems = Get-ChildItem -Path $folderPath -Filter ".*" -Force

# Loop through each item and set its hidden attribute
foreach ($item in $dotItems) {
    # Check if the item is not already hidden
    if (-not ($item.Attributes -band [System.IO.FileAttributes]::Hidden)) {
        # Set the hidden attribute
        $item.Attributes = $item.Attributes -bor [System.IO.FileAttributes]::Hidden
        # Write a message to the console
        Write-Host "Hiding $($item.FullName)"
    }
}
