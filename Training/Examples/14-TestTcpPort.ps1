#requires -Version 7.0
[CmdletBinding()]
param(
    [Parameter(Mandatory)][string]$ComputerName,
    [Parameter(Mandatory)][ValidateRange(1,65535)][int]$Port,
    [ValidateRange(100,15000)][int]$TimeoutMs = 1500
)
$client = [System.Net.Sockets.TcpClient]::new()
try {
    $task = $client.ConnectAsync($ComputerName, $Port)
    $completed = $task.Wait($TimeoutMs)
    $open = $completed -and $client.Connected
    [pscustomobject]@{ Target=$ComputerName; Port=$Port; Open=$open; CheckedAt=Get-Date }
}
catch {
    [pscustomobject]@{ Target=$ComputerName; Port=$Port; Open=$false; CheckedAt=Get-Date }
}
finally { $client.Dispose() }
