

<#
.SYNOPSIS
Validates which laboratory users should be in the Entra Connect sync scope.
#>

$ErrorActionPreference = "Stop"

Import-Module ActiveDirectory

$domainDN = (Get-ADDomain).DistinguishedName

$cloudOU = "OU=Cloud-Sync,$domainDN"
$localOU = "OU=Not-Synchronized,$domainDN"

$results = @()

Get-ADUser `
    -Filter * `
    -SearchBase $cloudOU `
    -Properties UserPrincipalName |
    ForEach-Object {

        $results += [PSCustomObject]@{
            UserPrincipalName = $_.UserPrincipalName
            OU                = "Cloud-Sync"
            ExpectedSync      = $true
        }
    }

Get-ADUser `
    -Filter * `
    -SearchBase $localOU `
    -Properties UserPrincipalName |
    ForEach-Object {

        $results += [PSCustomObject]@{
            UserPrincipalName = $_.UserPrincipalName
            OU                = "Not-Synchronized"
            ExpectedSync      = $false
        }
    }

$results |
    Sort-Object OU, UserPrincipalName |
    Format-Table -AutoSize