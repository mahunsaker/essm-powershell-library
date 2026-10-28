function Get-ESSMSystemSnapshot {
<#
.SYNOPSIS
 Returns a local-only, read-only system inventory object.
.EXAMPLE
 Get-ESSMSystemSnapshot | Format-List
#>
    [CmdletBinding()]
    param()
    [pscustomobject]@{
        ComputerName   = [System.Environment]::MachineName
        PowerShell     = $PSVersionTable.PSVersion.ToString()
        Platform       = $PSVersionTable.Platform
        ProcessCount   = @(Get-Process).Count
        CollectedAt    = Get-Date
    }
}
