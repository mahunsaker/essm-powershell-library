#requires -Version 7.0
[int]$threshold = 80
[string]$device = [Environment]::MachineName
[datetime]$captured = Get-Date
$sample = [pscustomobject]@{
    Computer = $device
    Threshold = $threshold
    CapturedAt = $captured
    Enabled = $true
}
$sample | Select-Object Computer, Threshold, Enabled, CapturedAt
