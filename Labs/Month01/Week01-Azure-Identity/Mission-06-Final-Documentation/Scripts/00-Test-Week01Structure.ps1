<#
.SYNOPSIS
Validates the expected Week01 portfolio directory structure.
#>

param(
    [Parameter(Mandatory = $false)]
    [string]$WeekRoot = (
        Resolve-Path `
        (Join-Path $PSScriptRoot "..\..")
    ).Path
)

$ErrorActionPreference = "Stop"

$requiredPaths = @(
    "README.md"
    "Notes.md"

    "Mission-01-Tenant-and-Entra-ID\README.md"
    "Mission-01-Tenant-and-Entra-ID\Notes.md"

    "Mission-02-Custom-Domain-and-UPN\README.md"
    "Mission-02-Custom-Domain-and-UPN\Notes.md"

    "Mission-03-Entra-Connect-Sync\README.md"
    "Mission-03-Entra-Connect-Sync\Notes.md"

    "Mission-04-OU-Filtering-and-Synchronization\README.md"
    "Mission-04-OU-Filtering-and-Synchronization\Notes.md"

    "Mission-05-Microsoft-Graph-PowerShell\README.md"
    "Mission-05-Microsoft-Graph-PowerShell\Notes.md"

    "Mission-06-Final-Documentation\README.md"
    "Mission-06-Final-Documentation\Notes.md"

    "Mission-06-Final-Documentation\Diagramme.drawio"
    "Mission-06-Final-Documentation\Diagramme.png"
)

$results = foreach ($relativePath in $requiredPaths) {

    $fullPath = Join-Path $WeekRoot $relativePath
        [PSCustomObject]@{
        Item   = $relativePath
        Exists = Test-Path $fullPath
    }
}

$results | Format-Table -AutoSize

$missing = $results |  Where-Object { -not $_.Exists  }

Write-Host ""

if ($missing) 
{

    Write-Warning "$($missing.Count) required item(s) are missing."

    exit 1
}
else 
{

    Write-Host "Week01 portfolio structure validation: PASSED"
}