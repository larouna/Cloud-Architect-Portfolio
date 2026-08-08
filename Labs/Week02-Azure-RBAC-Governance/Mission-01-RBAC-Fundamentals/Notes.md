# Week 02 - Azure RBAC and Governance

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