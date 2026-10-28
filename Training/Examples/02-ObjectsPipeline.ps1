#requires -Version 7.0
# Objects move through the pipeline; formatting is the last step.
Get-Process |
    Where-Object { $_.CPU -ne $null } |
    Sort-Object CPU -Descending |
    Select-Object -First 8 Name, Id, CPU |
    Format-Table -AutoSize
