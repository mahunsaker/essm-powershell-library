# Optional: requires Pester 5+ installed locally or an approved offline source.
BeforeAll {
    Import-Module (Join-Path $PSScriptRoot '../Modules/ESSM.AdminKit/ESSM.AdminKit.psm1') -Force
}
Describe 'ESSM.AdminKit contract' {
    It 'exports the expected command' {
        Get-Command Get-ESSMHostSummary -ErrorAction Stop | Should -Not -BeNullOrEmpty
    }
    It 'emits object with a name and time' {
        $result = Get-ESSMHostSummary -Name 'LAB01'
        $result.Name | Should -Be 'LAB01'
        $result.CheckedAt | Should -Not -BeNullOrEmpty
    }
    It 'accepts pipeline input' {
        $rows = @( @('A','B') | Invoke-ESSMInventory )
        $rows.Count | Should -Be 2
    }
}
