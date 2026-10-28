#requires -Version 7.0
[CmdletBinding()]
param(
    [Parameter(Mandatory)] [string]$Path,
    [string]$OutputCsv = (Join-Path $PWD 'file-inventory.csv')
)
if (-not (Test-Path -LiteralPath $Path -PathType Container)) {
    throw "Folder does not exist: $Path"
}
$inventory = Get-ChildItem -LiteralPath $Path -File -Recurse -ErrorAction Stop |
    Select-Object FullName, Length, LastWriteTime, Extension
$inventory | Export-Csv -LiteralPath $OutputCsv -NoTypeInformation
Write-Output "Saved $(@($inventory).Count) items to $OutputCsv"
