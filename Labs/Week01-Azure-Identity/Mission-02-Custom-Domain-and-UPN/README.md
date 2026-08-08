# Mission 02 - Custom Domain and UPN Configuration

## Objective

The objective of this mission is to configure a custom domain in
Microsoft Entra ID and create a compatible User Principal Name suffix
in the on-premises Active Directory forest.

The laboratory domain used is:

examlabpractice.com

---

## Identity Problem

An Active Directory environment can use a non-routable internal domain
such as:

examlabpractice.local

Users may initially sign in with:

user01@examlabpractice.local

This suffix is not normally suitable for authentication in Microsoft
Entra ID.

A verified public domain is therefore used:

user01@examlabpractice.com

---

## Custom Domain

The domain was added in:

Microsoft Entra ID
→ Custom domain names

Microsoft provided a DNS TXT record used to confirm ownership of the
domain.

After successful verification, the domain became available for
Microsoft Entra users.

---

## UPN Suffix Configuration

The following UPN suffix was added to the local Active Directory
forest:

examlabpractice.com

Configuration location:

Active Directory Domains and Trusts
→ Properties
→ Alternative UPN suffixes

The users were then updated to use the verified suffix.

---

## User Principal Name

Example before modification:

user01@examlabpractice.local

Example after modification:

user01@examlabpractice.com

The User Principal Name is the user sign-in identifier.

It is not necessarily identical to the user's email address.

---

## PowerShell Validation

```powershell
Get-ADForest | Select-Object -ExpandProperty UPNSuffixes
```

```powershell
Get-ADUser -Filter * ` -Properties UserPrincipalName | Select-Object Name, SamAccountName, UserPrincipalName

---

## Validation

| Test | Result |
|---|---|
| Custom domain added to Microsoft Entra ID | Passed |
| DNS TXT record configured | Passed |
| Custom domain verified | Passed |
| Alternative UPN suffix added to AD | Passed |
| Test users updated with the new UPN | Passed |
| User sign-in name verified | Passed |

---

## Skills Demonstrated

- Microsoft Entra custom domains
- DNS TXT verification
- Active Directory UPN configuration
- Hybrid identity preparation
- PowerShell validation
- Identity troubleshooting

---

## Key Lesson

The UPN suffix used by synchronized users should match a domain that
is verified in Microsoft Entra ID.