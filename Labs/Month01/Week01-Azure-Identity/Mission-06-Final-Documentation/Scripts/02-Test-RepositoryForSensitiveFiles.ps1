
<#
.SYNOPSIS
Performs a basic check for potentially sensitive files and content.

.DESCRIPTION
This is a basic portfolio safety check.
It does not replace a dedicated secret scanning solution.
#>

param(
    [Parameter(Mandatory = $false)]
    [string]$RepositoryRoot = (
        Resolve-Path `
        (Join-Path $PSScriptRoot "..\..\..\..")
    ).Path
)

$ErrorActionPreference = "Stop"

Write-Host ""
Write-Host "===== SENSITIVE FILE CHECK ====="
Write-Host ""

$sensitiveExtensions = @(
    ".pfx"
    ".p12"
    ".key"
    ".pem"
)

$sensitiveNames = @(
    ".env"
    "credentials.json"
    "secrets.json"
)

$fileAlerts = Get-ChildItem `
    -Path $RepositoryRoot `
    -File `
    -Recurse `
    -ErrorAction SilentlyContinue |
    Where-Object {

        $_.FullName -notmatch "\\.git\\" -and
        (
            $_.Extension -in $sensitiveExtensions -or
            $_.Name -in $sensitiveNames
        )
    }

if ($fileAlerts) {

    Write-Warning "Potentially sensitive files detected:"

    $fileAlerts |
        Select-Object FullName |
        Format-Table -AutoSize
}
else {

    Write-Host "[PASS] No obvious sensitive file types detected."
}

Write-Host ""
Write-Host "===== BASIC CONTENT CHECK ====="
Write-Host ""

$textExtensions = @(
    ".ps1"
    ".md"
    ".txt"
    ".json"
    ".csv"
    ".yml"
    ".yaml"
)

$patterns = @(
    'client[_-]?secret\s*[:=]\s*["''][^"'']+'
    'password\s*[:=]\s*["''][^"'']+'
    'access[_-]?token\s*[:=]\s*["''][^"'']+'
    'AccountKey\s*=\s*[^;]+'
)

$contentAlerts = @()

$files = Get-ChildItem `
    -Path $RepositoryRoot `
    -File `
    -Recurse |
    Where-Object {

        $_.FullName -notmatch "\\.git\\" -and
        $_.Extension -in $textExtensions
    }

foreach ($file in $files) {

    foreach ($pattern in $patterns) {

        $match = Select-String `
            -Path $file.FullName `
            -Pattern $pattern `
            -ErrorAction SilentlyContinue

        if ($match) {

            $contentAlerts += [PSCustomObject]@{
                File    = $file.FullName
                Pattern = $pattern
            }
        }
    }
}

if ($contentAlerts) {

    Write-Warning "Potential secret-like content detected."

    $contentAlerts |
        Select-Object File,
                      Pattern `
        -Unique |
        Format-Table -AutoSize
}
else {

    Write-Host "[PASS] No obvious secret assignments detected."
}

Write-Host ""
Write-Host "Review staged Git changes manually with:"
Write-Host "git diff --cached"