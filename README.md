# ESSM PowerShell Reuse Library

**Offline-first, searchable PowerShell examples and reusable functions.**

This is the **public-safe publication candidate**, not a copy of the complete private ESSM recovery archive. It contains generic sample scripts and a small composable module. It deliberately excludes private historical Admin Console versions, employer-origin code and configurations, personal host inventory, internal network details, and credential-bearing source files.

> **Status:** Publication candidate; static checks only. Test on your own equipment before using. No source here is warranted or certified for production.

## Start without GitHub

1. Download the ZIP once or copy the folder to your computer. Unzip to a normal directory; `git` is **not needed**.
2. Open `BROWSE-OFFLINE.html` in any local web browser; search by function, script, process, or tag.
3. In PowerShell 7:

   ```powershell
   Import-Module ./Modules/ESSM.Reuse/ESSM.Reuse.psd1 -Force
   Find-ESSMAsset -Name 'network'
   Get-ESSMSystemSnapshot
   Invoke-ESSMHealthReport -ComputerName 'localhost'
   ```

4. For training: `pwsh -NoProfile -File ./Training/Examples/00-StartHere.ps1`.
5. Run `./Tools/Test-ESSMPublication.ps1` and review findings before releases.

GitHub is used solely to **store, share, compare, and retrieve versioned releases**. All catalog searching, source editing, testing, and project creation run locally with no service connectivity. No runtime downloads, API keys, GitHub Actions, or dependency on a Git remote.

## Sections

| Section | Contents |
| --- | --- |
| `Modules/` | Reusable importable functions and composition examples |
| `Training/Examples/` | Beginner-to-advanced PowerShell practice scripts |
| `Training/Modules/` | Modular function composition training example |
| `Tools/` | Offline catalog searching, integrity and publication checks |
| `Catalog/` | File inventory and metadata for offline search |
| `Docs/` | Design decisions, publishing, safety, release discipline |
| `Templates/` | Function contract and reuse decision templates |

## Reuse-first development

**Search → Inspect → Compare → Compose → Test → Document → Version → Distribute offline.**

- `Find-ESSMAsset -Name 'health'` searches the bundled catalog.
- Copy only the approved, tested components into a project; never import unreviewed historical code.
- If a routine is repeated, extract it into a single function with a stable interface and tests.
- Record its dependencies, supported platforms, side effects, limitations, and rollback.
- Keep real environment settings in untracked local configuration files.

## Scope, licensing and security

This repository is intended to be published **only after an explicit review** of the candidate and repository visibility. A code license has **not** yet been selected. Public visibility alone does not authorize third-party reuse. See `LICENSE-DECISION.md`.

No corporate code should be imported unless its owner has explicitly authorized publication. For work environments with restricted connectivity, use the local repository and approved offline transfer procedures, not GitHub access at work.
