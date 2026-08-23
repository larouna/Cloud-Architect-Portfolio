
SEMAINE 1 — Azure Identity Foundation (PLAN JOUR PAR JOUR)
Objectif: 8 à 10h total

JOUR 1 — Azure Tenant & Structure (1h30 – 2h)
Objectif
Comprendre comment une entreprise structure Azure.


À apprendre
•	Azure Tenant (Microsoft Entra ID)
•	Subscription
•	Management Groups
•	Resource Groups
•	Subscription boundaries
________________________________________
Mini-lab
Dans Azure Portal :
•	Identifier ton Tenant ID
•	Lister tes subscriptions
•	Créer:
MG-Enterprise
 ├── Sub-Dev
 └── Sub-Prod
(Si pas possible MG → simule avec RG bien structurés)
________________________________________

Question architecte
👉 Pourquoi une entreprise utilise plusieurs subscriptions?
________________________________________
📝 Livrable
Note dans ton GitHub /notes :
•	définition Tenant
•	définition Subscription
•	schéma simple
________________________________________

JOUR 2 — Users & Groups (1h30)
Objectif
Comprendre la base IAM entreprise
________________________________________
À apprendre
•	Users
•	Groups
•	Dynamic groups (concept)
•	Service accounts
________________________________________

Lab
Créer :

3 users fictifs:
    o	dev1
    o	dev2
    o	admin1
•	
2 groupes :
    o	Cloud-Admins
    o	Dev-Team
________________________________________

🔥 Test
Ajoute users aux groupes et vérifie l’accès.
________________________________________

❓ Question
👉 Pourquoi utiliser des groupes au lieu de donner des droits directement aux users?
________________________________________

JOUR 3 — RBAC (2h)
Objectif
Maîtriser le contrôle d’accès Azure
________________________________________

À apprendre
•	Owner
•	Contributor
•	Reader
•	Custom Roles
•	Scope (très important)
________________________________________

Lab
Créer :
•	RG-DEV
•	RG-PROD
Attribuer :
Groupe	Role	Scope
Dev-Team	Contributor	RG-DEV
Cloud-Admins	Owner	Subscription
Admin1	Reader	RG-PROD
________________________________________
Question architecte
👉 Quelle est la différence entre scope Subscription et Resource Group ?
________________________________________
JOUR 4 — Managed Identity (2h)
Objectif
Supprimer les passwords dans le cloud________________________________________

 À apprendre
•	System-assigned identity
•	User-assigned identity
•	Access to Storage
________________________________________
🧪 Lab
1.	Créer une VM
2.	Activer Managed Identity
3.	Créer Storage Account
4.	Donner accès Blob Reader
5.	Tester accès depuis VM
________________________________________
💡 Important
Aucun secret / password utilisé
________________________________________
❓ Question
👉 Pourquoi Managed Identity est plus sécurisé qu’un service account ?
________________________________________
🟦 JOUR 5 — Azure Policy (1h30)
🎯 Objectif
Comprendre la gouvernance entreprise
________________________________________
📚 À apprendre
•	Policy
•	Initiative
•	Compliance
•	Deny vs Audit
________________________________________
🧪 Lab
Créer une policy :
👉 FORCER tag obligatoire:
•	Environment
•	Owner
Test :
•	créer une VM sans tag → doit échouer
________________________________________
❓ Question
👉 Pourquoi une entreprise impose des tags obligatoires?
________________________________________
🟦 JOUR 6 — Mini Projet GitHub (2h)
🎯 Objectif
Commencer ton portfolio pro
________________________________________
📦 Projet: Azure-Identity-Foundation
Créer repo:
Azure-Identity-Foundation/
│
├── README.md
├── diagrams/
├── scripts/
├── notes/
└── screenshots/
________________________________________
📄 README doit contenir:
•	Architecture IAM Azure
•	RBAC design
•	Managed Identity use case
•	Policy explanation
•	Diagram simple
________________________________________
🧠 Important
C’est déjà du niveau consultant, pas admin.
________________________________________
🟦 JOUR 7 — Review & Architecture Thinking (1h – 1h30)
🎯 Objectif
Apprendre à penser comme architecte
________________________________________
🧪 Exercice
Dessine (draw.io) :
Enterprise Azure Structure

Tenant
 ├── Management Group
 ├── Subscription Dev
 ├── Subscription Prod
 └── RBAC model
________________________________________
❓ Questions finales
Tu dois pouvoir répondre sans hésitation :
1.	Pourquoi utiliser Entra ID ?
2.	Pourquoi RBAC est critique en entreprise ?
3.	Pourquoi Managed Identity remplace les secrets ?
4.	Comment structurer une entreprise sur Azure ?
________________________________________



📊 CRITÈRE DE RÉUSSITE SEMAINE 1
Tu valides si :
✔ Tu as créé users + groups
✔ RBAC fonctionne
✔ Managed Identity testée
✔ Policy appliquée
✔ GitHub repo créé
✔ Diagramme fait
✔ README écrit
________________________________________
🚀 IMPORTANT (MENTOR MODE)
Si tu fais sérieusement cette semaine :
👉 Tu passes déjà du niveau “admin Azure” à “junior architecte cloud”
________________________________________
👉 PROCHAINE ÉTAPE
Quand tu as fini :
Réponds :
“Semaine 1 terminée”
et je vais te faire :
•	correction comme en entreprise (très important)
•	revue de ton GitHub
•	questions d’entretien niveau 2
•	préparation semaine 2 (Storage + Security design)
________________________________________
On est en train de construire ton profil Cloud Architect pour Paris 2027, étape par étape.

