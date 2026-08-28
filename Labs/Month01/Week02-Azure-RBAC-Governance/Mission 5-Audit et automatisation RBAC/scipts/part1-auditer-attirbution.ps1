
###Connexion Azure
Connect-AzAccount
Get-AzSubscription |  Select-Object Name, Id, TenantId, State
Set-AzContext -SubscriptionId "34578069-aef4-4696-b104-0c5fbb23f491"

#Definir les varibles
$subscriptionId = (Get-AzContext).Subscription.Id
$subscriptionScope = "/subscriptions/$subscriptionId"
$labResourceGroup = "rg-rbac-lab-canadacentral"
$controlResourceGroup = "rg-rbac-control-canadacentral"
$labScope = "$subscriptionScope/resourceGroups/$labResourceGroup"
$controlScope = "$subscriptionScope/resourceGroups/$controlResourceGroup"


####Auditer les attributions RBAC

#Voir les attributions effectives sur le Resource Group
Get-AzRoleAssignment -Scope $labScope | Select-Object DisplayName, ObjectType,RoleDefinitionName,Scope |FT -AutoSize

###Afficher uniquement les attributions directes
Get-AzRoleAssignment -Scope $labScope -AtScope | Select-Object DisplayName,ObjectType,RoleDefinitionName,Scope | FT -AutoSize


#Classer les roles directes et heriter
$assignments = Get-AzRoleAssignment -Scope $labScope
$rbacAudit = $assignments | Select-Object DisplayName,ObjectType,RoleDefinitionName,
           @{
                      Name = "AccessOrigin"
                      Expression = 
                      {
                          if ($_.Scope -eq $labScope) {
                              "Direct"
                          }
                          else {
                              "Inherited"
                          }
                      }
                  }

$rbacAudit | Format-Table -AutoSize