# PowerShell modules

## [ESSM.Reuse](ESSM.Reuse/ESSM.Reuse.psd1)

Importable, offline-first module exporting five reusable functions. The module loader dot-sources `Public/*.ps1`. No cloud downloads or online dependencies.

```powershell
Import-Module ./Modules/ESSM.Reuse/ESSM.Reuse.psd1
Get-Command -Module ESSM.Reuse
```

## [ESSM.AdminKit training module](../Training/Modules/ESSM.AdminKit/ESSM.AdminKit.psm1)

Teaching example of `Public/` vs `Private/` helpers, function composition and pipeline input. Sample code only.

For any module change, update the module manifest/version, function contracts, tests and catalog hash. Keep previous working versions available for rollback.
