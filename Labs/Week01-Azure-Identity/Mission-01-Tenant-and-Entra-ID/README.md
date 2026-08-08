# Mission 01 - Azure Tenant and Microsoft Entra ID

## Objective

The objective of this mission is to understand the fundamental
organization of a Microsoft Azure environment.

This mission covers the relationship between:

- Microsoft Entra tenant
- Azure subscription
- Management Groups
- Resource Groups
- Azure resources
- Microsoft Entra users and groups

---

## Azure Resource Hierarchy

```text
Microsoft Entra Tenant
        │
        └── Management Groups
                │
                └── Azure Subscriptions
                        │
                        └── Resource Groups
                                │
                                └── Azure Resources

A Microsoft Entra tenant manages identities, while an Azure subscription
provides access to Azure services, resource deployment and billing.

---

## Environment

The following components were identified or created:

- Microsoft Entra tenant
- Default `onmicrosoft.com` domain
- Azure subscription
- Two cloud-only users
- Two Microsoft Entra security groups

---

## Cloud Users

The following cloud-only test users were created:

| User | Purpose |
|---|---|
| `cloud-admin01` | Administrative laboratory account |
| `cloud-user01` | Standard laboratory account |

Cloud-only users are created directly in Microsoft Entra ID and are not
synchronized from an on-premises Active Directory environment.

---

## Security Groups

The following Microsoft Entra security groups were created:

| Group | Member |
|---|---|
| `GRP-Cloud-Admins` | `cloud-admin01` |
| `GRP-Cloud-Users` | `cloud-user01` |

Permissions should preferably be assigned to groups instead of directly
to individual users.

---

## Tenant and Subscription

### Microsoft Entra tenant

The tenant is the identity and directory boundary.

It contains:

- Users
- Groups
- Applications
- Devices
- Microsoft Entra roles
- Authentication settings
- Verified domains

### Azure subscription

The Azure subscription is a logical container used for:

- Azure resource deployment
- Billing
- Quotas
- Azure RBAC
- Resource governance
- Cost management

A subscription is associated with one Microsoft Entra tenant at a time.

---

## Microsoft Entra Roles and Azure RBAC

Microsoft Entra roles are used to manage directory resources.

Examples:

- Global Administrator
- User Administrator
- Groups Administrator
- Authentication Administrator

Azure RBAC roles are used to manage Azure resources.

Examples:

- Owner
- Contributor
- Reader
- User Access Administrator

---

## Control Plane and Data Plane

### Control Plane

The Control Plane is used to manage the configuration of Azure
resources.

Examples:

- Create a Virtual Machine
- Delete a Storage Account
- Configure a Virtual Network
- Assign an Azure role

### Data Plane

The Data Plane is used to access the data stored or processed inside
a resource.

Examples:

- Read a blob from Azure Storage
- Query an Azure SQL database
- Retrieve a secret from Azure Key Vault
- Access files in an Azure file share

---

## PowerShell Commands

```powershell
Connect-AzAccount

Get-AzTenant |
    Select-Object Id, Name, Domains

Get-AzSubscription |
    Select-Object Name, Id, TenantId, State

---

## Validation

| Test | Result |
|---|---|
| Microsoft Entra tenant identified | Passed |
| Default domain identified | Passed |
| Azure subscription identified | Passed |
| Cloud users created | Passed |
| Security groups created | Passed |
| Users added to their groups | Passed |
| Tenant and subscription difference understood | Passed |

---

## Skills Demonstrated

- Microsoft Entra ID fundamentals
- Azure subscription administration
- Cloud identity management
- Security group management
- Azure hierarchy understanding
- Azure PowerShell fundamentals

---

## Key Lesson

A Microsoft Entra tenant manages identities.

An Azure subscription manages Azure resources, billing, governance
and access to Azure services.