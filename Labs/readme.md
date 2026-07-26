Marouane el Kamel

https://www.linkedin.com/in/marouane-el-kamel/

# Azure Cloud Architect Portfolio

## Overview

Welcome to my Azure Cloud Architect learning portfolio.

This repository documents my technical progression from Windows,
Citrix and VMware infrastructure administration toward an Azure Cloud
and Hybrid Infrastructure Architect role.

The portfolio contains practical Azure laboratories, architecture
diagrams, PowerShell automation scripts, governance implementations,
technical notes and validation tests.

The main objective is to demonstrate practical cloud architecture
skills rather than certifications alone.

---

## Professional Profile

I am an infrastructure professional with experience in:

- Windows Server administration
- Active Directory Domain Services
- Microsoft Entra ID
- Citrix administration
- VMware virtualization
- PowerShell automation
- Hybrid identity
- Infrastructure troubleshooting
- Enterprise infrastructure operations

My target role is:

> Azure Cloud and Hybrid Infrastructure Architect

My specialization focuses on:

- Microsoft Azure
- Hybrid identity
- Azure governance
- Cloud networking
- Infrastructure as Code
- VMware migration to Azure
- Citrix modernization
- Azure Virtual Desktop
- Cloud security
- Business continuity and disaster recovery

---

## Career Objective

My objective is to design, secure, automate and optimize enterprise
Azure and hybrid cloud environments.

The target architecture profile combines:

```text
Windows Server
      +
Active Directory
      +
VMware
      +
Citrix
      +
Microsoft Azure
      +
Terraform
      +
Cloud Security
```

---

## Learning Path

The portfolio follows this certification and technical roadmap:

| Priority | Certification or Skill | Status |
|---:|---|---|
| 1 | AZ-104 - Azure Administrator Associate | In progress |
| 2 | AZ-305 - Azure Solutions Architect Expert | Planned |
| 3 | HashiCorp Terraform Associate | Planned |
| 4 | AZ-700 - Azure Network Engineer Associate | Planned |
| 5 | SC-300 - Identity and Access Administrator | Planned |
| 6 | AZ-140 - Azure Virtual Desktop Specialty | Planned |
| 7 | Kubernetes and Azure Kubernetes Service | Future |
| 8 | AWS Solutions Architect Associate | Future |

---

## Azure Cloud Architect Learning Plan

| Week | Topic | Status |
|---|---|---|
| Week 01 | Azure Identity Foundation | Completed |
| Week 02 | Azure RBAC and Governance | Completed |
| Week 03 | Azure Virtual Networks and Network Security | Next |
| Week 04 | Azure Virtual Machines and Availability | Planned |
| Week 05 | Azure Storage and Data Protection | Planned |
| Week 06 | Azure Monitoring and Backup | Planned |
| Week 07 | Hybrid Connectivity and VPN | Planned |
| Week 08 | Azure Landing Zone Foundation | Planned |
| Week 09 | Infrastructure as Code with Bicep | Planned |
| Week 10 | Infrastructure as Code with Terraform | Planned |
| Week 11 | CI/CD for Azure Infrastructure | Planned |
| Week 12 | Cloud Architecture Case Study | Planned |

---

## Completed Labs

### Week 01 - Azure Identity Foundation

[Open Week 01 laboratory](./Labs/Week01-Azure-Identity)

The first laboratory focuses on Microsoft identity services and hybrid
identity architecture.

Topics covered:

- Active Directory Domain Services
- Microsoft Entra ID
- Azure tenant concepts
- Custom domain configuration
- Alternative UPN suffix
- Microsoft Entra Connect Sync
- Organizational Unit filtering
- Password Hash Synchronization
- Hybrid user synchronization
- Microsoft Graph PowerShell
- Control Plane and Data Plane
- Identity architecture documentation

Main skills demonstrated:

- Hybrid identity administration
- Active Directory integration
- Microsoft Entra user management
- Identity troubleshooting
- PowerShell administration
- Architecture diagram creation
- Git and GitHub documentation

---

### Week 02 - Azure RBAC and Governance

[Open Week 02 laboratory](./Labs/Week02-Azure-RBAC-Governance)

The second laboratory focuses on Azure access control, governance and
the principle of least privilege.

Topics covered:

- Microsoft Entra security groups
- Azure role-based access control
- RBAC scopes
- Permission inheritance
- Direct and inherited role assignments
- Reader and Contributor roles
- Custom RBAC roles
- Principle of least privilege
- Azure Policy
- Allowed locations policy
- Resource tag inheritance
- Policy remediation
- Resource Locks
- PowerShell RBAC auditing
- CSV audit reports

