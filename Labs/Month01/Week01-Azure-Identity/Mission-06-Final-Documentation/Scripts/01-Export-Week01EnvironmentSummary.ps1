
<#
.SYNOPSIS
Exports a high-level Week01 identity environment summary.

.DESCRIPTION
No credentials or secrets are exported.
#>

$ErrorActionPreference = "Continue"

$reportDirectory = Join-Path  $PSScriptRoot    "..\Reports"
New-Item  -ItemType Directory  -Path $reportDirectory  -Force | Out-Null

$reportPath = Join-Path `
    $reportDirectory `
    "Week01-Environment-Summary.txt"

$lines = New-Object System.Collections.Generic.List[string]

$lines.Add("Week01 - Azure Identity Foundation")
$lines.Add("Generated: $(Get-Date)")
$lines.Add("")
$lines.Add("===== ACTIVE DIRECTORY =====")

if (Get-Module -ListAvailable ActiveDirectory) 
{

    Import-Module ActiveDirectory

    try 
    {

        $domain = Get-ADDomain
        $forest = Get-ADForest

        $lines.Add("Domain: $($domain.DNSRoot)")
        $lines.Add("Forest: $($forest.Name)")
        $lines.Add(
            "UPN Suffixes: $($forest.UPNSuffixes -join ', ')"
        )
    }
    catch {

        $lines.Add("Unable to query Active Directory.")
    }
}
else {

    $lines.Add("ActiveDirectory module unavailable.")
}

$lines.Add("")
$lines.Add("===== AZURE =====")

if (Get-Module -ListAvailable Az.Accounts) 
{

    $context = Get-AzContext

    if ($context) {

        $lines.Add(
            "Subscription: $($context.Subscription.Name)"
        )

        $lines.Add(
            "Account: $($context.Account.Id)"
        )
    }
    else {

        $lines.Add("No active Azure context.")
    }
}

$lines.Add("")
$lines.Add("===== ENTRA CONNECT =====")

if (Get-Module -ListAvailable ADSync) {

    Import-Module ADSync

    try {

        $scheduler = Get-ADSyncScheduler

        $lines.Add(
            "Sync Enabled: $($scheduler.SyncCycleEnabled)"
        )

        $lines.Add(
            "Sync Interval: $($scheduler.CurrentlyEffectiveSyncCycleInterval)"
        )
    }
    catch {

        $lines.Add("Unable to query ADSync.")
    }
}
else {

    $lines.Add("ADSync module unavailable on this machine.")
}

$lines | Set-Content -Path $reportPath -Encoding UTF8

Write-Host "Environment report created:"
Write-Host $reportPath