# Mission 06 - Notes

## Purpose of the Final Documentation

A technical laboratory is not complete until its architecture,
configuration, tests and lessons are documented.

Professional documentation allows another engineer to understand:

- The business objective
- The architecture
- The configuration
- The security controls
- The tests
- The limitations
- The troubleshooting process

---

## Final Architecture Description

The laboratory connects an on-premises Active Directory environment
to Microsoft Entra ID.

Identity flow:

```text
Active Directory user
        ↓
Selected Organizational Unit
        ↓
Microsoft Entra Connect Sync
        ↓
Microsoft Entra synchronized user
```

Authentication method:

```text
Password Hash Synchronization
```

Management and audit method:

```text
Microsoft Graph PowerShell
```

---

## Diagram Design

The diagram should contain three main zones:

### Zone 1 — On-Premises

- Active Directory Domain Services
- Domain Controller
- Users
- Security groups
- Cloud-Sync OU
- Local-only OU

### Zone 2 — Synchronization

- Microsoft Entra Connect Sync
- Password Hash Synchronization
- OU filtering
- Synchronization arrows

### Zone 3 — Microsoft Cloud

- Microsoft Entra tenant
- Verified domain
- Synchronized identities
- Cloud-only identities
- Microsoft Graph

---

## Recommended Diagram Legend

```text
Solid arrow:
Active synchronization flow

Dashed arrow:
Administration or query flow

Cloud icon:
Microsoft Entra ID

Server icon:
On-premises Active Directory
```

---

## Week 01 Directory Structure

```text
Week01-Azure-Identity/
│
├── README.md
│
├── Mission-01-Tenant-and-Entra-ID/
│   ├── README.md
│   ├── Notes.md
│   └── Screenshots/
│
├── Mission-02-Custom-Domain-and-UPN/
│   ├── README.md
│   ├── Notes.md
│   └── Screenshots/
│
├── Mission-03-Entra-Connect-Sync/
│   ├── README.md
│   ├── Notes.md
│   └── Screenshots/
│
├── Mission-04-OU-Filtering-and-Synchronization/
│   ├── README.md
│   ├── Notes.md
│   └── Screenshots/
│
├── Mission-05-Microsoft-Graph-PowerShell/
│   ├── README.md
│   ├── Notes.md
│   ├── Scripts/
│   ├── Reports/
│   └── Screenshots/
│
└── Mission-06-Final-Documentation/
    ├── README.md
    ├── Notes.md
    ├── Diagramme.drawio
    ├── Diagramme.png
    └── Screenshots/
```

---

## Git Commands

Create the branch:

```powershell
git switch main
git pull origin main
git switch -c week01-azure-identity-rebuild
```

Check the current branch:

```powershell
git branch --show-current
```

Add the Week 01 files:

```powershell
git add Labs/Week01-Azure-Identity
```

Check the staged files:

```powershell
git status
```

Create the commit:

```powershell
git commit -m "rebuild Week01 Azure Identity Foundation lab"
```

Push the branch:

```powershell
git push -u origin week01-azure-identity-rebuild
```

After the Pull Request is merged:

```powershell
git switch main
git pull origin main
```

Delete the local branch:

```powershell
git branch -d week01-azure-identity-rebuild
```

Delete the remote branch:

```powershell
git push origin --delete week01-azure-identity-rebuild
```

---

## Documentation Quality Checklist

```text
[ ] README exists for every mission
[ ] Notes exist for every mission
[ ] Commands are formatted correctly
[ ] Screenshots are clearly named
[ ] Diagramme.drawio is included
[ ] Diagramme.png is visible in GitHub
[ ] No secret is committed
[ ] Links between missions work
[ ] All mission statuses are correct
[ ] Main README links to Week 01
```

---

## Security Checklist

Before Git push, verify:

```text
[ ] No password
[ ] No client secret
[ ] No access token
[ ] No private key
[ ] No certificate password
[ ] No production account
[ ] No confidential company information
[ ] No unnecessary personal information
```

Useful Git check:

```powershell
git diff --cached
```

This command displays the content that will be included in the next
commit.

---

## Difficulties Encountered

- Organizing several missions in a consistent structure
- Creating relative links in Markdown
- Exporting a Draw.io diagram with a visible background
- Avoiding duplicate files
- Selecting relevant screenshots
- Protecting sensitive information
- Maintaining a clear Git history

---

## Lessons Learned

- Documentation is part of the technical solution.
- A recruiter should understand the laboratory without opening every file.
- Each mission should contain its own objective, evidence and conclusion.
- Git branches make it possible to isolate and review work.
- Architecture diagrams should remain editable and also be exported as images.

---

## Final Week 01 Skills

```text
Microsoft Entra ID
Active Directory Domain Services
Hybrid Identity
Microsoft Entra Connect Sync
Password Hash Synchronization
OU Filtering
Custom Domains
UPN Configuration
Microsoft Graph PowerShell
PowerShell Reporting
Draw.io
Git
GitHub
Technical Documentation
```

---

## Interview Summary

### Explain the architecture in one minute

The laboratory uses Active Directory Domain Services as the local
identity source. A verified public UPN suffix is configured for the
users. Microsoft Entra Connect Sync synchronizes selected
Organizational Units to Microsoft Entra ID using Password Hash
Synchronization. Cloud identities are queried and audited through
Microsoft Graph PowerShell.

### What was the main security decision?

Only the `Cloud-Sync` Organizational Unit was included in the
synchronization scope to avoid synchronizing unnecessary or privileged
local accounts.

### What was the main operational decision?

Password Hash Synchronization was selected because it provides a
simple and resilient cloud authentication method.