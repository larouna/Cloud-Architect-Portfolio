#Fichier Audit-AzRoleAssignments.ps1

# Import and execute the connection script from the same directory
. "$PSScriptRoot\00-Connect-AzEnvironment.ps1"

# Define variables and scopes
$subscriptionId = (Get-AzContext).Subscription.Id
$subscriptionScope = "/subscriptions/$subscriptionId"

$labResourceGroup = "rg-rbac-lab-canadacentral"
$controlResourceGroup = "rg-rbac-control-canadacentral"

$labScope = "$subscriptionScope/resourceGroups/$labResourceGroup"
$controlScope = "$subscriptionScope/resourceGroups/$controlResourceGroup"

# 1. View effective role assignments on the lab Resource Group
Write-Host "`n--- Effective Role Assignments ---" -ForegroundColor Yellow
Get-AzRoleAssignment -Scope $labScope | Select-Object DisplayName, SignInName, ObjectType, RoleDefinitionName, Scope | Format-Table -AutoSize

# 2. View direct role assignments only
Write-Host "`n--- Direct Role Assignments Only ---" -ForegroundColor Yellow
Get-AzRoleAssignment -Scope $labScope -AtScope | Select-Object DisplayName, ObjectType, RoleDefinitionName, Scope | Format-Table -AutoSize

# 3. Classify assignments as Direct or Inherited
Write-Host "`n--- RBAC Audit (Direct vs Inherited) ---" -ForegroundColor Yellow
$assignments = Get-AzRoleAssignment -Scope $labScope

$rbacAudit = $assignments | Select-Object DisplayName, ObjectType, RoleDefinitionName,
                  @{
                      Name = "AccessOrigin"
                      Expression = {
                          if ($_.Scope -eq $labScope) {
                              "Direct"
                          }
                          else {
                              "Inherited"
                          }
                      }
                  }

$rbacAudit | Format-Table -AutoSize