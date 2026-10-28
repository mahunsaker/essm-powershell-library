#requires -Version 7.0
[CmdletBinding()]
param(
    [Parameter(Mandatory)][string]$Path,
    [string]$Pattern = 'ERROR|WARN',
    [int]$Last = 1000
)
if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) { throw "Missing log: $Path" }
Get-Content -LiteralPath $Path -Tail $Last | Select-String -Pattern $Pattern |
    ForEach-Object { [pscustomobject]@{ Line=$_.Line; LineNumber=$_.LineNumber } }
