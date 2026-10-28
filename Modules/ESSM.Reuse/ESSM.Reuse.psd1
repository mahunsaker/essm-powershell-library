@{
    RootModule = 'ESSM.Reuse.psm1'
    ModuleVersion = '1.0.0'
    GUID = '3e7d3e94-5e07-4252-96d9-36e4cb4f7861'
    Author = 'ESSM Reuse Library'
    CompanyName = 'Personal lab / public sample'
    Copyright = '(c) 2026 ESSM Reuse Library'
    Description = 'Offline-first, read-only inventory, discovery, and composable health utilities.'
    PowerShellVersion = '7.0'
    FunctionsToExport = @('Find-ESSMAsset','Get-ESSMSystemSnapshot','Test-ESSMTcpEndpoint','Get-ESSMFileInventory','Invoke-ESSMHealthReport')
    CmdletsToExport = @()
    AliasesToExport = @()
}
