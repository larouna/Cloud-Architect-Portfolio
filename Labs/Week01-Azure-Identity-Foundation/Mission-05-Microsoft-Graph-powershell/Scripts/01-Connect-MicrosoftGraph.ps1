<#
.SYNOPSIS
Connects to Microsoft Graph for Azure/Entra ID lab management.
#>

$ErrorActionPreference = "Stop"

$TenantId = "marwenkmgmail.onmicrosoft.com"

$scopes = @(
    "Domain.Read.All"        # Requis pour Get-MgDomain
    "Organization.Read.All"
    "User.Read.All"
    "Group.Read.All"
    "Directory.Read.All"
)

Write-Host "Connecting to Microsoft Graph for tenant [$TenantId]..." -ForegroundColor Cyan

# Force la déconnexion préalable pour éviter la réutilisation d'un jeton MSA
Disconnect-MgGraph -ErrorAction SilentlyContinue

# Connexion explicite au Tenant avec les scopes nécessaires
Connect-MgGraph -TenantId $TenantId -Scopes $scopes

Write-Host "`n===== GRAPH CONTEXT =====" -ForegroundColor Green
Get-MgContext | Select-Object Account, TenantId, AuthType, Scopes | Format-List