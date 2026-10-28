#requires -Version 7.0
[CmdletBinding()]
param([int]$Hours = 24, [int]$MaxEvents = 20)
if (-not $IsWindows) { throw 'Windows-only example.' }
$start = (Get-Date).AddHours(-[math]::Abs($Hours))
Get-WinEvent -FilterHashtable @{LogName='System'; Level=2; StartTime=$start} -MaxEvents $MaxEvents -ErrorAction Stop |
    Select-Object TimeCreated, ProviderName, Id, Message
