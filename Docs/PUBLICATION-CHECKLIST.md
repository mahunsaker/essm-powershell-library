# Before publication (human sign-off required)

- [ ] Verify ownership/licensing of every file; do not publish employer intellectual property, even in a private GitHub repository without permission.
- [ ] Confirm no corporate system names, domains, IP addresses, usernames, customer identifiers, personal information or internal operational details.
- [ ] Confirm no passwords, tokens, certificates/private keys, connection strings, secret-bearing history or files with live credentials.
- [ ] Inspect copied scripts for unsafe side effects and any unexpected data exfiltration; test in an isolated personal lab.
- [ ] Parse PowerShell files and run repository integrity tests in PowerShell 7 and Windows PowerShell 5.1 where relevant.
- [ ] Decide license (MIT, Apache-2.0, or no license). Add a proper `LICENSE` file only after choosing.
- [ ] Review README, metadata, commit history and file names for inadvertently disclosed details.
- [ ] Create a **new empty repository** named `essm-powershell-library` under the desired GitHub account. Do not initialize it with remote README/license if using the command instructions below.
- [ ] Confirm public or private visibility and that included files are suitable for that setting.
- [ ] Tag `v1.0.0-public` and attach a vetted ZIP + checksums as an optional release artifact.

**Never push the original private recovery archive, even temporarily, to a public repository.** Deleting files in a later commit does not erase them from commit history.
