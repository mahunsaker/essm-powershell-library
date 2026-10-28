function Find-ESSMAsset {
<#
.SYNOPSIS
 Searches local metadata for existing reusable assets.
.DESCRIPTION
 This is purely local; never accesses GitHub or executes found assets.
.EXAMPLE
 Find-ESSMAsset -Name 'network' -Kind Script
#>
    [CmdletBinding()]
    param(
        [string]$Name = '*',
        [ValidateSet('All','Script','Function','Module','Tool','Documentation','Template','Test')]
        [string]$Kind = 'All',
        [string]$Category,
        [string]$Status
    )
    $root = (Resolve-Path (Join-Path $PSScriptRoot '../../..')).Path
    $csvPath = Join-Path $root 'Catalog/assets.csv'
    if (-not (Test-Path -LiteralPath $csvPath)) { throw "Catalog missing: $csvPath" }
    Import-Csv -LiteralPath $csvPath | Where-Object {
        ($_.Name -like "*$($Name.Trim('*'))*" -or $_.Description -like "*$($Name.Trim('*'))*" -or $_.Tags -like "*$($Name.Trim('*'))*") -and
        ($Kind -eq 'All' -or $_.Kind -eq $Kind) -and
        (-not $Category -or $_.Category -eq $Category) -and
        (-not $Status -or $_.Status -eq $Status)
    } | Sort-Object Kind, Name | Select-Object Kind, Name, Category, Status, Path, Description
}
