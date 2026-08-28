<#
.SYNOPSIS
Displays Microsoft Entra users and groups using Az PowerShell.

.DESCRIPTION
This script is used before Microsoft Graph is introduced in Mission05.
#>

$ErrorActionPreference = "Stop"

if (-not (Get-Module -ListAvailable -Name Az.Resources)) 
{
    Write-Error "The Az.Resources module is required."
    exit 1
}

$context = Get-AzContext

if (-not $context) {
    Write-Error "No Azure session detected."
    exit 1
}

Write-Host ""
Write-Host "===== MICROSOFT ENTRA USERS ====="
Write-Host ""

Get-AzADUser | Select-Object DisplayName, UserPrincipalName, Id | Sort-Object DisplayName | Format-Table -AutoSize

Write-Host ""
Write-Host "===== MICROSOFT ENTRA GROUPS ====="
Write-Host ""

Get-AzADGroup | Select-Object DisplayName,Id | Sort-Object DisplayName | Format-Table -AutoSize