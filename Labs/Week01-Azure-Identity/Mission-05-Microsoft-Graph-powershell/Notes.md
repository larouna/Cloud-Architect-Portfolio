# Mission 05 - Notes

## Microsoft Graph

Microsoft Graph provides a unified API for Microsoft cloud services.

It can interact with resources from services such as:

- Microsoft Entra ID
- Microsoft 365
- Outlook
- Teams
- SharePoint
- OneDrive
- Intune

For this mission, the focus is Microsoft Entra ID.

---

## Microsoft Graph Versus PowerShell

PowerShell is a scripting language and automation environment.

Microsoft Graph is an API.

The Microsoft Graph PowerShell SDK allows PowerShell commands to call
the Microsoft Graph API.

Example:

```powershell
Get-MgUser

This PowerShell command sends a request to Microsoft Graph.

---

## Azure PowerShell Versus Microsoft Graph PowerShell

| Azure PowerShell | Microsoft Graph PowerShell |
|---|---|
| Manages Azure resources | Manages Microsoft cloud directory resources |
| Commands start mainly with `Az` | Commands start mainly with `Mg` |
| Example: `Get-AzVM` | Example: `Get-MgUser` |
| Uses Azure Resource Manager | Uses Microsoft Graph API |
| Focuses on subscriptions and resources | Focuses on users, groups, apps and directory objects |

---

## Permission Scopes

Microsoft Graph uses permission scopes.

Examples:

User.Read.All
Group.Read.All
Directory.Read.All
Organization.Read.All


A scope defines what the connected session is allowed to access.

Some permissions require administrator consent.

---

## Delegated Permissions

Delegated permissions are used when a signed-in user executes the
Microsoft Graph request.

The effective access depends on:

- The requested scopes
- The user's own directory permissions
- Administrator consent

---

## Connection Commands

Install the module:

```powershell
Install-Module Microsoft.Graph `
    -Scope CurrentUser
```

Connect:

```powershell
Connect-MgGraph -Scopes "Organization.Read.All", "User.Read.All","Group.Read.All", "Directory.Read.All"

Display the context:

```powershell
Get-MgContext


Disconnect:

```powershell
Disconnect-MgGraph

---

## User Queries

Display all users:

```powershell
Get-MgUser -All |  Select-Object DisplayName, UserPrincipalName,Id


Display synchronization status:

```powershell
Get-MgUser -All -Property DisplayName, UserPrincipalName, OnPremisesSyncEnabled |  Select-Object DisplayName, UserPrincipalName, OnPremisesSyncEnabled


---

## Domain Queries

```powershell
Get-MgDomain |
    Select-Object Id,  IsDefault,  IsVerified

Possible results:
tenantname.onmicrosoft.com
examlabpractice.com


---

## Group Queries

```powershell
Get-MgGroup -All | Select-Object DisplayName, Id, SecurityEnabled,MailEnabled

---

## License Queries

```powershell
Get-MgSubscribedSku |  Select-Object SkuPartNumber, SkuId,  ConsumedUnits


`SkuPartNumber` identifies the license product.

`ConsumedUnits` indicates how many licenses are assigned.

---

## CSV Export Script

Example:

```powershell
$reportPath = ".\Reports\Entra-Synchronized-Users.csv"

Get-MgUser -All 
    -Property DisplayName,
              UserPrincipalName,
              OnPremisesSyncEnabled |
    Select-Object DisplayName,
                  UserPrincipalName,
                  OnPremisesSyncEnabled |
    Export-Csv `
        -Path $reportPath `
        -NoTypeInformation `
        -Encoding UTF8

---

## Recommended Script Structure

```powershell
Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$requiredScopes = @(
    "User.Read.All",
    "Directory.Read.All"
)

Connect-MgGraph -Scopes $requiredScopes

try {
    Get-MgUser -All
}
catch {
    Write-Error "Microsoft Graph query failed: $($_.Exception.Message)"
}
finally {
    Disconnect-MgGraph
}
```

---

## Common Problems

### Access denied

Possible causes:

- Required scope was not requested
- Administrator consent is missing
- Connected user lacks the required directory role

### Command not recognized

Possible causes:

- Microsoft Graph module not installed
- Required submodule not loaded
- PowerShell session needs to be restarted

### Property is empty

Possible causes:

- Property was not explicitly requested
- The object does not contain the value
- The identity is Cloud-only

Example:

```powershell
Get-MgUser -All -Property OnPremisesSyncEnabled
```

---

## Difficulties Encountered

- Understanding Microsoft Graph permission scopes
- Differentiating Azure PowerShell and Graph PowerShell
- Retrieving properties not returned by default
- Granting administrator consent
- Exporting clean CSV reports

---

## Lessons Learned

- Microsoft Graph is the main API for Microsoft Entra automation.
- PowerShell is the client used to call the API.
- Graph permissions should follow least privilege.
- Sensitive information should not be committed to GitHub.
- Reports are useful for auditing cloud identities.

---

## Interview Questions

### What is Microsoft Graph?

Microsoft Graph is a unified API for accessing Microsoft cloud services
and directory resources.

### What is the difference between Microsoft Graph and PowerShell?

Microsoft Graph is an API, while PowerShell is a scripting environment
that can call the API through the Microsoft Graph PowerShell SDK.

### What is a Graph permission scope?

A scope defines which Microsoft Graph operations the connected session
is authorized to perform.

### What is the difference between `Get-AzADUser` and `Get-MgUser`?

Both can retrieve Microsoft Entra users, but `Get-MgUser` directly uses
the Microsoft Graph API and provides broader Graph-based capabilities.