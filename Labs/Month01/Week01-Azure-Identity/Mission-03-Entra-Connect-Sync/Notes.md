Mission 03 — Microsoft Entra Connect Sync
Objectif
Synchroniser vos comptes Active Directory locaux vers Microsoft Entra ID.

Architecture :

Active Directory
      │
      ▼
Microsoft Entra Connect Sync
      │
      ▼
Microsoft Entra ID

Travaux

Étape 1 — Vérifier les prérequis
Microsoft recommande que le serveur Entra Connect soit joint au domaine, dispose de la résolution DNS correcte, de TLS 1.2 et d’une connectivité vers Microsoft Entra. Le compte utilisé pour configurer Entra doit disposer des permissions adaptées, et pour une installation Express, le compte AD utilisé est typiquement Enterprise Admin.

Etape 2 - Configurer Entra Connect avec :Password Hash Synchronization

Puis vérifier que les utilisateurs AD apparaissent dans Microsoft Entra ID.


Sur votre serveur Entra Connect :
Import-Module ADSync
Get-ADSyncScheduler

Synchronisation Delta :
Start-ADSyncSyncCycle -PolicyType Delta

Synchronisation complète :
Start-ADSyncSyncCycle -PolicyType Initial


Vous devez comprendre les différences entre
Password Hash Synchronization
Pass-Through Authentication
Federation
Entra Cloud Sync

Et surtout comprendre :
Synchronization ≠ Authentication