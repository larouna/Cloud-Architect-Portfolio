<#
.SYNOPSIS
Updates the UPN suffix of explicitly selected laboratory users.

.EXAMPLE
.\02-Update-LabUserUPNs.ps1 `
    -SamAccountNames user01,user02 `
    -Suffix examlabpractice.com
#>

param(
    [Parameter(Mandatory = $true)]
    [string[]]$SamAccountNames,

    [Parameter(Mandatory = $false)]
    [string]$Suffix = "examlabpractice.com"
)

$ErrorActionPreference = "Stop"

Import-Module ActiveDirectory

foreach ($sam in $SamAccountNames) {

    $user = Get-ADUser `
        -Identity $sam `
        -Properties UserPrincipalName `
        -ErrorAction SilentlyContinue

    if (-not $user) {
        Write-Warning "User '$sam' not found."
        continue
    }

    $newUPN = "$($user.SamAccountName)@$Suffix"

    Write-Host ""
    Write-Host "User       : $($user.Name)"
    Write-Host "Old UPN    : $($user.UserPrincipalName)"
    Write-Host "New UPN    : $newUPN"

    Set-ADUser `
        -Identity $user `
        -UserPrincipalName $newUPN

    Write-Host "UPN updated successfully."
}