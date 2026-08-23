
<#
.SYNOPSIS
Adds an alternative UPN suffix to the Active Directory forest.
#>

param(
    [Parameter(Mandatory = $false)]
    [string]$Suffix = "examlabpractice.com"
)

$ErrorActionPreference = "Stop"

Import-Module ActiveDirectory

$forest = Get-ADForest

if ($forest.UPNSuffixes -contains $Suffix) {

    Write-Host "UPN suffix '$Suffix' already exists."
    exit 0
}

Write-Host "Adding UPN suffix: $Suffix"

Set-ADForest `
    -Identity $forest.Name `
    -UPNSuffixes @{Add = $Suffix}

Write-Host "UPN suffix successfully added."

(Get-ADForest).UPNSuffixes