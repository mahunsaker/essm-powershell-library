#requires -Version 7.0
# Beginner: inspect your runtime without making changes.
[pscustomobject]@{
    HostName       = [Environment]::MachineName
    UserName       = [Environment]::UserName
    PSVersion      = $PSVersionTable.PSVersion.ToString()
    Platform       = $PSVersionTable.Platform
    Home           = $HOME
    CurrentFolder  = (Get-Location).Path
} | Format-List
Get-Command Get-Process | Select-Object Name, CommandType, Source
