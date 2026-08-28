Mission 01 — Tenant and Microsoft Entra ID

Travaux à réaliser

Identifier :

votre Tenant ID 
votre domaine onmicrosoft.com 
votre Subscription ID 
le tenant associé à la subscription.

Créer deux utilisateurs Cloud :
cloud-admin01
cloud-user01

Créer deux groupes :
GRP-Cloud-Admins
GRP-Cloud-Users

Puis associer les utilisateurs aux groupes.

PowerShell
Connect-AzAccount
Get-AzTenant | Select-Object Id, Name, Domains
Get-AzSubscription | Select-Object Name, Id, TenantId, State

À comprendre
Microsoft Entra Tenant = identité
Azure Subscription      = ressources + facturation

Et :
Control Plane
vs
Data Plane