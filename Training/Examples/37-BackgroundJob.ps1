#requires -Version 7.0
# A local background job; no remote action.
$job = Start-Job -ScriptBlock {
    [pscustomobject]@{ Computer=[Environment]::MachineName; At=Get-Date }
}
try {
    $job | Wait-Job | Out-Null
    $job | Receive-Job -ErrorAction Stop
}
finally { $job | Remove-Job -Force }
