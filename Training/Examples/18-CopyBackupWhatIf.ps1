#requires -Version 7.0
[CmdletBinding(SupportsShouldProcess, ConfirmImpact='Medium')]
param(
    [Parameter(Mandatory)][string]$Source,
    [Parameter(Mandatory)][string]$Destination
)
if (-not (Test-Path -LiteralPath $Source -PathType Container)) { throw "Source missing: $Source" }
if (Test-Path -LiteralPath $Destination) { throw "Destination already exists: $Destination" }
if ($PSCmdlet.ShouldProcess($Destination, "Copy folder $Source")) {
    Copy-Item -LiteralPath $Source -Destination $Destination -Recurse -ErrorAction Stop
    Write-Output "Copy complete: $Destination"
}
# First run: ./18-CopyBackupWhatIf.ps1 -Source ./Data -Destination ./Backup -WhatIf
