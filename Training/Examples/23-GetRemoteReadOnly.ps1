#requires -Version 7.0
[CmdletBinding()]
param([Parameter(Mandatory)][string]$ComputerName)
if (-not $IsWindows) { throw 'This example uses WinRM from Windows.' }
# Requires authorized WinRM endpoint and connectivity; no server settings changed.
try {
    Test-WSMan -ComputerName $ComputerName -ErrorAction Stop | Out-Null
    Invoke-Command -ComputerName $ComputerName -ErrorAction Stop -ScriptBlock {
        [pscustomobject]@{
            Computer=$env:COMPUTERNAME
            PSVersion=$PSVersionTable.PSVersion.ToString()
            Time=Get-Date
        }
    }
}
catch { Write-Error "Remote query failed: $($_.Exception.Message)" }
