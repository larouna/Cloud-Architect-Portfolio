1-Qu'est-ce qu'un Tenant Azure? 

Un Tenant (ou locataire) représente l'organisation ou l'entreprise au sein de Microsoft Entra ID (anciennement Azure AD).

•C'est une instance dédiée, isolée et sécurisée créée automatiquement lorsque ton entreprise souscrit à un service cloud de Microsoft (comme Azure ou Microsoft 365).
•Ce qu'il contient: Il regroupe les identités (utilisateurs, groupes, invités) et les applications de l'entreprise.
•En résumé: C'est la frontière suprême de ton entreprise dans le cloud. Si le cloud était un immense immeuble, le Tenant serait ton appartement privé.


2-Pourquoi utiliser plusieurs Subscriptions? 
Une Subscription (abonnement) est un conteneur d'administration et surtout de facturation. Bien qu'une entreprise puisse démarrer avec un seul abonnement, elle en utilise souvent plusieurs pour trois raisons majeures :
•	Séparation financière (Facturation) : Chaque abonnement génère sa propre facture. Cela permet de diviser précisément les coûts par département (ex: une souscription pour la Finance, une pour la R&D) ou par environnement.
•	Isolation des environnements (Sécurité) : Isoler complètement la Production des environnements de Développement ou de Test. Un développeur qui possède les droits maximaux en "Dev" ne pourra ainsi jamais casser par erreur une ressource critique de "Prod".
•	Contournement des limites (Quotas) : Azure applique des limites strictes par abonnement (par exemple, un nombre maximal de cœurs de processeur ou d'adresses IP publiques). Utiliser plusieurs abonnements permet de multiplier ces quotas.


•Pourquoi une entreprise utilise-t-elle des Management Groups ?
Dès qu'une entreprise grandit, elle se retrouve rapidement à gérer des dizaines, voire des centaines de Subscriptions. Appliquer des règles de sécurité ou des accès sur chaque abonnement, un par un, devient impossible à maintenir.
C'est là qu'interviennent les Management Groups (Groupes d'aménagement) :
•	Gouvernance à grande échelle : Ils permettent de regrouper tes abonnements dans une structure hiérarchique (comme des dossiers sur un ordinateur).
•	Héritage des Politiques : Si tu appliques une règle de sécurité (Azure Policy) ou un accès (RBAC) sur un Management Group, tous les abonnements situés en dessous en héritent automatiquement.
•	Exemple : Tu crées un Management Group "Production". Tu y appliques une règle qui interdit de créer des ressources en dehors de la région Europe. Tous les abonnements glissés dans ce groupe respecteront instantanément cette règle, sans effort supplémentaire.
