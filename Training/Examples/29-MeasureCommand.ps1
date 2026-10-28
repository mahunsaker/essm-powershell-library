#requires -Version 7.0
$measure = Measure-Command { $null = Get-Process | Select-Object -First 20 }
[pscustomobject]@{
    Milliseconds=[math]::Round($measure.TotalMilliseconds,2)
    Script='Get-Process | Select -First 20'
} | Format-Table
