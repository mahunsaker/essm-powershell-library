#requires -Version 7.0
[CmdletBinding()]
param([string]$CsvPath = (Join-Path $PSScriptRoot '../Config/hosts.csv'))
$hosts=Import-Csv -LiteralPath $CsvPath
foreach ($item in $hosts) {
    $resolved = $false
    try { $null=[System.Net.Dns]::GetHostAddresses($item.Address); $resolved=$true }
    catch { $resolved=$false }
    [pscustomobject]@{
        Name=$item.Name; Address=$item.Address; Group=$item.Group; DnsResolved=$resolved
    }
}
