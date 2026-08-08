# Mission 02 - Notes

## Custom Domain

Every Microsoft Entra tenant contains an initial domain:
tenantname.onmicrosoft.com
```

A company usually adds its public domain so users can sign in with a
professional identity.

Example:

firstname.lastname@examlabpractice.com

---

## Domain Verification

Microsoft Entra ID requires proof that the organization owns the
custom domain.

The verification normally uses a DNS TXT record.

Example structure:

Record type : TXT
Host        : @
Value       : MS=msXXXXXXXX
TTL         : Default

The exact value is provided by Microsoft Entra ID.

No password, token or private key is required for domain verification.

---

## User Principal Name

The UPN has the following format:

username@upn-suffix

Example:

clouduser01@examlabpractice.com

The UPN is commonly used for authentication.

It contains:

- A prefix
- The `@` character
- A suffix

---

## UPN Versus Email Address

The UPN is an authentication identifier.

The email address is used for messaging.

They can be identical, but they are separate attributes.

Example:

UPN:
john.smith@examlabpractice.com

Email:
john.smith@examlabpractice.com

Another possible configuration:

UPN:
jsmith@examlabpractice.com

Email:
john.smith@examlabpractice.com

---

## Alternative UPN Suffix

An Active Directory forest can use an internal domain such as:

corp.local

The company can add a routable suffix:

examlabpractice.com

The alternative suffix does not rename the Active Directory domain.

It only provides another sign-in suffix for users.

---

## Configuration Steps

1. Open Microsoft Entra ID.
2. Open Custom domain names.
3. Add `examlabpractice.com`.
4. Copy the DNS TXT record.
5. Create the TXT record at the DNS provider.
6. Return to Microsoft Entra ID.
7. Verify the domain.
8. Open Active Directory Domains and Trusts.
9. Open Properties.
10. Add the alternative UPN suffix.
11. Modify the UPN of the test users.
12. Validate with PowerShell.

---

## PowerShell Commands

Display the UPN suffixes configured in the forest:

```powershell
Get-ADForest |
    Select-Object ForestMode,
                  RootDomain,
                  UPNSuffixes
```

Display users and their UPN:

```powershell
Get-ADUser -Filter * ` -Properties UserPrincipalName | Select-Object Name, SamAccountName, UserPrincipalName

Update a user UPN:

```powershell
Set-ADUser `-Identity "user01"  -UserPrincipalName "user01@examlabpractice.com"

---

## Common Problems

### Domain remains unverified

Possible causes:

- Incorrect TXT value
- DNS propagation delay
- TXT record created in the wrong DNS zone
- Additional quotation marks
- Incorrect host value

### New suffix does not appear in Active Directory Users and Computers

Possible causes:

- The suffix was not saved
- The console needs to be refreshed
- The wrong forest was modified

### User is synchronized with an `onmicrosoft.com` UPN

Possible causes:

- Local suffix is not verified in Microsoft Entra ID
- Entra Connect synchronization occurred before the UPN update
- The user still uses a non-routable suffix

---

## Difficulties Encountered

- Understanding the difference between the AD DNS domain and UPN suffix
- Correctly configuring the DNS TXT record
- Waiting for DNS propagation
- Updating existing user UPN values
- Understanding that the UPN is not necessarily the email address

---

## Lessons Learned

- A custom domain must be verified before it can be used in Entra.
- The UPN suffix does not rename the Active Directory domain.
- A compatible UPN simplifies hybrid authentication.
- DNS configuration is an important dependency of hybrid identity.

---

## Interview Questions

### Why configure an alternative UPN suffix?

To give Active Directory users a sign-in name that uses a verified and
routable Microsoft Entra domain.

### Does adding a UPN suffix rename the Active Directory domain?

No. It only adds an alternative suffix for user sign-in names.

### What record is commonly used to verify a Microsoft Entra domain?

A DNS TXT record.

### Is the UPN always the same as the email address?

No. They are separate attributes, although organizations often use
the same value for both.