Mission 06 — Final Documentation and Architecture
Objectif

Transformer le travail technique des cinq missions en portfolio professionnel.

Vous allez créer votre diagramme Draw.io :

ON-PREMISES
│
├── Active Directory Domain Services
│   ├── examlabpractice.com
│   ├── OU=Cloud-Sync
│   ├── Users
│   └── Groups
│
└───────────────┐
                │
                ▼
       Microsoft Entra Connect
       ├── OU Filtering
       └── Password Hash Sync
                │
                ▼
             CLOUD
                │
        Microsoft Entra ID
        ├── Verified Domain
        ├── Synced Users
        ├── Cloud Users
        └── Security Groups
                │
                ▼
       Microsoft Graph PowerShell

Enregistrer :

Diagramme.drawio
Diagramme.png

Le PNG avec fond blanc pour GitHub.