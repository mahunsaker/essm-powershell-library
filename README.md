# ESSM PowerShell Reuse Library

**Search first. Reuse existing work. Test locally. Publish optionally.**

This public repository is a **sanitized, offline-first reference library**, not the private historical development archive. It contains generic training examples, reusable read-only functions, local inventory tools, tests, and development procedures. It deliberately excludes employer-owned source, internal network configurations, credentials, and unreviewed Admin Console history.

> **Status:** Public sample / candidate code; static provenance and Git object integrity checked. **Not runtime-tested or production-approved.** Review scripts and run them on a personal test system before use.

## Find what you need

- **[INDEX.md](INDEX.md)** — sections for tools, functions, modules, scripts, processes, tests and templates.
- **[BROWSE-OFFLINE.html](BROWSE-OFFLINE.html)** — searchable browser. Open the file from an extracted local copy of this repository; no network, server or GitHub login required.
- **[Catalog/assets.csv](Catalog/assets.csv)** — 65 indexed assets with status, file path, and source SHA-256.

## Work entirely offline

Download the repository ZIP while connected and copy it to your authorized local workstation. Extract it; the scripts themselves do **not** call GitHub. With PowerShell 7 open in the extracted folder:

```powershell
Import-Module ./Modules/ESSM.Reuse/ESSM.Reuse.psd1 -Force

Find-ESSMAsset -Name 'network'
Get-ESSMSystemSnapshot
Test-ESSMTcpEndpoint -ComputerName localhost -Port 443
Invoke-ESSMHealthReport -ComputerName localhost
```

For guided training:

```powershell
pwsh -NoProfile -File ./Training/Examples/00-StartHere.ps1
```

For static verification once PowerShell 7 is available:

```powershell
./Tools/Test-ESSMPublication.ps1 -ParseAll
```

Pester tests are optional and require Pester 5+ to already be available locally or supplied through an authorized offline source.

## Development standard

**Search → Inspect → Compare → Compose → Test → Document → Version → Distribute offline.**

Before creating a new function, search the existing catalog and review matching contracts. Reuse a tested function when its interface and behavior meet your requirement. If not, compose smaller functions or create a new version; do not silently replace old implementations.

Never run historical code merely because it is cataloged. Each asset has a status: `example`, `candidate`, `tested`, `approved`, or `deprecated`. See [status definitions](Docs/STATUS-CONTRACT.md).

## Trust boundary and licensing

This public repository is separate from a private historical recovery archive. **No employer or third-party code should be published without documented permission.** Managed/offline work environments must use approved transfer and deployment processes.

A distribution license has **not** been selected. Until a proper `LICENSE` is added, no open-source license is granted by this repository; see [license decision](LICENSE-DECISION.md). Security concerns and contribution standards are in [SECURITY.md](SECURITY.md) and [CONTRIBUTING.md](CONTRIBUTING.md).

GitHub is used only for optional storage, comparison, releases and recovery—**never required to develop, build, test, or run projects.**
