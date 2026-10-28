#requires -Version 7.0
[CmdletBinding()]
param([string]$Name = '*')
if (-not $IsWindows) { throw 'Windows-only example: Get-Service may differ elsewhere.' }
Get-Service -Name $Name | Sort-Object Status, Name |
    Select-Object Name, DisplayName, Status, StartType
