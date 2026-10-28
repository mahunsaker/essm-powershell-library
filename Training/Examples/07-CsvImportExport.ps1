#requires -Version 7.0
[CmdletBinding()]
param([string]$CsvPath = (Join-Path $PSScriptRoot '../Config/hosts.csv'))
if (-not (Test-Path -LiteralPath $CsvPath)) { throw "Missing $CsvPath" }
Import-Csv -LiteralPath $CsvPath | ForEach-Object {
    [pscustomobject]@{
        Name = $_.Name
        Address = $_.Address
        Group = $_.Group
        Target = "{0} ({1})" -f $_.Name, $_.Address
    }
} | Format-Table -AutoSize
