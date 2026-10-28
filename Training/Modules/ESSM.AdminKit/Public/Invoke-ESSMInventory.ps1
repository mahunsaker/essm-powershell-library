function Invoke-ESSMInventory {
    [CmdletBinding()]
    param([Parameter(ValueFromPipeline,Mandatory)][string]$Name)
    process { Get-ESSMHostSummary -Name $Name }
}
