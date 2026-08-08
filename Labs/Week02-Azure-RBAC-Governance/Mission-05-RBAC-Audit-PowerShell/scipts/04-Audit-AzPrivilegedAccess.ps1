
#Partie 3 — Identifier les permissions larges

# Import and execute the connection script from the same directory
. "$PSScriptRoot\00-Connect-AzEnvironment.ps1"

# Define an array of high-privilege Azure RBAC role names to audit
$privilegedRoleNames = @(
    "Owner",
    "Contributor",
    "User Access Administrator",
    "Role Based Access Control Administrator"
)

# Retrieve all role assignments across the subscription and filter for the privileged roles
$privilegedAssignments = Get-AzRoleAssignment |  Where-Object {$_.RoleDefinitionName -in $privilegedRoleNames} |
    Select-Object DisplayName,
                  ObjectType,
                  RoleDefinitionName,
                  Scope

# Display the privileged role assignments in a formatted console table
$privilegedAssignments |  Format-Table -AutoSize

# Define the target local file path for exporting the CSV report
$privilegedReportPath = "C:\Users\user\Documents\Training\Git\Projects\Cloud-Architect-Portfolio\Labs\Week02-Azure-Rbac-Governance\Mission 5-Audit et automatisation RBAC\reports\RBAC-Privileged-Assignments.csv"

# Export the filtered privileged assignments to a UTF-8 encoded CSV file
$privilegedAssignments |
    Export-Csv `
        -Path $privilegedReportPath `
        -NoTypeInformation `
        -Encoding UTF8