# ESSM Repository Index

The **same function should have one reviewed source of truth**; navigation sections link to it instead of copying the implementation into multiple folders.

| Section | Location | Purpose |
| --- | --- | --- |
| Tools | [Tools/](Tools/README.md) | Search, catalog updates, publication validation |
| Functions | [Functions/](Functions/README.md) | Five reusable function definitions in `Modules/ESSM.Reuse/Public/` |
| Modules | [Modules/](Modules/README.md) | ESSM.Reuse, plus teaching example ESSM.AdminKit |
| Scripts | [Scripts/](Scripts/README.md) | 39 progressive PowerShell examples |
| Processes | [Processes/](Processes/README.md) | Reuse-first methodology and change control |
| Documentation | [Docs/](Docs/) | Architecture, status, release, publication and security |
| Templates | [Templates/](Templates/) | Function contract, reuse decision records |
| Tests | [Training/Tests/](Training/Tests/) | Pester training test suite |
| Catalog | [Catalog/assets.csv](Catalog/assets.csv) | Asset registry and SHA-256 tracking |

**Public/private boundary:** Only sanitized generic assets are here; private work and historical versions are deliberately excluded.

**Asset status:** `example` and `candidate` are not approvals. Consult [STATUS-CONTRACT.md](Docs/STATUS-CONTRACT.md).
