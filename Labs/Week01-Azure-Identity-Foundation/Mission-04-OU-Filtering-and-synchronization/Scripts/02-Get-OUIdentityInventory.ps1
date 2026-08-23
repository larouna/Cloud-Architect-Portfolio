<#
.SYNOPSIS
Displays users located in the synchronized and non-synchronized OUs.
#>

$ErrorActionPreference = "Stop"

Import-Module ActiveDirectory

$domainDN = (Get-ADDomain).DistinguishedName

$cloudOU = "OU=Cloud-Sync,$domainDN"
$localOU = "OU=Not-Synchronized,$domainDN"

Write-Host ""
Write-Host "===== CLOUD SYNC USERS ====="
Write-Host ""

Get-ADUser `
    -Filter * `
    -SearchBase $cloudOU `
    -Properties UserPrincipalName |
    Select-Object Name,
                  SamAccountName,
                  UserPrincipalName,
                  DistinguishedName |
    Format-Table -AutoSize

Write-Host ""
Write-Host "===== NON-SYNCHRONIZED USERS ====="
Write-Host ""

Get-ADUser `
    -Filter * `
    -SearchBase $localOU `
    -Properties UserPrincipalName |
    Select-Object Name,
                  SamAccountName,
                  UserPrincipalName,
                  DistinguishedName |
    Format-Table -AutoSize