
<#
.SYNOPSIS
Displays the Active Directory forest and configured UPN suffixes.
#>

$ErrorActionPreference = "Stop"

Import-Module ActiveDirectory

$forest = Get-ADForest

Write-Host ""
Write-Host "===== ACTIVE DIRECTORY FOREST ====="
Write-Host ""

Write-Host "Forest : $($forest.Name)"
Write-Host "Root Domain : $($forest.RootDomain)"

Write-Host ""
Write-Host "Alternative UPN suffixes:"
Write-Host ""

if ($forest.UPNSuffixes) 
{

    $forest.UPNSuffixes |
        ForEach-Object {
            Write-Host "- $_"
        }
}
else {
    Write-Host "No alternative UPN suffix configured."
}