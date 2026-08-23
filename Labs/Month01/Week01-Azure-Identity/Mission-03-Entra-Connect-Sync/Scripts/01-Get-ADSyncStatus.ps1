
<#
.SYNOPSIS
Displays Microsoft Entra Connect Sync service and scheduler status.
#>

$ErrorActionPreference = "Stop"

Import-Module ADSync

Write-Host ""
Write-Host "===== ADSYNC SERVICE ====="
Write-Host ""

Get-Service ADSync | Select-Object Name,DisplayName,Status, StartType |  Format-Table -AutoSize

Write-Host ""
Write-Host "===== ADSYNC SCHEDULER ====="
Write-Host ""

Get-ADSyncScheduler |
    Format-List SyncCycleEnabled,
                StagingModeEnabled,
                NextSyncCyclePolicyType,
                NextSyncCycleStartTimeInUTC,
                CurrentlyEffectiveSyncCycleInterval,
                SyncCycleInProgress