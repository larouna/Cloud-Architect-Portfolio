
<#
.SYNOPSIS
Displays Microsoft Entra users and hybrid synchronization state.
#>

$ErrorActionPreference = "Stop"

if (-not (Get-MgContext)) 
{
    throw "Not connected to Microsoft Graph."
}

Get-MgUser -All -Property Id,DisplayName, UserPrincipalName, OnPremisesSyncEnabled | Select-Object DisplayName,
                  UserPrincipalName,
                  OnPremisesSyncEnabled,
                  Id |
    Sort-Object DisplayName |
    Format-Table -AutoSize