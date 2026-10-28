function Get-ESSMPlatform {
    [CmdletBinding()]
    param()
    [pscustomobject]@{
        OS = if ($IsWindows) { 'Windows' } elseif ($IsLinux) { 'Linux' } elseif ($IsMacOS) { 'macOS' } else { 'Other' }
        PowerShell = $PSVersionTable.PSVersion.ToString()
    }
}
