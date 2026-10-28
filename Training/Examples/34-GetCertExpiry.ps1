#requires -Version 7.0
[CmdletBinding()]
param([ValidateRange(1,365)][int]$WithinDays = 45)
if (-not $IsWindows) { throw 'Cert:\ store is only supported in this sample on Windows.' }
$cutoff=(Get-Date).AddDays($WithinDays)
Get-ChildItem -Path Cert:\LocalMachine\My -ErrorAction Stop |
    Where-Object { $_.NotAfter -le $cutoff } |
    Select-Object Subject, Thumbprint, NotAfter
