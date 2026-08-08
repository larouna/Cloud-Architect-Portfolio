# Connect-AzEnvironment.ps1

param (
    [Parameter(Mandatory = $false)]
    [string]$TenantId = "fd2273aa-2436-42e8-97f9-2059bb4cd1d0",

    [Parameter(Mandatory = $false)]
    [string]$SubscriptionId = "34578069-aef4-4696-b104-0c5fbb23f491"
)

# Connect to Azure using device code if no active context exists
$context = Get-AzContext
if (-not $context) {
    Write-Host "Connecting to Azure..." -ForegroundColor Cyan
    Connect-AzAccount -TenantId $TenantId -DeviceCode
}

# Display available subscriptions
Get-AzSubscription | Select-Object Name, Id, TenantId, State

# Select the target subscription
Set-AzContext -SubscriptionId $SubscriptionId | Out-Null
Write-Host "Active Context set to Subscription ID: $SubscriptionId" -ForegroundColor Green