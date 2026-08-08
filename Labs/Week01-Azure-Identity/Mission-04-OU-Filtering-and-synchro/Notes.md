# Mission 04 - Notes

## Organizational Unit Filtering

Organizational Unit filtering limits which Active Directory objects
are synchronized to Microsoft Entra ID.

Without filtering, an organization could synchronize unnecessary:

- User accounts
- Service accounts
- Test accounts
- Disabled accounts
- Legacy groups
- Administrative accounts

---

## Why Filter Synchronization?

Filtering improves:

- Security
- Identity governance
- Administration
- Troubleshooting
- License management
- Data quality
- Cloud directory cleanliness

Example:

```text
OU=Cloud-Sync
```

Only identities placed in this OU are intended for cloud use.

---

## Recommended OU Structure

```text
OU=Cloud-Sync
│
├── OU=Users
├── OU=Groups
└── OU=Service-Accounts
```

A separate OU can contain local-only identities:

```text
OU=Local-Only
```

---

## Configuration Process

1. Open Microsoft Entra Connect.
2. Select Configure.
3. Select Customize synchronization options.
4. Authenticate to Microsoft Entra ID.
5. Select the Active Directory forest.
6. Open Domain and OU filtering.
7. Clear unnecessary OUs.
8. Select `OU=Cloud-Sync`.
9. Complete the configuration.
10. Run an initial synchronization.
11. Verify the synchronized identities.

---

## Initial Versus Delta Synchronization

A change to synchronization scope may require an initial cycle:

```powershell
Start-ADSyncSyncCycle -PolicyType Initial
```

A normal object modification can usually use a delta cycle:

```powershell
Start-ADSyncSyncCycle -PolicyType Delta
```

---

## Moving a User Into Scope

Initial state:

```text
OU=Not-Synchronized
└── user-local01
```

After movement:

```text
OU=Cloud-Sync
└── user-local01
```

After synchronization, the user should appear in Microsoft Entra ID.

---

## Moving a User Outside Scope

Initial state:

```text
OU=Cloud-Sync
└── user-cloud01
```

After movement:

```text
OU=Not-Synchronized
└── user-cloud01
```

After synchronization, the Microsoft Entra object can be soft-deleted.

The user may appear in:

```text
Microsoft Entra ID
→ Users
→ Deleted users
```

This is important because removing an object from synchronization
scope can affect user access.

---

## Security Considerations

Do not synchronize:

- Highly privileged local accounts unless required
- Break-glass local accounts
- Obsolete service accounts
- Test accounts without a business need
- Accounts containing invalid attributes
- Unnecessary administrative groups

---

## Common Problems

### Included user does not synchronize

Possible causes:

- Parent OU not selected
- User is in another OU
- Synchronization cycle not completed
- Invalid UPN
- Attribute conflict

### Excluded user still appears in Entra ID

Possible causes:

- Synchronization has not completed
- User was created directly in Microsoft Entra ID
- User is synchronized through another connector scope
- Deletion is still being processed

### OU filtering page is unavailable

Possible causes:

- Incorrect Entra Connect configuration mode
- Insufficient permissions
- Synchronization service issue

---

## Commands Used

Display synchronization scheduler:

```powershell
Get-ADSyncScheduler |
    Format-List *
```

Run delta synchronization:

```powershell
Start-ADSyncSyncCycle -PolicyType Delta
```

Run initial synchronization:

```powershell
Start-ADSyncSyncCycle -PolicyType Initial
```

Display AD users and distinguished names:

```powershell
Get-ADUser -Filter * `
    -Properties DistinguishedName |
    Select-Object Name,
                  UserPrincipalName,
                  DistinguishedName
```

---

## Difficulties Encountered

- Identifying the correct Organizational Units
- Understanding the effect of removing an OU from synchronization
- Waiting for deletion or synchronization results
- Differentiating a Cloud-only user from a synchronized user
- Understanding how object movement changes cloud lifecycle

---

## Lessons Learned

- Synchronization scope is an important security control.
- OU design affects identity governance.
- Moving a user outside the scope can remove cloud access.
- Synchronization filtering must be documented.
- Changes should be tested with laboratory accounts before production use.

---

## Interview Questions

### Why use OU filtering?

To synchronize only the identities required for cloud services and
avoid unnecessary or privileged accounts in Microsoft Entra ID.

### What happens when a synchronized user is moved outside the selected OU?

The user is removed from the synchronization scope and can be
soft-deleted in Microsoft Entra ID.

### When should an initial synchronization be used?

After major synchronization configuration changes, such as changing OU
filtering.

### Is OU filtering a substitute for identity governance?

No. It is one control among several identity governance mechanisms.