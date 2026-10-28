#requires -Version 7.0
[CmdletBinding()]
param([string]$Name='*',[ValidateSet('All','Script','Function','Module','Tool','Documentation','Template','Test')][string]$Kind='All')
Import-Module (Join-Path $PSScriptRoot '../Modules/ESSM.Reuse/ESSM.Reuse.psd1') -Force
Find-ESSMAsset -Name $Name -Kind $Kind
