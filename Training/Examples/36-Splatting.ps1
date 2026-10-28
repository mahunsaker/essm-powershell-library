#requires -Version 7.0
# Splatting packages named parameters into a hashtable.
$params = @{
    LiteralPath = $PSScriptRoot
    File = $true
    ErrorAction = 'Stop'
}
Get-ChildItem @params | Select-Object -First 5 Name, Length
