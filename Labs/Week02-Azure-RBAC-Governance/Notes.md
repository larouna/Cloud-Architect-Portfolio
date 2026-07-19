# Week 02 - Azure RBAC and Governance


# Mission 1 - création des groupes Entra, du Resource Group et des premières attributions RBAC

## Microsoft Entra Roles

Les rôles Microsoft Entra permettent d'administrer les identités,
les utilisateurs, les groupes et les applications du tenant.

## Azure RBAC Roles

Azure RBAC contrôle l'accès aux ressources Azure.

## Scope hierarchy

Management Group
→ Subscription
→ Resource Group
→ Resource

## Tests réalisés

### GRP-AZ-RBAC-Readers

- Lecture de la subscription : autorisée
- Création de ressources : refusée
- Suppression de ressources : refusée

### GRP-AZ-RBAC-Contributors

- Création dans rg-rbac-lab-canadacentral : autorisée
- Création en dehors du Resource Group : refusée
- Attribution de rôles : refusée

## Conclusion

Les autorisations doivent être accordées à des groupes et au scope
le plus restreint possible afin de respecter le principe du moindre privilège.






# Mission 2 - RBAC Scope and Inheritance

## Objectif

Tester les rôles Reader et Contributor à différents scopes et
comprendre l'héritage des autorisations Azure RBAC.

## Architecture

Subscription
├── Reader : GRP-AZ-RBAC-Readers
├── rg-rbac-lab-canadacentral
│   └── Contributor : GRP-AZ-RBAC-Contributors
└── rg-rbac-control-canadacentral
    └── Aucune attribution Contributor

## Test Reader

- Consultation de la subscription : autorisée
- Consultation des Resource Groups : autorisée
- Création de ressources : refusée
- Modification de ressources : refusée
- Suppression de ressources : refusée

## Test Contributor

- Création dans rg-rbac-lab-canadacentral : autorisée
- Modification dans rg-rbac-lab-canadacentral : autorisée
- Création dans rg-rbac-control-canadacentral : refusée
- Attribution de rôles RBAC : refusée

## Héritage

Le rôle Reader attribué à la subscription est hérité par les
Resource Groups et les ressources.

Le rôle Contributor attribué à un Resource Group est limité à ce
Resource Group et à ses ressources.

## Permissions cumulatives

Un utilisateur membre des groupes Readers et Contributors peut être
Reader sur toute la subscription et Contributor uniquement dans le
Resource Group du laboratoire.

## Conclusion

Une attribution Azure RBAC repose sur trois éléments :

- Security principal
- Role definition
- Scope

Les autorisations doivent être accordées à des groupes et au scope
le plus restreint nécessaire.


# Mission 3 - Azure Policy, Tags and Resource Locks

## Objectif

Mettre en œuvre des mécanismes de gouvernance Azure afin de
contrôler les régions autorisées, standardiser les tags et protéger
les ressources contre les suppressions accidentelles.

## RBAC vs Policy vs Locks

- Azure RBAC contrôle qui peut effectuer une action.
- Azure Policy contrôle les configurations autorisées.
- Resource Locks protègent les ressources contre les suppressions
  ou les modifications accidentelles.

## Allowed Locations Policy

Scope:

rg-rbac-lab-canadacentral

Allowed location:

Canada Central

### Tests

- Création d'un NSG dans East US : refusée
- Création d'un NSG dans Canada Central : autorisée

Le rôle Contributor autorisait la création de la ressource, mais
Azure Policy a refusé la région non conforme.

## Tag Governance

Policy:

Inherit a tag from the resource group if missing

Tag:

Environment

Resource Group value:

Lab

### Résultat

Les ressources du laboratoire héritent automatiquement du tag:

Environment = Lab

Une remediation task a été utilisée pour corriger les ressources
existantes.

## Resource Lock

Lock name:

lock-rg-rbac-lab-delete

Lock type:

CanNotDelete

### Tests

- Modification du NSG : autorisée
- Suppression du NSG par Contributor : refusée
- Suppression du NSG par Owner : refusée
- Suppression après retrait du verrou : autorisée

## Conclusion

Azure RBAC, Azure Policy et Resource Locks sont complémentaires.

RBAC contrôle les permissions, Policy contrôle la conformité et
Resource Locks protègent les ressources critiques.