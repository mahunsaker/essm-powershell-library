#requires -Version 7.0
# This prints a command; it does NOT register or install a scheduled task.
$script = (Join-Path $PSScriptRoot '27-IncrementalJsonReport.ps1')
$quoted = '"' + $script + '"'
Write-Output "Windows Task Scheduler program: pwsh.exe"
Write-Output "Windows Task Scheduler arguments: -NoProfile -NonInteractive -File $quoted"
Write-Output 'Linux cron example: /usr/bin/pwsh -NoProfile -File /absolute/path/to/script.ps1'
