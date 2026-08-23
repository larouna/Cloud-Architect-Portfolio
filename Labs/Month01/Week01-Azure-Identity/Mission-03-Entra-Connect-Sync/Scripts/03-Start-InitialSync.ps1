
<#
.SYNOPSIS
Starts a full Microsoft Entra Connect synchronization cycle.
#>

$ErrorActionPreference = "Stop"

Import-Module ADSync

Write-Warning "Initial sync is heavier than a Delta sync."

$confirmation = Read-Host "Start Initial synchronization? (Y/N)"

if ($confirmation -ne "Y") {
    Write-Host "Operation cancelled."
    exit 0
}

$result = Start-ADSyncSyncCycle `
    -PolicyType Initial

$result

Write-Host "Initial synchronization requested."