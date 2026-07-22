
connect-AzAccount -TenantId fd2273aa-2436-42e8-97f9-2059bb4cd1d0 -DeviceCode

Set-AzContext -SubscriptionId "34578069-aef4-4696-b104-0c5fbb23f491"

Get-AzRoleDefinition -Name "Network Contributor" | Format-List Name, Description, Actions, NotActions, DataActions, AssignableScopes



# Récupère la subscription actuellement sélectionnée
$subscriptionId = (Get-AzContext).Subscription.Id

# Nom du rôle personnalisé
$roleName = "Lab Network Operator"

# Vérifie que le rôle n'existe pas déjà
$existingRole = Get-AzRoleDefinition -Name $roleName -ErrorAction SilentlyContinue

if ($existingRole) 
{
    Write-Warning "Le rôle '$roleName' existe déjà."
}
else 
{
    # Utilise Reader comme structure de départ
    $role = Get-AzRoleDefinition -Name "Reader"

    # Personnalisation de la définition
    $role.Id = $null
    $role.Name = $roleName
    $role.Description = @"
Allows lab users to read resources and create or update
virtual networks, subnets, network security groups and
security rules. Deletion and RBAC management are not allowed.
"@

    $role.IsCustom = $true

    # Supprime les permissions héritées de Reader
    $role.Actions.Clear()
    $role.NotActions.Clear()
    $role.DataActions.Clear()
    $role.NotDataActions.Clear()
    $role.AssignableScopes.Clear()

    # Ajoute uniquement les permissions nécessaires
    $allowedActions = @(
        "Microsoft.Resources/subscriptions/read",
        "Microsoft.Resources/subscriptions/resourceGroups/read",
        "Microsoft.Resources/subscriptions/resourceGroups/resources/read",

        "Microsoft.Resources/deployments/read",
        "Microsoft.Resources/deployments/write",
        "Microsoft.Resources/deployments/validate/action",
        "Microsoft.Resources/deployments/operationStatuses/read",

        "Microsoft.Network/*/read",

        "Microsoft.Network/virtualNetworks/write",
        "Microsoft.Network/virtualNetworks/subnets/write",

        "Microsoft.Network/networkSecurityGroups/write",
        "Microsoft.Network/networkSecurityGroups/join/action",
        "Microsoft.Network/networkSecurityGroups/securityRules/write",
        "Microsoft.Network/networkSecurityGroups/delete"
    )

    foreach ($action in $allowedActions) 
    {
        [void]$role.Actions.Add($action)
    }

    # Le rôle est disponible dans cette subscription
    [void]$role.AssignableScopes.Add(
        "/subscriptions/$subscriptionId"
    )

    # Création du rôle
    New-AzRoleDefinition -Role $role

    Write-Host "Rôle '$roleName' créé avec succès."
}



Get-AzRoleDefinition -Name "Lab Network Operator" | Format-List Name,Id,IsCustom,Description,Actions,NotActions, DataActions,AssignableScopes


(Get-AzRoleDefinition -Name "Lab Network Operator").Actions


$group = Get-AzADGroup -DisplayName "GRP-AZ-RBAC-Network-Operators"

Get-AzRoleAssignment -ObjectId $group.Id | Select-Object DisplayName,RoleDefinitionName,Scope