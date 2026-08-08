# Mission 03 - Microsoft Entra Connect Sync

## Objective

The objective of this mission is to synchronize on-premises Active
Directory identities with Microsoft Entra ID.

The selected sign-in method is:
Password Hash Synchronization

---

## Architecture

On-Premises Active Directory
            │
            ▼
Microsoft Entra Connect Sync
            │
            ▼
Microsoft Entra ID


Microsoft Entra Connect reads identity information from Active
Directory and synchronizes selected objects to Microsoft Entra ID.

---

## Environment

The laboratory contains:

- Active Directory Domain Services
- Domain: `examlabpractice.com`
- Microsoft Entra tenant
- Verified custom domain
- Microsoft Entra Connect Sync server
- Password Hash Synchronization
- Synchronized test users

---

## Identity Types

### Cloud-only identity

Created and managed directly in Microsoft Entra ID.

### Synchronized identity

Created in Active Directory and synchronized to Microsoft Entra ID.

For a synchronized identity, Active Directory remains the main source
of authority for most identity attributes.

---

## Authentication Method

Password Hash Synchronization was enabled.

The users can authenticate in Microsoft Entra ID using a synchronized
password hash.

The actual on-premises password is not directly sent or stored in
Microsoft Entra ID.

---

## Synchronization Commands

Import the synchronization module:

```powershell
Import-Module ADSync

Display the scheduler:

```powershell
Get-ADSyncScheduler


Start a delta synchronization:

```powershell
Start-ADSyncSyncCycle -PolicyType Delta

Start a full synchronization:

```powershell
Start-ADSyncSyncCycle -PolicyType Initial

---

## Validation

| Test | Result |
|---|---|
| Entra Connect installed | Passed |
| Active Directory forest connected | Passed |
| Microsoft Entra tenant connected | Passed |
| Password Hash Synchronization enabled | Passed |
| Initial synchronization completed | Passed |
| Test users visible in Entra ID | Passed |
| Synchronized identity source verified | Passed |

---

## Authentication Comparison

| Method | Description |
|---|---|
| Password Hash Synchronization | Authentication occurs in Microsoft Entra using a synchronized password hash |
| Pass-Through Authentication | Password validation is performed by on-premises agents |
| Federation | Authentication is redirected to a federation service |
| Cloud Sync | Lightweight agents synchronize identities using cloud-managed configuration |

---

## Skills Demonstrated

- Hybrid identity configuration
- Microsoft Entra Connect Sync
- Password Hash Synchronization
- Synchronization monitoring
- Microsoft Entra user verification
- PowerShell synchronization management

---

## Key Lesson

Microsoft Entra Connect Sync allows an organization to use the same
identity across Active Directory and Microsoft Entra ID.