Main skills demonstrated:

- Azure access management
- Governance implementation
- Custom role creation
- Security auditing
- PowerShell automation
- Scope isolation testing
- Policy compliance validation
- Technical portfolio documentation

---

## Week 02 Architecture

The Week 02 architecture is based on the following access model:

```text
Microsoft Entra Tenant
│
├── GRP-AZ-RBAC-Readers
│   └── Reader at Subscription scope
│
├── GRP-AZ-RBAC-Contributors
│   └── Contributor at Lab Resource Group scope
│
└── GRP-AZ-RBAC-Network-Operators
    └── Custom Lab Network Operator role
        at Lab Resource Group scope
```

Azure resource hierarchy:

```text
Azure Subscription
│
├── Reader role inherited by child resources
│
├── rg-rbac-lab-canadacentral
│   ├── Contributor assignment
│   ├── Lab Network Operator assignment
│   ├── Virtual Network
│   ├── Network Security Group
│   ├── Allowed Locations Policy
│   ├── Environment Tag Policy
│   └── CanNotDelete Resource Lock
│
└── rg-rbac-control-canadacentral
    └── Scope isolation test environment
```

---

## Repository Structure

```text
Cloud-Architect-Portfolio/
│
├── README.md
│
├── Labs/
│   │
│   ├── Week01-Azure-Identity/
│   │   ├── Diagramme.drawio
│   │   ├── Diagramme.png
│   │   ├── Notes.md
│   │   └── README.md
│   │
│   └── Week02-Azure-RBAC-Governance/
│       ├── Diagramme.drawio
│       ├── Diagramme.png
│       ├── Notes.md
│       ├── README.md
│       │
│       ├── Scripts/
│       │   ├── New-LabNetworkOperatorRole.ps1
│       │   └── Export-RbacAudit.ps1
│       │
│       ├── Reports/
│       │   ├── RBAC-Audit-Lab.csv
│       │   ├── RBAC-Privileged-Assignments.csv
│       │   └── RBAC-Custom-Roles.csv
│       │
│       └── Screenshots/
│           ├── 01-rbac-role-assignments.png
│           ├── 02-policy-deny-test.png
│           ├── 03-custom-role.png
│           └── 04-powershell-audit.png
│
└── Projects/
    ├── Azure-Landing-Zone/
    ├── VMware-to-Azure-Migration/
    ├── Citrix-to-AVD-Migration/
    └── Terraform-Azure-Infrastructure/
```

The `Projects` directory will contain the final enterprise architecture
case studies developed later in the learning path.

---

## Technologies and Tools

### Microsoft Azure

- Microsoft Entra ID
- Azure Resource Manager
- Azure RBAC
- Azure Policy
- Azure Resource Groups
- Azure Virtual Networks
- Network Security Groups
- Azure Storage
- Azure Virtual Machines
- Azure Monitor
- Log Analytics
- Azure Backup
- Azure Site Recovery
- Azure Virtual Desktop

### Automation

- PowerShell
- Azure PowerShell
- Microsoft Graph PowerShell
- Azure CLI
- Bicep
- Terraform

### Infrastructure

- Windows Server
- Active Directory Domain Services
- DNS
- Group Policy
- VMware
- Citrix
- Hybrid infrastructure

### Documentation and DevOps

- Git
- GitHub
- Markdown
- Draw.io
- Architecture diagrams
- CSV audit reports
- Visual Studio Code

---

## Laboratory Methodology

Each laboratory follows the same technical methodology:

1. Understand the Azure service or architecture concept.
2. Define the business and technical requirements.
3. Build the environment in Azure.
4. Apply security and governance controls.
5. Test authorized and unauthorized operations.
6. Automate selected operations with PowerShell or Terraform.
7. Document the configuration and test results.
8. Create an architecture diagram.
9. Commit the work to a dedicated Git branch.
10. Merge the completed laboratory into the main branch.

The objective is to reach four levels of competence:

| Level | Description |
|---|---|
| Understanding | Explain the concept clearly |
| Administration | Configure and troubleshoot the service |
| Automation | Deploy or manage it using code |
| Architecture | Select and justify the appropriate solution |

---

## Azure Governance Principles

The laboratories follow these enterprise governance principles.

### Role-based access control

Azure RBAC answers:

> Who can perform an action, what action can be performed and at which scope?

### Azure Policy

Azure Policy answers:

