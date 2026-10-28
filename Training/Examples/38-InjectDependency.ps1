#requires -Version 7.0
function Invoke-HealthTransform {
    [CmdletBinding()]
    param([Parameter(Mandatory)][scriptblock]$GetFacts)
    $facts = & $GetFacts
    [pscustomobject]@{ Source=$facts.Source; Healthy=[bool]$facts.Healthy }
}
# Inject a harmless fake dependency for offline testing.
Invoke-HealthTransform -GetFacts {
    [pscustomobject]@{ Source='Lab stub'; Healthy=$true }
}
