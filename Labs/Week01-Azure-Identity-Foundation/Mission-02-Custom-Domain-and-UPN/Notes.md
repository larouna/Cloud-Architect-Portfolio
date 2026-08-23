Mission 02 — Custom Domain and UPN

Objectif
Préparer correctement l'identité hybride avec votre domaine :

marouanelab.online

Travaux
Dans Microsoft Entra :
Microsoft Entra ID
→ Custom domain names

Vérifier que :
marouanelab.online

est bien enregistré et vérifié.

Dans Active Directory :

Active Directory Domains and Trusts
→ Properties

Ajouter :

marouanelab.online

comme Alternative UPN suffix.
Puis modifier les utilisateurs afin qu'ils utilisent par exemple :

user01@marouanelab.online
PowerShell
Get-ADForest |  Select-Object -ExpandProperty UPNSuffixes
Get-ADUser -Filter * -Properties UserPrincipalName | Select-Object Name,SamAccountName,UserPrincipalName

À comprendre

Vous devez pouvoir expliquer :

AD Domain
≠
UPN suffix
≠
Email address