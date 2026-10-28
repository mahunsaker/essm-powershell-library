#requires -Version 7.0
[CmdletBinding()]
param([ValidateSet('Green','Amber','Red')][string]$State = 'Green')
if ($State -eq 'Red') { Write-Warning 'Investigate immediately.' }
elseif ($State -eq 'Amber') { Write-Output 'Review soon.' }
else { Write-Output 'Nominal.' }
switch ($State) {
    'Green' { $priority=3 }
    'Amber' { $priority=2 }
    'Red' { $priority=1 }
}
[pscustomobject]@{ State=$State; Priority=$priority }
