<#
.SYNOPSIS
Starts a Microsoft Entra Connect delta synchronization.
#>

$ErrorActionPreference = "Stop"

Import-Module ADSync

Write-Host "Starting Microsoft Entra Connect Delta Sync..."

$result = Start-ADSyncSyncCycle -PolicyType Delta

$result

Write-Host "Delta synchronization requested."