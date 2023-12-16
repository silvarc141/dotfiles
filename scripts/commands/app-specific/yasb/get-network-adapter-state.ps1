$adapters = Get-NetAdapter | Where-Object { $_.Name -like "*Ethernet*" }

foreach ($adapter in $adapters) {
    if ($adapter.Status -ne 'Up') {
        return ":Off"
    }
    else {
        return ": On"
    }
}