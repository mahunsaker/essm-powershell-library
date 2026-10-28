#requires -Version 7.0
[CmdletBinding()]
param([string]$OutputFolder = (Join-Path $PSScriptRoot '../Reports'))
if (-not (Test-Path -LiteralPath $OutputFolder)) {
    New-Item -ItemType Directory -Path $OutputFolder -Force | Out-Null
}
$stamp=(Get-Date).ToString('yyyyMMdd-HHmmss')
$modulePath=Join-Path $PSScriptRoot '../Modules/ESSM.AdminKit/ESSM.AdminKit.psm1'
Import-Module (Resolve-Path -LiteralPath $modulePath).Path -Force
$rows=@(Get-ESSMHostSummary -Name ([Environment]::MachineName))
$out=Join-Path $OutputFolder "health-$stamp.csv"
$rows | Export-Csv -LiteralPath $out -NoTypeInformation
Write-Output "Wrote $out"
