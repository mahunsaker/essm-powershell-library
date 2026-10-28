#requires -Version 7.0
function Write-StructuredLog {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)][string]$Message,
        [ValidateSet('INFO','WARN','ERROR')][string]$Level = 'INFO',
        [Parameter(Mandatory)][string]$Path
    )
    $folder = Split-Path -Path $Path -Parent
    if ($folder -and -not (Test-Path -LiteralPath $folder)) {
        New-Item -ItemType Directory -Path $folder -Force | Out-Null
    }
    [pscustomobject]@{
        Timestamp=(Get-Date).ToString('o'); Level=$Level; Message=$Message
    } | ConvertTo-Json -Compress | Add-Content -LiteralPath $Path
}
Write-StructuredLog -Message 'Sample health check complete' -Path (Join-Path $PSScriptRoot '../course-demo.jsonl')
