# Contributing reusable PowerShell components

1. Search the bundled catalog before opening a new implementation.
2. Keep functions small and composable. Prefer approved verb-noun naming, clear output objects and parameter validation.
3. Supply comment-based help, usage example, dependency list and error behavior. Avoid `Write-Host` as the only result.
4. For changes, support `-WhatIf`/`-Confirm` where practical. Never assume network/admin privileges or hard-code secrets.
5. Add Pester or reproducible manual tests; do not claim success without test evidence.
6. Update `Catalog/assets.csv` by running `Tools/Update-ESSMCatalog.ps1` on PowerShell 7.
7. Run `Tools/Test-ESSMPublication.ps1` and manually inspect the staged diff.
8. Never contribute code copied from an employer or private historical package without documented authorization.
