<#
.SYNOPSIS
Installs the Microsoft Graph PowerShell SDK.
#>

$ErrorActionPreference = "Stop"

if (Get-Module -ListAvailable  -Name Microsoft.Graph) 
{
   Write-Host "Microsoft.Graph is already installed."
    exit 0
}

Write-Host "Installing Microsoft Graph PowerShell SDK..."

Install-Module  Microsoft.Graph -Scope CurrentUser -Repository PSGallery  -Force

Write-Host "Microsoft Graph PowerShell installed successfully."