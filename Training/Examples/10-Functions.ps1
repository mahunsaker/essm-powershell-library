#requires -Version 7.0
function Get-Greeting {
    [CmdletBinding()]
    param([Parameter(Mandatory)][string]$Name)
    [pscustomobject]@{
        Message = "Welcome, $Name"
        At = Get-Date
    }
}
Get-Greeting -Name 'PowerShell Learner'
