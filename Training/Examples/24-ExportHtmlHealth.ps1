#requires -Version 7.0
[CmdletBinding()]
param([string]$OutputPath = (Join-Path $PWD 'health-report.html'))
$rows = Get-PSDrive -PSProvider FileSystem | ForEach-Object {
    [pscustomobject]@{ Drive=$_.Name; FreeGB=[math]::Round($_.Free/1GB,1); Time=Get-Date }
}
$pre = '<h1>Read-only system report</h1><p>Generated locally by PowerShell.</p>'
$rows | ConvertTo-Html -Title 'Local Health Report' -PreContent $pre |
    Set-Content -LiteralPath $OutputPath -Encoding utf8
Write-Output $OutputPath
