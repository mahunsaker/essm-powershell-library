# PowerShell scripts and quick automations

The 39 numbered [examples](../Training/Examples/) progress from basic syntax to administration, remote read-only checks, reporting, scheduling instructions and injected dependencies.

| Range | Focus |
| --- | --- |
| 00–10 | Discovery, objects, variables, flow control, functions |
| 11–19 | Pipeline functions, diagnostics, logging, backup WhatIf |
| 20–28 | Windows services/events, CIM, WinRM, health reports, scheduling |
| 29–38 | Measurement, hashes, composition, data-driven automation, jobs, dependency injection |

Run individual scripts only after reading the code and required parameters. Scripts with filesystem writes should be tested in a throwaway lab; remote checks require authorized access. No script should be assumed production-safe.

To avoid creating duplicates, search the catalog by intended task before writing a new script:
```powershell
Import-Module ./Modules/ESSM.Reuse/ESSM.Reuse.psd1
Find-ESSMAsset -Name 'log'
```
