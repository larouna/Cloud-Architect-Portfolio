
<#
.SYNOPSIS
Moves a laboratory user into the Cloud-Sync OU.
#>

param(
    [Parameter(Mandatory = $false)]
    [string]$User = "user-local01"
)

$ErrorActionPreference = "Stop"

Import-Module ActiveDirectory

$domainDN = (Get-ADDomain).DistinguishedName

$targetOU = "OU=Users,OU=Cloud-Sync,$domainDN"

$adUser = Get-ADUser -Identity $User

Write-Host "Moving $User into Cloud-Sync..."

Move-ADObject `
    -Identity $adUser.DistinguishedName `
    -TargetPath $targetOU

Write-Host "User moved successfully."

Write-Host ""
Write-Host "Run a Delta Sync from the Entra Connect server:"
Write-Host "Start-ADSyncSyncCycle -PolicyType Delta"