#requires -Version 7.0
function Get-LargeFiles {
    [CmdletBinding()]
    param([Parameter(Mandatory)][string]$Path, [long]$MinBytes = 1MB)
    Get-ChildItem -LiteralPath $Path -File -Recurse |
        Where-Object Length -ge $MinBytes |
        Select-Object FullName, Length, LastWriteTime
}
function ConvertTo-SizeReport {
    [CmdletBinding()]
    param([Parameter(ValueFromPipeline)]$InputObject)
    process {
        [pscustomobject]@{
            Path=$InputObject.FullName
            MiB=[math]::Round($InputObject.Length / 1MB,2)
            Modified=$InputObject.LastWriteTime
        }
    }
}
Get-LargeFiles -Path $PSScriptRoot -MinBytes 0 | ConvertTo-SizeReport
