#requires -Version 7.0
[CmdletBinding()]
param([Parameter(Mandatory)][string]$Path)
if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) { throw 'File not found' }
Get-FileHash -LiteralPath $Path -Algorithm SHA256 |
    Select-Object Algorithm, Hash, Path
