# Mission 05 - Microsoft Graph PowerShell

## Objective

The objective of this mission is to query and audit Microsoft Entra ID
using Microsoft Graph PowerShell.

The mission covers:

- Microsoft Graph authentication
- Delegated permission scopes
- Microsoft Entra users
- Groups
- Domains
- Organization information
- Subscribed licenses
- CSV reporting

---

## Microsoft Graph

Microsoft Graph is an API used to access Microsoft cloud services.

In this mission, Microsoft Graph is used to query Microsoft Entra ID.

Examples of Microsoft Graph resources:

- Users
- Groups
- Applications
- Devices
- Domains
- Licenses
- Directory roles

---

## Module Installation

```powershell
Install-Module Microsoft.Graph -Scope CurrentUser

---

## Connection

```powershell
Connect-MgGraph -Scopes "Organization.Read.All", "User.Read.All", "Group.Read.All", "Directory.Read.All"

Verify the connection:

```powershell
Get-MgContext

---

## Organization Information

```powershell
Get-MgOrganization | Select-Object DisplayName, Id

---

## Domains

```powershell
Get-MgDomain |  Select-Object Id, IsDefault, IsVerified

---

## Users

```powershell
Get-MgUser -All |  Select-Object DisplayName, UserPrincipalName, Id


---

## Groups

```powershell
Get-MgGroup -All | Select-Object DisplayName, Id,SecurityEnabled


---

## Licenses

```powershell
Get-MgSubscribedSku | Select-Object SkuPartNumber, SkuId, ConsumedUnits


---

## CSV Report

The synchronized users were exported to:

Reports/Entra-Synchronized-Users.csv


The report contains:

- Display name
- User Principal Name
- Synchronization status

---

## Validation

| Test | Result |
|---|---|
| Microsoft Graph module installed | Passed |
| Microsoft Graph connection established | Passed |
| Tenant organization queried | Passed |
| Domains queried | Passed |
| Users queried | Passed |
| Groups queried | Passed |
| License information queried | Passed |
| CSV report generated | Passed |

---

## Skills Demonstrated

- Microsoft Graph PowerShell
- Microsoft Entra auditing
- Delegated permissions
- Cloud reporting
- PowerShell object manipulation
- CSV export
- Identity administration automation

---

## Key Lesson

Microsoft Graph is the modern API for automating and auditing Microsoft
Entra ID and other Microsoft cloud services.