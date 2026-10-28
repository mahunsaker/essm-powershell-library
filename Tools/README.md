# Repository tools

| Tool | Purpose |
| --- | --- |
| [Find-ESSMAsset.ps1](Find-ESSMAsset.ps1) | Command-line wrapper for local catalog search |
| [Test-ESSMPublication.ps1](Test-ESSMPublication.ps1) | Check indexed paths and SHA-256 values; optional PowerShell parser verification |
| [Update-ESSMCatalog.ps1](Update-ESSMCatalog.ps1) | Recompute catalog hashes after legitimate source changes |

Requires **PowerShell 7**. No network or GitHub service is used by these tools.

```powershell
./Tools/Find-ESSMAsset.ps1 -Name 'network'
./Tools/Test-ESSMPublication.ps1 -ParseAll
```

Review a planned change and test it locally before using `Update-ESSMCatalog.ps1`; recalculating a hash does not prove code quality or security.
