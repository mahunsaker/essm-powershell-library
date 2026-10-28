function Get-ESSMFileInventory {
<#
.SYNOPSIS
 Produces a read-only local file inventory, optionally including SHA-256 checksums.
.EXAMPLE
 Get-ESSMFileInventory -Path . -IncludeHash | Export-Csv ./my-files.csv -NoTypeInformation
#>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)][ValidateScript({Test-Path -LiteralPath $_ -PathType Container})][string]$Path,
        [switch]$IncludeHash
    )
    Get-ChildItem -LiteralPath $Path -File -Recurse -ErrorAction Stop | ForEach-Object {
        $hash = if ($IncludeHash) { (Get-FileHash -LiteralPath $_.FullName -Algorithm SHA256).Hash } else { $null }
        [pscustomobject]@{ Path=$_.FullName; Size=$_.Length; Modified=$_.LastWriteTime; SHA256=$hash }
    }
}
