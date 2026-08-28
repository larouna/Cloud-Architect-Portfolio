
<#
.SYNOPSIS
Displays Microsoft Entra domains and verification status.
#>

$ErrorActionPreference = "Stop"

if (-not (Get-MgContext)) 
{
    throw "Not connected to Microsoft Graph."
}

Get-MgDomain | Select-Object Id, IsDefault, IsInitial, IsVerified | Sort-Object Id | Format-Table -AutoSize