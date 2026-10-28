# Functions — single source of truth

Reusable implementations live in the [ESSM.Reuse module](../Modules/ESSM.Reuse/). Do not keep redundant function copies here.

| Function | File | Purpose |
| --- | --- | --- |
| `Find-ESSMAsset` | [source](../Modules/ESSM.Reuse/Public/Find-ESSMAsset.ps1) | Search bundled catalog offline |
| `Get-ESSMFileInventory` | [source](../Modules/ESSM.Reuse/Public/Get-ESSMFileInventory.ps1) | Local file inventory and optional SHA-256 |
| `Get-ESSMSystemSnapshot` | [source](../Modules/ESSM.Reuse/Public/Get-ESSMSystemSnapshot.ps1) | Read-only machine/process snapshot |
| `Test-ESSMTcpEndpoint` | [source](../Modules/ESSM.Reuse/Public/Test-ESSMTcpEndpoint.ps1) | TCP endpoint reachability with timeout |
| `Invoke-ESSMHealthReport` | [source](../Modules/ESSM.Reuse/Public/Invoke-ESSMHealthReport.ps1) | Compose system snapshot + TCP probe |

**Status:** candidate; review and runtime-test before operational use. Use [FUNCTION-CONTRACT](../Templates/FUNCTION-CONTRACT.md) before changing inputs, outputs or side effects.
