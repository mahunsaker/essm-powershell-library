#requires -Version 7.0
[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [ValidateNotNullOrEmpty()]
    [string]$ComputerName,
    [ValidateRange(1, 20)]
    [int]$Repeat = 3
)
1..$Repeat | ForEach-Object {
    [pscustomobject]@{ Computer = $ComputerName; Count = $_; Time = Get-Date }
}
