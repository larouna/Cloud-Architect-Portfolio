
<#
.SYNOPSIS
Exports Microsoft Entra synchronized users to CSV.
#>

$ErrorActionPreference = "Stop"

if (-not (Get-MgContext)) {
    throw "Not connected to Microsoft Graph."
}

$reportDirectory = Join-Path `
    $PSScriptRoot `
    "..\Reports"

New-Item `
    -ItemType Directory `
    -Path $reportDirectory `
    -Force |
    Out-Null

$reportPath = Join-Path `
    $reportDirectory `
    "Entra-Synchronized-Users.csv"

$users = Get-MgUser `
    -All `
    -Property Id,
              DisplayName,
              UserPrincipalName,
              OnPremisesSyncEnabled

$users |
    Where-Object {
        $_.OnPremisesSyncEnabled -eq $true
    } |
    Select-Object DisplayName,
                  UserPrincipalName,
                  OnPremisesSyncEnabled |
    Sort-Object DisplayName |
    Export-Csv `
        -Path $reportPath `
        -NoTypeInformation `
        -Encoding UTF8

Write-Host "Report created:"
Write-Host $reportPath