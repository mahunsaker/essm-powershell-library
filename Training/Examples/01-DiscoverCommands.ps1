#requires -Version 7.0
# Discover a command and its available parameters.
Get-Command -Verb Get | Select-Object -First 10 Name, Source
Get-Help Get-ChildItem -Examples
Get-Command Get-ChildItem -Syntax
Get-Member -InputObject (Get-Date)
