
<#
.SYNOPSIS
Performs basic prerequisite checks for Microsoft Entra Connect Sync.
#>

$ErrorActionPreference = "Continue"

Write-Host ""
Write-Host "===== ENTRA CONNECT PREREQUISITES ====="
Write-Host ""

# Active Directory module
if (Get-Module -ListAvailable -Name ActiveDirectory) 
{
    Write-Host "[PASS] ActiveDirectory module available."
}
else 
{
    Write-Warning "[FAIL] ActiveDirectory module not found."
}

# Domain membership
try 
{

    $domain = Get-ADDomain

    Write-Host "[PASS] Active Directory domain detected:"
    Write-Host "       $($domain.DNSRoot)"
}
catch 
{
    Write-Warning "[FAIL] Unable to query Active Directory."
}

# Domain secure channel
try {

    $secureChannel = Test-ComputerSecureChannel

    if ($secureChannel) {
        Write-Host "[PASS] Domain secure channel is healthy."
    }
    else {
        Write-Warning "[FAIL] Domain secure channel problem."
    }
}
catch {
    Write-Warning "Unable to test secure channel."
}

# DNS
try {

    Resolve-DnsName login.microsoftonline.com `
        -ErrorAction Stop |
        Out-Null

    Write-Host "[PASS] Microsoft DNS resolution works."
}
catch {
    Write-Warning "[FAIL] DNS resolution failed."
}

# HTTPS connectivity
$https = Test-NetConnection `
    login.microsoftonline.com `
    -Port 443 `
    -WarningAction SilentlyContinue

if ($https.TcpTestSucceeded) {
    Write-Host "[PASS] HTTPS connectivity to Microsoft available."
}
else {
    Write-Warning "[FAIL] TCP 443 connectivity problem."
}

# ADSync module
if (Get-Module -ListAvailable -Name ADSync) {
    Write-Host "[PASS] ADSync module installed."
}
else {
    Write-Warning "[INFO] ADSync module not detected."
}

Write-Host ""
Write-Host "Prerequisite check completed."