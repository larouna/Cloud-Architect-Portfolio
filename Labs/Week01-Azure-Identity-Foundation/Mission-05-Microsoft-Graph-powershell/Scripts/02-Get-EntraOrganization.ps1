
<#
.SYNOPSIS
Displays Microsoft Entra organization information.
#>

$ErrorActionPreference = "Stop"

if (-not (Get-MgContext)) 
{
    throw "Not connected to Microsoft Graph."
}

Get-MgOrganization | Select-Object DisplayName, Id | Format-Table -AutoSize