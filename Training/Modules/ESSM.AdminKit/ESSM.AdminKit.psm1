# Local-only sample module; no cloud downloads.
$private = Join-Path $PSScriptRoot 'Private'
$public = Join-Path $PSScriptRoot 'Public'
Get-ChildItem -Path $private -Filter '*.ps1' | ForEach-Object { . $_.FullName }
Get-ChildItem -Path $public -Filter '*.ps1' | ForEach-Object { . $_.FullName }
Export-ModuleMember -Function 'Get-ESSMHostSummary','Invoke-ESSMInventory'
