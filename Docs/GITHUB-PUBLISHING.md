# GitHub publication — no runtime dependency

Use your **personal** Windows/Linux/macOS computer, never a restricted production workstation.

## One-time publish

1. Sign in to GitHub and create an **empty** repo named `essm-powershell-library` on your own account. Select visibility yourself. Do not check the boxes for remote README, gitignore, or license.
2. Open a local terminal in the extracted public candidate directory.
3. Run:

   ```sh
   git init -b main
   git add .
   git commit -m "Publish sanitized offline-first PowerShell reuse library v1.0"
   git remote add origin https://github.com/YOUR-GITHUB-USER/essm-powershell-library.git
   git push -u origin main
   git tag v1.0.0-public
   git push origin v1.0.0-public
   ```

Replace `YOUR-GITHUB-USER` with your GitHub username. Git authentication is only needed for publication/push, **never to use or create projects from this library**.

## Completely offline project work

   ```powershell
   Import-Module ./Modules/ESSM.Reuse/ESSM.Reuse.psd1
   Find-ESSMAsset -Name 'tcp'
   Test-ESSMTcpEndpoint -ComputerName 'localhost' -Port 80
   ```

To work on a disconnected machine, extract an approved release ZIP to a local directory and copy needed code into your project after review. Local `git init`, branches, and commits also work without network access.

## Publishing later updates

Update locally, run local checks, review for sensitive data, commit, push only from an approved internet-connected personal device, create a version tag. Preserve the offline ZIP release and SHA-256 in personal backups.

**Publication location:** GitHub remote is archival/optional, not part of any runtime, build or deployment path.
