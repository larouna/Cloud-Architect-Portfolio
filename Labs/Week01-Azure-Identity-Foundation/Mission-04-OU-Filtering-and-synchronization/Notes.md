Mission 04 — OU Filtering and Synchronization
Objectif

Éviter de synchroniser tout votre Active Directory.

Créez une structure similaire :

examlabpractice.com
│
├── OU=Cloud-Sync
│   │
│   ├── OU=Users
│   │   ├── user-cloud01
│   │   └── user-cloud02
│   │
│   └── OU=Groups
│       └── GRP-Cloud-Synced
│
└── OU=Not-Synchronized
    └── user-local01
Configurer Entra Connect
Configure
→ Customize synchronization options
→ Domain and OU filtering

Sélectionner uniquement :

OU=Cloud-Sync

Puis :

Start-ADSyncSyncCycle -PolicyType Initial
Tests

Vous devez obtenir :

user-cloud01 → Synchronisé
user-cloud02 → Synchronisé
user-local01 → Non synchronisé

Ensuite :

déplacer user-local01 dans Cloud-Sync;
lancer un Delta Sync ;
vérifier qu'il apparaît dans Entra.

Puis faire l'inverse avec un utilisateur synchronisé.

Cela vous permettra de comprendre le cycle de vie d'une identité hybride.