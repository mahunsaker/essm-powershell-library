#requires -Version 7.0
[CmdletBinding()]
param([int]$Top = 10, [string]$OutFile)
$report = @(Get-Process | Sort-Object CPU -Descending |
    Select-Object -First $Top Name, Id, CPU, WorkingSet64)
if ($OutFile) { $report | Export-Csv -LiteralPath $OutFile -NoTypeInformation }
$report
