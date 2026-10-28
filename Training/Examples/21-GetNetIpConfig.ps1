#requires -Version 7.0
if (-not $IsWindows) { throw 'Windows-only example.' }
Get-NetIPConfiguration |
    Select-Object InterfaceAlias, IPv4Address, IPv4DefaultGateway, DNSServer |
    Format-List
