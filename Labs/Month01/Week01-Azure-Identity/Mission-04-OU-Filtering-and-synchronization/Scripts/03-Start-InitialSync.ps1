
#À exécuter sur le serveur Entra Connect :

<#
.SYNOPSIS
Runs an initial synchronization after changing OU filtering.
#>

$ErrorActionPreference = "Stop"

Import-Module ADSync

Write-Host "Starting Initial Synchronization..."

Start-ADSyncSyncCycle `
    -PolicyType Initial

Write-Host "Initial synchronization requested."