function Invoke-ESSMHealthReport {
<#
.SYNOPSIS
 Composes local inventory and optional endpoint test into one PowerShell object.
.EXAMPLE
 Invoke-ESSMHealthReport -ComputerName localhost -Port 22
#>
    [CmdletBinding()]
    param([string]$ComputerName = 'localhost', [ValidateRange(1,65535)][int]$Port = 443)
    $local = Get-ESSMSystemSnapshot
    $tcp = Test-ESSMTcpEndpoint -ComputerName $ComputerName -Port $Port
    [pscustomobject]@{
        LocalSystem = $local
        TcpCheck = $tcp
        CheckedAt = Get-Date
    }
}
