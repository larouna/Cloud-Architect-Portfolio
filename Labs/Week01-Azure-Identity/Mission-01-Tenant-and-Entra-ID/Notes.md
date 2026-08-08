# Mission 01 - Notes

## Microsoft Entra Tenant

A Microsoft Entra tenant is a dedicated identity directory.

It provides an identity boundary for:

- Users
- Groups
- Devices
- Applications
- Authentication
- Directory roles
- Security policies

Every tenant has an initial domain similar to:

```text
tenantname.onmicrosoft.com
```

The tenant is identified by a unique Tenant ID.

---

## Azure Subscription

An Azure subscription provides access to Azure services.

It is used for:

- Resource deployment
- Billing
- Quotas
- Azure RBAC assignments
- Cost management
- Azure Policy assignments

A company can use several subscriptions to separate:

- Production
- Development
- Testing
- Security
- Connectivity
- Different departments
- Different billing boundaries

---

## Tenant Versus Subscription

| Microsoft Entra Tenant | Azure Subscription |
|---|---|
| Identity boundary | Resource and billing boundary |
| Contains users and groups | Contains Resource Groups |
| Uses Microsoft Entra roles | Uses Azure RBAC roles |
| Manages authentication | Manages Azure resources |
| Has a Tenant ID | Has a Subscription ID |

A single tenant can contain multiple Azure subscriptions.

---

## Resource Groups

A Resource Group is a logical container for Azure resources.

Resources in a Resource Group usually share:

- The same application
- The same lifecycle
- The same environment
- Similar permissions
- Similar governance requirements

Deleting a Resource Group deletes the resources contained inside it.

---

## Management Groups

Management Groups organize Azure subscriptions.

Example:

```text
Tenant Root Group
│
├── Platform
│   ├── Connectivity Subscription
│   ├── Identity Subscription
│   └── Management Subscription
│
└── Landing Zones
    ├── Production Subscription
    └── Development Subscription
```

Azure RBAC and Azure Policy can be assigned at Management Group scope.

---

## Cloud-Only Identity

A cloud-only identity is created directly in Microsoft Entra ID.

Its source of authority is Microsoft Entra ID.

Example:

```text
cloud-user01@tenantname.onmicrosoft.com
```

The identity is managed from the Microsoft Entra portal or Microsoft
Graph.

---

## Security Groups

Security groups should be used to assign permissions to several users.

Recommended method:

```text
User
  ↓
Security Group
  ↓
Role Assignment
```

Less recommended:

```text
User
  ↓
Direct Role Assignment
```

Using groups simplifies:

- Access administration
- Onboarding
- Offboarding
- Permission auditing
- Access reviews

---

## Microsoft Entra Role Versus Azure RBAC Role

### Microsoft Entra role

Controls the administration of the directory.

Example:

```text
User Administrator
```

This role can manage Microsoft Entra users.

### Azure RBAC role

Controls access to Azure resources.

Example:

```text
Virtual Machine Contributor
```

This role can manage Azure Virtual Machines at a specific Azure scope.

---

## Control Plane

The Control Plane uses Azure Resource Manager.

Typical operations:

```text
Microsoft.Compute/virtualMachines/write
Microsoft.Network/virtualNetworks/write
Microsoft.Storage/storageAccounts/delete
```

---

## Data Plane

The Data Plane provides access to the internal content of a service.

Examples:

- Blob data
- Key Vault secrets
- Database records
- Storage files

A user can sometimes manage a resource without being able to access
its data.

The opposite can also be true depending on the assigned roles.

---

## Commands Used

```powershell
Connect-AzAccount
```

Displays the current Azure context:

```powershell
Get-AzContext
```

Displays tenants:

```powershell
Get-AzTenant
```

Displays subscriptions:

```powershell
Get-AzSubscription
```

Selects a subscription:

```powershell
Set-AzContext -SubscriptionId "<SUBSCRIPTION-ID>"
```

---

## Difficulties Encountered

- Understanding the difference between a tenant and a subscription
- Differentiating Microsoft Entra roles from Azure RBAC roles
- Understanding why a subscription must be associated with a tenant
- Differentiating Control Plane operations from Data Plane operations

---

## Lessons Learned

- Identities and Azure resources are managed through different access systems.
- Microsoft Entra ID manages identities.
- Azure RBAC manages Azure resource access.
- Groups should be preferred over direct user assignments.
- Permissions should follow the principle of least privilege.

---

## Interview Questions

### What is a Microsoft Entra tenant?

A Microsoft Entra tenant is a dedicated identity directory containing
users, groups, applications, devices and authentication settings.

### What is an Azure subscription?

An Azure subscription is a resource, billing, quota and governance
boundary associated with a Microsoft Entra tenant.

### Can a tenant contain several subscriptions?

Yes. A single Microsoft Entra tenant can contain multiple Azure
subscriptions.

### What is the difference between the Control Plane and Data Plane?

The Control Plane manages the configuration of a service, while the
Data Plane provides access to the data inside the service.