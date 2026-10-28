#requires -Version 7.0
[CmdletBinding()]
param(
    [Parameter(Mandatory)][string]$Path,
    [ValidateRange(1,3650)][int]$OlderThanDays = 30
)
if (-not (Test-Path -LiteralPath $Path -PathType Container)) { throw 'Invalid folder' }
$cutoff=(Get-Date).AddDays(-$OlderThanDays)
Get-ChildItem -LiteralPath $Path -File -Recurse |
    Where-Object LastWriteTime -lt $cutoff |
    Select-Object FullName, Length, LastWriteTime
# Intentionally preview-only: NO deletion occurs.
