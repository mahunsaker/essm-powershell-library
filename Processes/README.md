# Standard processes — search and reuse before building

## Procedure: New automation request

1. **Define** task, target, platform, outputs, security boundaries, and rollback.
2. **Search** `BROWSE-OFFLINE.html` or run `Find-ESSMAsset`.
3. **Inspect** matching source and status; check known duplicate or historical variants.
4. **Select** reuse / composition / refactor / new asset using [REUSE-DECISION](../Templates/REUSE-DECISION.md).
5. **Specify** contract: parameters, objects, error behavior, dependencies, supported PowerShell versions, side effects and authorization.
6. **Implement** one source of truth in a module or reusable script; avoid hidden global state.
7. **Test** in a personal isolated lab. Use WhatIf where writes are supported; record results.
8. **Review** secrets, company data, intellectual property, network targets and permissions.
9. **Version** the function/module, update catalog hashes, add changelog and test evidence.
10. **Distribute** a versioned offline ZIP with checksum. Publish to GitHub only after separate explicit approval and final release review.

## Status flow

`example → candidate → tested → approved`, with `deprecated` for retained historical interfaces. Approval is always scoped to a specific environment and version.

## Rollback

Keep the last verified offline package alongside the new release. Avoid modifying the working baseline until acceptance tests pass. Use an independent local copy for new projects.

See [OFFLINE-ARCHITECTURE.md](../Docs/OFFLINE-ARCHITECTURE.md), [RELEASE-PROCESS.md](../Docs/RELEASE-PROCESS.md) and [SECURITY.md](../SECURITY.md).
