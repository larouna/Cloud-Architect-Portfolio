#Partie 4 — Automatiser une attribution RBAC
#Étape 10 — Récupérer le groupe
#Étape 11 — Vérifier si l’attribution existe déjà
#Étape 12 — Créer l’attribution sans doublon
#Étape 13 — Vérifier l’attribution

# Import and execute the connection script from the same directory
. "$PSScriptRoot\00-Connect-AzEnvironment.ps1"

# Retrieve the Microsoft Entra ID (Azure AD) group object by its Display Name
$group = Get-AzADGroup -DisplayName "GRP-AZ-RBAC-Network-Operators"

# Check if the group was found; if not, throw an error and stop execution
if (-not $group) 
{
    throw "Le groupe GRP-AZ-RBAC-Network-Operators est introuvable."
}

# Display the group's Name and Object ID in the console
$group | Select-Object DisplayName, Id

# Check if a "Reader" role assignment already exists for this group at the target scope ($controlScope)
$existingAssignment = Get-AzRoleAssignment -ObjectId $group.Id | Where-Object {$_.RoleDefinitionName -eq "Reader" -and $_.Scope -eq $controlScope
    }

# Idempotent assignment logic: Create the role assignment only if it doesn't already exist
if (-not $existingAssignment) 
  {

    New-AzRoleAssignment -ObjectId $group.Id -RoleDefinitionName "Reader" -Scope $controlScope
    
    Write-Host "Attribution Reader créée."
}
    else {
    Write-Host "L'attribution existe déjà. Aucune modification."
    }


# Verify and display the active role assignments for this group at the target control scope
Get-AzRoleAssignment -ObjectId $group.Id | Where-Object {$_.Scope -eq $controlScope} | Select-Object DisplayName, RoleDefinitionName, Scope

#Étape 12 — Créer l’attribution sans doublon
if (-not $existingAssignment) {

    New-AzRoleAssignment -ObjectId $group.Id -RoleDefinitionName "Reader" -Scope $controlScope

    Write-Host "Attribution Reader créée."
}
else {
    Write-Host "L'attribution existe déjà. Aucune modification."
}

#Vérifier l’attribution
Get-AzRoleAssignment -ObjectId $group.Id | Where-Object {$_.Scope -eq $controlScope} |
    Select-Object DisplayName, RoleDefinitionName, Scope


#Partie 5 — Supprimer proprement l’attribution
#Étape 14 — Simulation avec -WhatIf
Remove-AzRoleAssignment `
    -ObjectId $group.Id `
    -RoleDefinitionName "Reader" `
    -Scope $controlScope `
    -WhatIf

#Étape 15 — Suppression réelle
Remove-AzRoleAssignment `
    -ObjectId $group.Id `
    -RoleDefinitionName "Reader" `
    -Scope $controlScope `
    -Confirm:$false


#verifier apres suppression
Get-AzRoleAssignment `
    -ObjectId $group.Id |
    Where-Object {
        $_.RoleDefinitionName -eq "Reader" -and
        $_.Scope -eq $controlScope
    }