> Which resource configurations are authorized and compliant?

### Resource Locks

Resource Locks answer:

> Which critical resources must be protected against accidental deletion or modification?

### Least privilege

Permissions are assigned:

- To security groups instead of individual users
- At the smallest required scope
- With only the necessary actions
- For the required operational duration
- With regular access reviews

---

## PowerShell Automation

The repository contains PowerShell scripts for Azure administration and
security auditing.

### Custom RBAC role creation

The following script creates a restricted network operator role:

```text
Labs/Week02-Azure-RBAC-Governance/Scripts/
New-LabNetworkOperatorRole.ps1
```

The role allows selected network operations but prevents:

- Network resource deletion
- Virtual machine creation
- Storage account creation
- RBAC role assignment
- Access outside the authorized Resource Group

### RBAC audit report

The following script exports Azure RBAC assignments:

```text
Labs/Week02-Azure-RBAC-Governance/Scripts/
Export-RbacAudit.ps1
```

The generated report includes:

- Principal name
- Principal type
- Azure role
- Assignment scope
- Direct or inherited access origin

---

## Security Practices

This repository follows these security rules:

- No passwords are committed
- No access tokens are committed
- No client secrets are committed
- No storage account keys are committed
- No private certificates are committed
- No sensitive personal information is published
- Test accounts use least-privilege permissions
- Administrative accounts are separated from test accounts
- Destructive commands are tested with `-WhatIf` when possible
- Resource scopes are explicitly specified in automation scripts

---

## Key Achievements

The following capabilities have already been validated:

- Built a hybrid identity laboratory
- Synchronized Active Directory users with Microsoft Entra ID
- Configured Organizational Unit filtering
- Used Microsoft Graph PowerShell
- Implemented Azure RBAC assignments
- Tested permission inheritance
- Validated scope isolation
- Applied Azure Policy restrictions
- Implemented tag governance
- Tested Resource Locks
- Created a custom Azure RBAC role
- Applied the principle of least privilege
- Automated Azure RBAC audits with PowerShell
- Exported governance reports in CSV format
- Created technical architecture diagrams
- Managed laboratory development with Git branches

---

## Planned Enterprise Projects

### Azure Enterprise Landing Zone

The project will include:

- Management Groups
- Multiple Azure subscriptions
- Azure Policy initiatives
- Centralized identity and RBAC
- Hub-and-spoke networking
- Azure Firewall
- Centralized logging
- Defender for Cloud
- Budgets and cost management
- Infrastructure as Code

### VMware to Azure Migration

The project will include:

- Infrastructure discovery
- Dependency analysis
- Azure Migrate
- Workload assessment
- Migration waves
- Target architecture
- Backup strategy
- Disaster recovery strategy
- RTO and RPO
- Rollback planning
- Cost estimation

### Citrix to Azure Virtual Desktop Migration

The project will include:

- Current Citrix architecture assessment
- Azure Virtual Desktop target architecture
- Host pools
- Application groups
- FSLogix profiles
- Autoscaling
- Conditional Access
- User migration strategy
- Security model
- Cost comparison

### Terraform Azure Infrastructure

The project will include:

- Reusable Terraform modules
- Remote state management
- Azure networking
- Identity and RBAC
- Virtual machines
- Storage
- Monitoring
- Security controls
- GitHub Actions deployment pipeline

---

## Next Step

The next laboratory is:

### Week 03 - Azure Virtual Networks and Network Security

Planned topics:

- Azure Virtual Networks
- IPv4 address planning
- Subnets
- Network Security Groups
- Application Security Groups
- Service tags
- User Defined Routes
- VNet peering
- Azure DNS
- Private DNS zones
- Network Watcher
- Network troubleshooting
- Hub-and-spoke architecture

---

## Author

**YOUR-NAME**

Azure Cloud and Hybrid Infrastructure Architect learning path.

Professional focus:

```text
Azure
Windows Server
Active Directory
VMware
Citrix
Terraform
Hybrid Cloud
Cloud Security
```

LinkedIn:

```text
YOUR-LINKEDIN-URL
```

---

## Repository Status

```text
Week 01 - Azure Identity Foundation       Completed
Week 02 - Azure RBAC and Governance       Completed
Week 03 - Azure Networking                Next
Overall learning path                     In progress
```

---

## Disclaimer

This repository contains educational laboratory environments.

Resource names, users, groups, domains and architecture examples may be
created exclusively for training purposes.

No production credentials, secrets or confidential company information
should be stored in this repository.