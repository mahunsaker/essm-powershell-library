# Versioning and governance

Use SemVer for stable components. Changes to parameter or output shape require a major version; new backward-compatible functions minor; bug fixes patch. Keep `CHANGELOG.md`, function contract and test evidence current.

Workflow: describe need → search catalog → review existing functions → identify duplicate implementations → compose small units → write tests → run in lab → obtain environment approval → package offline with SHA-256 → optionally archive on GitHub.

Separately maintain the historical recovery repository and its unapproved source catalog **off GitHub** until a complete per-file ownership and security review is performed.
