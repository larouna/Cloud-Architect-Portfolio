<#
.SYNOPSIS
Displays Microsoft Entra groups.
#>

$ErrorActionPreference = "Stop"

if (-not (Get-MgContext)) {
    throw "Not connected to Microsoft Graph."
}

Get-MgGroup `
    -All `
    -Property Id,
              DisplayName,
              SecurityEnabled,
              MailEnabled |
    Select-Object DisplayName,
                  SecurityEnabled,
                  MailEnabled,
                  Id |
    Sort-Object DisplayName |
    Format-Table -AutoSize