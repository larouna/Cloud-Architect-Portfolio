<#
.SYNOPSIS
Creates the Organizational Unit structure used by the hybrid identity lab.
#>

$ErrorActionPreference = "Stop"

Import-Module ActiveDirectory

$domainDN = (Get-ADDomain).DistinguishedName

function New-LabOU {

    param(
        [string]$Name,
        [string]$Path
    )

    $existing = Get-ADOrganizationalUnit `
        -LDAPFilter "(ou=$Name)" `
        -SearchBase $Path `
        -SearchScope OneLevel `
        -ErrorAction SilentlyContinue

    if ($existing) {

        Write-Host "OU already exists: $Name"
        return $existing
    }

    Write-Host "Creating OU: $Name"

    New-ADOrganizationalUnit `
        -Name $Name `
        -Path $Path `
        -ProtectedFromAccidentalDeletion $true `
        -PassThru
}

$cloudSyncOU = New-LabOU `
    -Name "Cloud-Sync" `
    -Path $domainDN

$usersOU = New-LabOU `
    -Name "Users" `
    -Path $cloudSyncOU.DistinguishedName

$groupsOU = New-LabOU `
    -Name "Groups" `
    -Path $cloudSyncOU.DistinguishedName

$localOU = New-LabOU `
    -Name "Not-Synchronized" `
    -Path $domainDN

Write-Host ""
Write-Host "OU structure created successfully."