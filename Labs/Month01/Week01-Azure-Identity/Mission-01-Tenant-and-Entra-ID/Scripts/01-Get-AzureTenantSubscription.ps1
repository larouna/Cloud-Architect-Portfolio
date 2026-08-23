<#
.SYNOPSIS
Displays Azure tenant, subscription and current context information.
#>

$ErrorActionPreference = "Stop"

$context = Get-AzContext

if (-not $context) 
{
    Write-Error "No Azure session detected. Run 00-Connect-Azure.ps1 first."
    exit 1
}

Write-Host ""
Write-Host "===== MICROSOFT ENTRA TENANTS ====="
Write-Host ""

Get-AzTenant | Select-Object Name, Id, Domains | Format-Table -AutoSize

Write-Host ""
Write-Host "===== AZURE SUBSCRIPTIONS ====="
Write-Host ""

Get-AzSubscription | Select-Object Name,Id,TenantId,State | Format-Table -AutoSize

Write-Host ""
Write-Host "===== CURRENT AZURE CONTEXT ====="
Write-Host ""

Get-AzContext | Select-Object Account, Subscription,Tenant,Environment | Format-List