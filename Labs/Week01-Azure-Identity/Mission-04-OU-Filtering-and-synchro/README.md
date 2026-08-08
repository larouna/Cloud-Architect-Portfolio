# Mission 04 - OU Filtering and Synchronization

## Objective

The objective of this mission is to limit Microsoft Entra Connect
synchronization to selected Active Directory Organizational Units.

This implements a controlled synchronization scope.

---

## Active Directory Structure

examlabpractice.com
│
├── OU=Cloud-Sync
│   │
│   ├── OU=Users
│   │   ├── user-cloud01
│   │   └── user-cloud02
│   │
│   └── OU=Groups
│       └── GRP-Cloud-Synced
│
└── OU=Not-Synchronized
    └── user-local01


Only the `Cloud-Sync` Organizational Unit is included in the
synchronization scope.

---

## Configuration

Microsoft Entra Connect was reconfigured using:

Configure
→ Customize synchronization options
→ Domain and OU filtering

Only the required Organizational Units were selected.

---

## Test Scenario

| Identity | Organizational Unit | Expected Result |
|---|---|---|
| `user-cloud01` | `OU=Cloud-Sync` | Synchronized |
| `user-cloud02` | `OU=Cloud-Sync` | Synchronized |
| `user-local01` | `OU=Not-Synchronized` | Not synchronized |

---

## Synchronization Commands

Start a full synchronization after changing OU filtering:

```powershell
Start-ADSyncSyncCycle -PolicyType Initial


Start a delta synchronization after moving a user:

```powershell
Start-ADSyncSyncCycle -PolicyType Delta


---

## Movement Test

A user was moved from a non-synchronized OU to a synchronized OU.

Expected result:

The user appears in Microsoft Entra ID after synchronization.


A synchronized user was then moved outside the synchronization scope.

Expected result:

The Microsoft Entra user is removed from the active directory view
and may appear under deleted users.


---

## Validation

| Test | Result |
|---|---|
| Cloud-Sync OU created | Passed |
| Not-Synchronized OU created | Passed |
| OU filtering configured | Passed |
| Included users synchronized | Passed |
| Excluded user not synchronized | Passed |
| User movement into scope tested | Passed |
| User movement outside scope tested | Passed |

---

## Skills Demonstrated

- Active Directory OU design
- Microsoft Entra Connect filtering
- Synchronization scope management
- Hybrid identity lifecycle
- Synchronization testing
- PowerShell synchronization control

---

## Key Lesson

Only identities required by the organization should be synchronized
to Microsoft Entra ID.