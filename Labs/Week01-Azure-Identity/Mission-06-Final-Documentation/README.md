

# Mission 06 - Final Documentation and Architecture

## Objective

The objective of this mission is to consolidate the Week 01 laboratory
into a professional portfolio deliverable.

The mission includes:

- Architecture documentation
- Draw.io diagram
- GitHub documentation
- Technical summary
- Skills validation
- Git branch and Pull Request workflow

---

## Final Architecture

![Azure Hybrid Identity Architecture](./Diagramme.png)

The architecture represents the synchronization of on-premises Active
Directory identities to Microsoft Entra ID.

---

## Architecture Components

### On-Premises Environment


Active Directory Domain Services
├── Domain: examlabpractice.com
├── Cloud-Sync Organizational Unit
├── Local-only Organizational Unit
├── Users
└── Security Groups


### Synchronization Layer


Microsoft Entra Connect Sync
├── Password Hash Synchronization
├── Domain and OU filtering
└── Scheduled synchronization


### Microsoft Entra ID

Microsoft Entra Tenant
├── Verified custom domain
├── Synchronized users
├── Cloud-only users
├── Security groups
└── Microsoft Graph administration

---

## Week 01 Missions

| Mission | Topic | Status |
|---|---|---|
| Mission 01 | Tenant and Microsoft Entra ID | Completed |
| Mission 02 | Custom Domain and UPN | Completed |
| Mission 03 | Microsoft Entra Connect Sync | Completed |
| Mission 04 | OU Filtering and Synchronization | Completed |
| Mission 05 | Microsoft Graph PowerShell | Completed |
| Mission 06 | Final Documentation | Completed |

---

## Main Results

The laboratory demonstrates the ability to:

- Identify an Azure tenant and subscription
- Create Cloud-only users
- Create Microsoft Entra security groups
- Verify a custom domain
- Configure an Active Directory UPN suffix
- Install Microsoft Entra Connect Sync
- Enable Password Hash Synchronization
- Filter synchronization by Organizational Unit
- Trigger synchronization with PowerShell
- Query Microsoft Entra ID with Microsoft Graph
- Export identity reports
- Produce an architecture diagram
- Document the laboratory in GitHub

---

## Diagram Files

The mission contains two diagram formats:


Diagramme.drawio
Diagramme.png


`Diagramme.drawio` is the editable source file.

`Diagramme.png` is the image displayed in GitHub.

---

## Security Considerations

The repository must not contain:

- Passwords
- Access tokens
- Application secrets
- Private certificates
- Subscription keys
- Personal information
- Production company information

Screenshots should hide:

- Tenant identifiers when unnecessary
- User personal information
- Email addresses not created for the laboratory
- Subscription identifiers when unnecessary

---

## Git Workflow

The Week 01 reconstruction was completed on a dedicated branch:


week01-azure-identity-rebuild


The branch was pushed to GitHub and integrated through a Pull Request.


## Skills Demonstrated

- Hybrid identity architecture
- Active Directory Domain Services
- Microsoft Entra ID
- Microsoft Entra Connect Sync
- Password Hash Synchronization
- OU filtering
- Microsoft Graph PowerShell
- PowerShell reporting
- Draw.io architecture documentation
- Git and GitHub workflow

---

## Key Lessons

- Active Directory and Microsoft Entra ID have different roles.
- A verified UPN suffix is important for hybrid identities.
- Synchronization scope must be controlled.
- Password synchronization and authentication are separate concepts.
- Microsoft Graph provides modern cloud identity automation.
- Architecture work must include documentation and validation evidence.

---

## Conclusion

Week 01 established the identity foundation required for the Azure
Cloud Architect learning path.

The next learning module focuses on:
Azure RBAC and Governance
