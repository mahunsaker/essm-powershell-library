#requires -Version 7.0
[CmdletBinding()]
param([string]$OutputPath = (Join-Path $PWD 'history.jsonl'))
$row = [pscustomobject]@{
    At=(Get-Date).ToString('o')
    Computer=[Environment]::MachineName
    ProcessCount=@(Get-Process).Count
    PSVersion=$PSVersionTable.PSVersion.ToString()
}
$row | ConvertTo-Json -Compress | Add-Content -LiteralPath $OutputPath
Write-Output "Appended record to $OutputPath"
