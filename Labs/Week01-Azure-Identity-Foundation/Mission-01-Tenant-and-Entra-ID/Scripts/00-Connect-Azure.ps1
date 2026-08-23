<#
.SYNOPSIS
Disconnects any active Azure session, then connects to Microsoft Azure and selects a subscription.

.DESCRIPTION
Used in Cloud-Architect-Portfolio / Week01 - Mission01 to establish a fresh Azure PowerShell context.
#>

param(
    [Parameter(Mandatory = $false)]
    [string]$SubscriptionId,

    [Parameter(Mandatory = $false)]
    [string]$TenantId
)

$ErrorActionPreference = "Stop"

# Verify that Az.Accounts is available
if (-not (Get-Module -ListAvailable -Name Az.Accounts)) 
{
    Write-Host "Az PowerShell is not installed." -ForegroundColor Red
    Write-Host "Install it with: Install-Module Az -Scope CurrentUser"
    exit 1
}

Import-Module Az.Accounts -WarningAction SilentlyContinue

# 1. Force disconnect and clear existing Azure context
Write-Host "Clearing any existing Azure session..." -ForegroundColor Yellow
Disconnect-AzAccount -Scope Process -ErrorAction SilentlyContinue | Out-Null
Clear-AzContext -Scope Process -Force -ErrorAction SilentlyContinue | Out-Null

# 2. Establish fresh connection
Write-Host "Connecting to Azure..." -ForegroundColor Cyan

$connectParams = @{}
if ($TenantId) { $connectParams["Tenant"] = $TenantId }

Connect-AzAccount @connectParams | Out-Null

# 3. Select subscription if provided
if ($SubscriptionId) 
{
    Write-Host "Selecting subscription $SubscriptionId..." -ForegroundColor Cyan
    Set-AzContext -Subscription $SubscriptionId | Out-Null
}

# 4. Display final active context
$context = Get-AzContext

if ($context) {
    Write-Host ""
    Write-Host "Azure connection established successfully." -ForegroundColor Green
    Write-Host "Account      : $($context.Account.Id)"
    Write-Host "Tenant       : $($context.Tenant.Id)"
    Write-Host "Subscription : $($context.Subscription.Name) ($($context.Subscription.Id))"
} else {
    Write-Error "Failed to retrieve Azure context after authentication."
}