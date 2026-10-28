#requires -Version 7.0
[CmdletBinding()]
param([Parameter(Mandatory)] [string]$Path)
try {
    $items = @(Get-ChildItem -LiteralPath $Path -ErrorAction Stop)
    [pscustomobject]@{ Path=$Path; Count=$items.Count; Status='OK' }
}
catch {
    Write-Warning ("Scan failed for '{0}': {1}" -f $Path, $_.Exception.Message)
    [pscustomobject]@{ Path=$Path; Count=0; Status='Failed' }
}
finally {
    Write-Verbose 'Scan attempt completed.'
}
