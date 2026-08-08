# Mission 03 - Notes

## Microsoft Entra Connect Sync

Microsoft Entra Connect Sync is used to synchronize identity objects
from Active Directory Domain Services to Microsoft Entra ID.

Objects can include:

- Users
- Groups
- Contacts
- Selected identity attributes
- Password hashes when Password Hash Synchronization is enabled

---

## Source of Authority

For a synchronized user, Active Directory is normally the source of
authority.

This means that many attributes should be modified in Active Directory
instead of directly in Microsoft Entra ID.

Example:

```text
Display name
User Principal Name
Department
Job title
Group membership
```

After the modification, synchronization sends the update to Microsoft
Entra ID.

---

## Password Hash Synchronization

Password Hash Synchronization does not send the clear-text user
password to Microsoft Entra ID.

A derived hash of the existing Active Directory password hash is
synchronized.

Advantages:

- Simple architecture
- Cloud authentication remains available if the local environment is down
- No authentication agent is required for each sign-in
- Supports leaked credential detection capabilities
- Suitable for many hybrid identity environments

---

## Pass-Through Authentication

Pass-Through Authentication validates passwords against the local
Active Directory environment.

Authentication flow:

```text
User
  ↓
Microsoft Entra ID
  ↓
Pass-Through Authentication Agent
  ↓
Active Directory Domain Controller
```

The local environment must remain available for authentication.

---

## Federation

Federation redirects authentication to an external identity service,
traditionally AD FS.

Federation provides advanced control but introduces additional
infrastructure and operational complexity.

It should only be used when there is a justified business or technical
requirement.

---

## Entra Connect Sync Versus Cloud Sync

| Entra Connect Sync | Entra Cloud Sync |
|---|---|
| Full synchronization engine | Lightweight provisioning agents |
| Installed on a Windows Server | Managed mainly from the cloud |
| Supports advanced hybrid scenarios | Simplified deployment |
| Supports more complex transformations | Useful for multiple disconnected forests |
| Requires more local management | Reduced local infrastructure |

---

## Installation Preparation

Before installation, verify:

- Active Directory health
- DNS resolution
- Internet access
- Microsoft Entra administrative permissions
- Active Directory administrative permissions
- Custom domain verification
- Compatible user UPN suffixes
- Time synchronization
- Required outbound connectivity

---

## Synchronization Types

### Delta synchronization

Processes changes since the previous synchronization.

```powershell
Start-ADSyncSyncCycle -PolicyType Delta
```

### Initial synchronization

Performs a full import and synchronization.

```powershell
Start-ADSyncSyncCycle -PolicyType Initial
```

An initial synchronization is heavier than a delta synchronization.

---

## Scheduler Verification

```powershell
Get-ADSyncScheduler |
    Format-List *
```

Important values:

```text
SyncCycleEnabled
NextSyncCyclePolicyType
NextSyncCycleStartTimeInUTC
CustomizedSyncCycleInterval
CurrentlyEffectiveSyncCycleInterval
```

---

## Common Problems

### User is not synchronized

Possible causes:

- User is outside the selected OU
- Invalid UPN suffix
- Synchronization scheduler disabled
- Attribute conflict
- Duplicate UPN
- Duplicate proxy address
- Connector configuration issue

### User appears with an `onmicrosoft.com` suffix

Possible causes:

- Local UPN suffix is not verified
- User UPN was not updated before synchronization

### Password does not work in Microsoft Entra

Possible causes:

- Password Hash Synchronization not enabled
- Password synchronization has not completed
- User password was recently changed
- Synchronization service error

---

## Commands Used

```powershell
Import-Module ADSync
```

```powershell
Get-ADSyncScheduler
```

```powershell
Start-ADSyncSyncCycle -PolicyType Delta
```

```powershell
Start-ADSyncSyncCycle -PolicyType Initial
```

---

## Difficulties Encountered

- Understanding the identity source of authority
- Differentiating synchronization from authentication
- Choosing between Password Hash Sync and Pass-Through Authentication
- Triggering synchronization manually
- Verifying whether an identity is Cloud-only or synchronized

---

## Lessons Learned

- Synchronization and authentication are different processes.
- Password Hash Synchronization is a resilient and relatively simple method.
- Identity changes should be made in the correct source directory.
- Entra Connect health should be monitored.
- Only required identities should be synchronized.

---

## Interview Questions

### What is Microsoft Entra Connect Sync?

It is a synchronization service that transfers selected identity
objects and attributes from Active Directory to Microsoft Entra ID.

### What is the source of authority for a synchronized user?

The on-premises Active Directory environment is normally the source of
authority.

### What is the difference between delta and initial synchronization?

Delta synchronization processes recent changes, while initial
synchronization performs a full synchronization cycle.

### Does Password Hash Synchronization send clear-text passwords?

No. It synchronizes a derived hash, not the clear-text password.