function Test-ESSMTcpEndpoint {
<#
.SYNOPSIS
 Checks TCP connectivity with a configurable timeout; does not alter the target.
.EXAMPLE
 Test-ESSMTcpEndpoint -ComputerName localhost -Port 443 -TimeoutMs 1500
#>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)][ValidateNotNullOrEmpty()][string]$ComputerName,
        [Parameter(Mandatory)][ValidateRange(1,65535)][int]$Port,
        [ValidateRange(100,30000)][int]$TimeoutMs = 2000
    )
    $client = [System.Net.Sockets.TcpClient]::new()
    $connected = $false
    $detail = ''
    $async = $null
    try {
        $async = $client.BeginConnect($ComputerName, $Port, $null, $null)
        if ($async.AsyncWaitHandle.WaitOne($TimeoutMs)) {
            $client.EndConnect($async)
            $connected = $client.Connected
        } else {
            $detail = 'Timed out'
        }
    } catch {
        $detail = $_.Exception.Message
    } finally {
        if ($null -ne $async) { $async.AsyncWaitHandle.Close() }
        $client.Dispose()
    }
    [pscustomobject]@{
        ComputerName = $ComputerName
        Port = $Port
        Connected = $connected
        Detail = $detail
        CheckedAt = Get-Date
    }
}
