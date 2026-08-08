L’objectif est d’apprendre à contrôler qui peut faire quoi, sur quelles ressources et à quel niveau.

Il faut d’abord distinguer :

Rôles Microsoft Entra : administrent les identités, par exemple les utilisateurs, groupes et applications.
Rôles Azure RBAC : administrent les ressources Azure, par exemple les machines virtuelles, réseaux et comptes de stockage


Azure RBAC possède quatre niveaux d’étendue :

Management Group
      ↓
Subscription
      ↓
Resource Group
      ↓
Resource

Une autorisation accordée à un niveau supérieur est normalement héritée par les niveaux inférieurs. Il faut donc attribuer les permissions au niveau le plus restreint possible.

#############################################################

Mission 1 — Comprendre Entra Roles et Azure RBAC

Vous apprendrez la différence entre :

Global Administrator
User Administrator
Groups Administrator

et :

Owner
Contributor
Reader
User Access Administrator

#####################################

Mission 2 — Créer les groupes RBAC

Nous créerons :
GRP-AZ-RBAC-Readers
GRP-AZ-RBAC-Contributors
GRP-AZ-RBAC-Network-Admins

Les permissions seront attribuées aux groupes plutôt que directement aux utilisateurs.

########################################

Mission 3 — Tester les scopes et l’héritage

Nous attribuerons :

Reader au niveau de la subscription, puis :

Contributor uniquement sur un Resource Group de laboratoire.

#######################################

Mission 4 — Appliquer le principe du moindre privilège

Nous vérifierons qu’un utilisateur peut :

consulter certaines ressources ;
modifier uniquement les ressources autorisées ;
ne pas attribuer lui-même des rôles ;
ne pas accéder aux autres Resource Groups.

##################################################

Mission 5 — Azure Policy, tags et Resource Locks

Nous mettrons en place :

une politique imposant une région ;
des tags obligatoires ;
un verrou CanNotDelete ;
une convention de nommage.

#######################################################

Mission 6 — Documentation et portfolio

Vous produirez :

Labs/
└── Week02-Azure-RBAC-Governance/
    ├── Diagramme.drawio
    ├── Diagramme.png
    ├── Notes.md
    └── README.md

Puis vous réaliserez un Git push, idéalement avec une branche et une Pull Request.