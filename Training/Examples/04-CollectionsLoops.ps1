#requires -Version 7.0
$hosts = @('localhost', '127.0.0.1')
$results = foreach ($hostName in $hosts) {
    [pscustomobject]@{
        Target = $hostName
        IsLocal = $hostName -in @('localhost', '127.0.0.1')
    }
}
$results | Format-Table -AutoSize
