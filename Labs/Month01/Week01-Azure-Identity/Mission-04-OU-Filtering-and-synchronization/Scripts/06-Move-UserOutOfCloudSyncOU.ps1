

<#
.SYNOPSIS
Moves a synchronized laboratory user outside the Entra Connect sync scope.
#>

param(
    [Parameter(Mandatory = $false)]
    [string]$User = "user-cloud01"
)

$ErrorActionPreference = "Stop"

Import-Module ActiveDirectory

$domainDN = (Get-ADDomain).DistinguishedName

$targetOU = "OU=Not-Synchronized,$domainDN"

$adUser = Get-ADUser -Identity $User

Write-Host "Moving $User outside Cloud-Sync..."

Move-ADObject `
    -Identity $adUser.DistinguishedName `
    -TargetPath $targetOU

Write-Host "User moved successfully."

Write-Host ""
Write-Host "Run a Delta Sync from the Entra Connect server:"
Write-Host "Start-ADSyncSyncCycle -PolicyType Delta"