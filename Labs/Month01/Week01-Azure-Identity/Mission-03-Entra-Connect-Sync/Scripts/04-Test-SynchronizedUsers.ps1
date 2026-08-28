<#
.SYNOPSIS
Compares Active Directory users with Microsoft Entra users.

.REQUIREMENTS
ActiveDirectory module
Az.Accounts
Az.Resources
#>

$ErrorActionPreference = "Stop"

Import-Module ActiveDirectory

if (-not (Get-AzContext)) {
    Connect-AzAccount
}

Write-Host "Reading Active Directory users..."

$localUsers = Get-ADUser `
    -Filter * `
    -Properties UserPrincipalName |
    Where-Object {
        $_.UserPrincipalName
    }

Write-Host "Reading Microsoft Entra users..."

$cloudUsers = Get-AzADUser

$report = foreach ($localUser in $localUsers) {

    $cloudMatch = $cloudUsers |
        Where-Object {
            $_.UserPrincipalName -eq
            $localUser.UserPrincipalName
        }

    [PSCustomObject]@{
        Name             = $localUser.Name
        UserPrincipalName = $localUser.UserPrincipalName
        FoundInEntra     = [bool]$cloudMatch
    }
}

$report |
    Sort-Object UserPrincipalName |
    Format-Table -AutoSize