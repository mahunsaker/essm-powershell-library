#requires -Version 7.0
# Cross-platform file-system drive report; free/used vary by provider.
Get-PSDrive -PSProvider FileSystem |
    Where-Object { $_.Used -ne $null -and $_.Free -ne $null } |
    ForEach-Object {
        $total = $_.Used + $_.Free
        [pscustomobject]@{
            Drive = $_.Name
            Root = $_.Root
            FreeGB = [math]::Round($_.Free / 1GB, 2)
            UsedPercent = if ($total -gt 0) { [math]::Round(100 * $_.Used / $total, 1) } else { 0 }
        }
    } | Sort-Object UsedPercent -Descending
