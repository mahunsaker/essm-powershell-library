#requires -Version 7.0
[CmdletBinding()]
param([Parameter(Mandatory)][string]$Name)
try {
    [System.Net.Dns]::GetHostAddresses($Name) | ForEach-Object {
        [pscustomobject]@{ HostName=$Name; Address=$_.IPAddressToString; Family=$_.AddressFamily.ToString() }
    }
}
catch { Write-Error "DNS lookup failed for $Name : $($_.Exception.Message)" }
