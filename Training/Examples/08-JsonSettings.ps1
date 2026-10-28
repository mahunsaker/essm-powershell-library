#requires -Version 7.0
[CmdletBinding()]
param([string]$SettingsPath = (Join-Path $PSScriptRoot '../Config/settings.json'))
$settings = Get-Content -LiteralPath $SettingsPath -Raw | ConvertFrom-Json
[pscustomobject]@{
    ReportFolder = $settings.ReportFolder
    WarningPercent = $settings.WarningPercent
    IncludeProcesses = $settings.IncludeProcesses
} | Format-List
