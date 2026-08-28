Mission 05 — Microsoft Graph PowerShell
Objectif

Administrer et auditer Microsoft Entra ID avec Microsoft Graph.

Installation
Install-Module Microsoft.Graph -Scope CurrentUser
Connexion
Connect-MgGraph -Scopes "Organization.Read.All",
            "User.Read.All",
            "Group.Read.All",
            "Directory.Read.All"
Vérifier
Get-MgContext
Organisation
Get-MgOrganization |
    Select-Object DisplayName, Id
Domaines
Get-MgDomain |
    Select-Object Id, IsDefault, IsVerified
Utilisateurs
Get-MgUser -All |
    Select-Object DisplayName,
                  UserPrincipalName,
                  Id
Groupes
Get-MgGroup -All |
    Select-Object DisplayName,
                  Id,
                  SecurityEnabled
Licences
Get-MgSubscribedSku |
    Select-Object SkuPartNumber,
                  SkuId,
                  ConsumedUnits
Export des utilisateurs synchronisés
Get-MgUser -All `
    -Property DisplayName,
              UserPrincipalName,
              OnPremisesSyncEnabled |
    Select-Object DisplayName,
                  UserPrincipalName,
                  OnPremisesSyncEnabled |
    Export-Csv `
        -Path ".\Entra-Synchronized-Users.csv" `
        -NoTypeInformation `
        -Encoding UTF8

À la fin :

Disconnect-MgGraph

Vous devez comprendre :

PowerShell
≠
Microsoft Graph

et :

Azure PowerShell
vs
Microsoft Graph PowerShell