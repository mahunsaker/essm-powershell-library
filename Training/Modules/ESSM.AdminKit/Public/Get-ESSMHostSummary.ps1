function Get-ESSMHostSummary {
    [CmdletBinding()]
    param([Parameter(Mandatory)][string]$Name)
    # Composition: private helper + host data => one object.
    $platform = Get-ESSMPlatform
    [pscustomobject]@{
        Name = $Name
        OS = $platform.OS
        PowerShell = $platform.PowerShell
        CheckedAt = Get-Date
        ProcessCount = @(Get-Process).Count
    }
}
