<#
.SYNOPSIS
Creates laboratory users and a security group for OU filtering tests.
#>

param(
    [string]$UPNSuffix = "examlabpractice.com"
)

$ErrorActionPreference = "Stop"

Import-Module ActiveDirectory

$domainDN = (Get-ADDomain).DistinguishedName

$cloudUsersOU = "OU=Users,OU=Cloud-Sync,$domainDN"
$cloudGroupsOU = "OU=Groups,OU=Cloud-Sync,$domainDN"
$localOU = "OU=Not-Synchronized,$domainDN"

$password = Read-Host `
    "Enter temporary password for lab users" `
    -AsSecureString

$users = @(
    @{
        Name = "Cloud User 01"
        Sam  = "user-cloud01"
        Path = $cloudUsersOU
    },
    @{
        Name = "Cloud User 02"
        Sam  = "user-cloud02"
        Path = $cloudUsersOU
    },
    @{
        Name = "Local User 01"
        Sam  = "user-local01"
        Path = $localOU
    }
)

foreach ($item in $users) {

    $existing = Get-ADUser `
        -Identity $item.Sam `
        -ErrorAction SilentlyContinue

    if ($existing) {

        Write-Host "User already exists: $($item.Sam)"
        continue
    }

    Write-Host "Creating user: $($item.Sam)"

    New-ADUser `
        -Name $item.Name `
        -DisplayName $item.Name `
        -SamAccountName $item.Sam `
        -UserPrincipalName "$($item.Sam)@$UPNSuffix" `
        -Path $item.Path `
        -AccountPassword $password `
        -Enabled $true `
        -ChangePasswordAtLogon $false
}

$groupName = "GRP-Cloud-Synced"

if (-not (Get-ADGroup `
    -Identity $groupName `
    -ErrorAction SilentlyContinue)) {

    New-ADGroup `
        -Name $groupName `
        -SamAccountName $groupName `
        -GroupScope Global `
        -GroupCategory Security `
        -Path $cloudGroupsOU

    Write-Host "Group created: $groupName"
}

Add-ADGroupMember `
    -Identity $groupName `
    -Members user-cloud01,user-cloud02 `
    -ErrorAction SilentlyContinue

Write-Host "Laboratory identities created."