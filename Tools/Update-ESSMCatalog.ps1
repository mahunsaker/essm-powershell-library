#requires -Version 7.0
[CmdletBinding()]
param()
$ErrorActionPreference='Stop'
$root=(Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$csv=Join-Path $root 'Catalog/assets.csv'
$rows=Import-Csv -LiteralPath $csv
foreach ($row in $rows) {
    $file=Join-Path $root $row.Path
    if(-not (Test-Path -LiteralPath $file -PathType Leaf)) {throw "Missing catalog file: $($row.Path)"}
    $row.SHA256 = (Get-FileHash -LiteralPath $file -Algorithm SHA256).Hash
}
$rows | Export-Csv -LiteralPath $csv -NoTypeInformation -Encoding utf8
Write-Output "Updated SHA-256 metadata for $($rows.Count) asset(s). Rebuild the HTML browser if you change catalog entries."
