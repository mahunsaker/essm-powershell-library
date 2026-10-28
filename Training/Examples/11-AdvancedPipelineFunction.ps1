#requires -Version 7.0
function ConvertTo-NormalizedHost {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string]$Name
    )
    process {
        [pscustomobject]@{
            Original = $Name
            Normalized = $Name.Trim().ToLowerInvariant()
        }
    }
}
' DC01 ', ' PVE01 ', 'LOCALHOST' | ConvertTo-NormalizedHost
