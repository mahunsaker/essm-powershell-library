#requires -Version 7.0
[CmdletBinding()]
param([Parameter(Mandatory)][string]$ComputerName)
if (-not $IsWindows) { throw 'Run this CIM/WSMan example on Windows.' }
# Read-only. Requires authorized access and configured WSMan connectivity.
$session = $null
try {
    $session = New-CimSession -ComputerName $ComputerName -ErrorAction Stop
    Get-CimInstance -ClassName Win32_OperatingSystem -CimSession $session -ErrorAction Stop |
        Select-Object PSComputerName, Caption, Version, LastBootUpTime
}
catch { Write-Error "CIM inventory failed: $($_.Exception.Message)" }
finally { if ($session) { $session | Remove-CimSession } }
