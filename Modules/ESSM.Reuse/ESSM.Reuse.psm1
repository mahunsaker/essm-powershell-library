# Public sample module; all dependencies are local built-in PowerShell/.NET.
foreach ($item in @(Get-ChildItem -LiteralPath (Join-Path $PSScriptRoot 'Public') -Filter '*.ps1' -File)) {
    . $item.FullName
}
Export-ModuleMember -Function @('Find-ESSMAsset','Get-ESSMSystemSnapshot','Test-ESSMTcpEndpoint','Get-ESSMFileInventory','Invoke-ESSMHealthReport')
