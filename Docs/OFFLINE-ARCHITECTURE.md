# Offline-first architecture

```
Local source/editing  --->  local Pester/static checks  --->  local package + catalog
      |                           |                            |
      +---------------------------+----------------------------+
                                  |
                         optional approved publication
                                  |
                               GitHub
                         (remote archive only)
```

**No code executes by fetching anything from GitHub.** Project bootstrap, imports, and catalog lookup operate entirely from local files. GitHub is optional for version history, collaboration, disaster recovery and releases.

Use two explicit trust boundaries:

- `PRIVATE`: complete recovered historical versions, employer-origin source, environment-specific configuration, unresolved credentials. Keep offline and outside this public repository.
- `PUBLIC-CANDIDATE`: individually reviewed generic scripts, reusable clean module, documentation and example data. Nothing promotes itself automatically from private to public.

For local installations, extract a versioned ZIP, verify SHA-256, import only named reviewed modules and keep prior release for rollback. Do not link runtime code to a cloud URL, `Install-Module`, or remote scripts.
