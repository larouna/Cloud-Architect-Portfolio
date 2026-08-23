

<#
.SYNOPSIS
Validates the alternative UPN suffix and lists users using it.
#>

param(
    [Parameter(Mandatory = $false)]
    [string]$Suffix = "marouanelab.online"
)

$ErrorActionPreference = "Stop"

Import-Module ActiveDirectory

$forest = Get-ADForest

Write-Host ""
Write-Host "===== UPN SUFFIX VALIDATION ====="
Write-Host ""

if ($forest.UPNSuffixes -contains $Suffix) {
    Write-Host "[PASS] UPN suffix exists: $Suffix"
}
else {
    Write-Host "[FAIL] UPN suffix not found: $Suffix"
}

Write-Host ""
Write-Host "===== USERS USING $Suffix ====="
Write-Host ""

Get-ADUser -Filter * -Properties UserPrincipalName | Where-Object { $_.UserPrincipalName -like "*@$Suffix"
    } | Select-Object Name, SamAccountName,  UserPrincipalName | Format-Table -AutoSize