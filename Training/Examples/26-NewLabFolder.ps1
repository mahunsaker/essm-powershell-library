#requires -Version 7.0
[CmdletBinding(SupportsShouldProcess)]
param([Parameter(Mandatory)][string]$Path)
if (-not (Test-Path -LiteralPath $Path)) {
    if ($PSCmdlet.ShouldProcess($Path, 'Create course lab directory')) {
        New-Item -ItemType Directory -Path $Path -ErrorAction Stop | Out-Null
        Write-Output "Created $Path"
    }
}
else { Write-Output "Exists: $Path" }
