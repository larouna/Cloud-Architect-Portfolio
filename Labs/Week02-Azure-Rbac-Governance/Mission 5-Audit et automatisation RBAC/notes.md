# Mission 5 - RBAC Audit and PowerShell Automation

## Objectif

Auditer les attributions Azure RBAC et automatiser la création,
la vérification et la suppression d'une attribution de rôle.

## Audit réalisé

Le rapport RBAC contient :

- Le principal de sécurité
- Le type de principal
- Le rôle attribué
- Le scope
- L'origine directe ou héritée de l'autorisation

## Attributions directes et héritées

Une attribution est directe lorsque son scope correspond
exactement au Resource Group analysé.

Une attribution provenant de la subscription est considérée
comme héritée.

## Rôles privilégiés analysés

- Owner
- Contributor
- User Access Administrator
- Role Based Access Control Administrator

Ces rôles doivent être vérifiés régulièrement, car ils donnent
des permissions étendues.

## Test d'automatisation

Le rôle Reader a été temporairement attribué au groupe :

GRP-AZ-RBAC-Network-Operators

Scope :

rg-rbac-control-canadacentral

Résultats :

- Consultation du Resource Group : autorisée
- Modification du Resource Group : refusée
- Suppression de l'attribution avec PowerShell : réussie

## Idempotence

Le script vérifie si l'attribution existe avant de la créer.

Cela empêche les erreurs et permet de réexécuter le script
sans tenter de recréer inutilement la même attribution.

## Sécurité

La commande Remove-AzRoleAssignment a été testée avec
le paramètre WhatIf avant la suppression réelle.

Le scope, le rôle et l'Object ID du groupe ont été précisés
explicitement.