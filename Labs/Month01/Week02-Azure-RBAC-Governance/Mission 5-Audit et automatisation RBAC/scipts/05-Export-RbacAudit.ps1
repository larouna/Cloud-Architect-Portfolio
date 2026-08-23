

<#
Ce script PowerShell est un outil d'audit automatique des accès Azure RBAC (Role-Based Access Control) pour un Resource Group spécifique.
Voici ce qu'il fait en 5 étapes clés :
1-Gestion des paramètres : 
Il accepte le nom d'un Resource Group et un dossier de destination (avec des valeurs par défaut).

2-Vérification de la connexion : 
Il s'assure qu'une session Azure est active, sinon il demande à l'utilisateur de se connecter (Connect-AzAccount).

3-Analyse des attributions RBAC : 
Il récupère la liste de toutes les personnes ou groupes ayant des accès sur le Resource Group.

4-Calcul de l'origine de l'accès (AccessOrigin) : 
Il calcule automatiquement si chaque droit est attribué directement sur le Resource Group ou s'il est hérité depuis un niveau supérieur (la Souscription).

5-Génération d'un rapport CSV horodaté : 
Il crée le dossier de destination si nécessaire et enregistre les résultats sous la forme d'un fichier CSV unique incluant la date et l'heure (ex: RBAC-Audit-20260726-143000.csv).
#>>

# Declare script input parameters with optional/default values
param(
    [Parameter(Mandatory = $false)]
    [string]$ResourceGroupName = "rg-rbac-lab-canadacentral",

    # Output folder path for generated reports (defaults to a relative '.\Reports' directory)
    [Parameter(Mandatory = $false)]
    [string]$OutputDirectory = ".\Reports"
)

# Enforce strict coding rules (catches uninitialized variables, invalid properties, etc.)
Set-StrictMode -Version Latest

# Stop script execution immediately if any unhandled error occurs
$ErrorActionPreference = "Stop"

# Retrieve current Azure context to check if an active connection exists
$context = Get-AzContext

# If no active context is found, prompt the user to authenticate to Azure
if (-not $context) 
{
    Connect-AzAccount
    $context = Get-AzContext
}

# Extract Subscription ID and construct the Resource ID scopes
$subscriptionId = $context.Subscription.Id
$subscriptionScope = "/subscriptions/$subscriptionId"
$resourceGroupScope = "$subscriptionScope/resourceGroups/$ResourceGroupName"

# Ensure the output directory exists (creates it if missing, silently suppresses output)
 New-Item  -ItemType Directory -Path $OutputDirectory -Force | Out-Null

# Retrieve all effective role assignments for the specified Resource Group scope
 $assignments = Get-AzRoleAssignment -Scope $resourceGroupScope

# Process assignments and append a calculated column "AccessOrigin" (Direct vs Inherited) 
$report = $assignments | Select-Object DisplayName, SignInName, ObjectType, RoleDefinitionName, Scope,
                  @{
                      Name = "AccessOrigin"
                      Expression = {
                          if ($_.Scope -eq $resourceGroupScope) {
                              "Direct"
                          }
                          else {
                              "Inherited"
                          }
                      }
                  }

# Generate a timestamp string in "YYYYMMDD-HHMMSS" format for unique file naming
$timestamp = Get-Date -Format "yyyyMMdd-HHmmss"

# Combine the output folder path and the dynamic report file name safely
$reportPath = Join-Path -Path $OutputDirectory -ChildPath "RBAC-Audit-$timestamp.csv"

# Export the audited RBAC data to a CSV file formatted in UTF-8
$report | Export-Csv -Path $reportPath -NoTypeInformation  -Encoding UTF8

# Display confirmation message with the absolute or relative path of the created CSV report
Write-Host "Rapport RBAC créé : $reportPath"