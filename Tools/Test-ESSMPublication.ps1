#requires -Version 7.0
[CmdletBinding()]
param([switch]$ParseAll)
$ErrorActionPreference = 'Stop'
$root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$catalog = Join-Path $root 'Catalog/assets.csv'
if (-not (Test-Path -LiteralPath $catalog)) { throw 'Missing catalog' }
$issues = [System.Collections.Generic.List[string]]::new()
$rows = @(Import-Csv -LiteralPath $catalog)
foreach ($r in $rows) {
    $target = Join-Path $root $r.Path
    if (-not (Test-Path -LiteralPath $target -PathType Leaf)) { $issues.Add("Missing: $($r.Path)"); continue }
    if ((Get-FileHash -LiteralPath $target -Algorithm SHA256).Hash -ne $r.SHA256) { $issues.Add("Checksum mismatch: $($r.Path)") }
}
$scanExts = @('.ps1','.psm1','.psd1','.csv','.json','.md','.html','.txt')
$all = @(Get-ChildItem -LiteralPath $root -File -Recurse | Where-Object { $_.Extension -in $scanExts -and $_.FullName -notmatch '[\\/]\.git[\\/]' })
foreach ($f in $all) {
    if ($f.FullName -match '[\\/]Private[\\/]') { continue } # module private helpers are allowed; no secrets are implied
    $raw = Get-Content -LiteralPath $f.FullName -Raw
    if ($raw -match ('(?i)poly[ -]?america|' + 'markh' + '@|' + 'mahunsaker' + '@|essmhomelab\.local|192\.168\.1\.\d+')) {
        $issues.Add("Review internal identifier in $($f.FullName.Substring($root.Length+1))")
    }
}
if ($ParseAll) {
    foreach ($f in ($all | Where-Object { $_.Extension -in @('.ps1','.psm1','.psd1') })) {
        $tokens=$null; $parseErrors=$null
        [void][System.Management.Automation.Language.Parser]::ParseFile($f.FullName,[ref]$tokens,[ref]$parseErrors)
        foreach($e in @($parseErrors)){ $issues.Add("PowerShell parse error: $($f.Name): $($e.Message)") }
    }
}
if ($issues.Count) {
    $issues | ForEach-Object { Write-Warning $_ }
    throw "Publication check failed: $($issues.Count) issue(s)"
}
"PASS: $($rows.Count) catalog entries have matching SHA-256; static identifiers scan clean; ParseAll=$ParseAll"
