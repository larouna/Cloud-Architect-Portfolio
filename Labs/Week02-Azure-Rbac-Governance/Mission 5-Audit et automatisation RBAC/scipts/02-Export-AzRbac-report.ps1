
# Import and execute the connection script from the same directory
. "$PSScriptRoot\00-Connect-AzEnvironment.ps1"

# Retrieve the active Azure subscription ID from the current context
$subscriptionId = (Get-AzContext).Subscription.Id

# Construct the full Azure Resource ID scope for the subscription
$subscriptionScope = "/subscriptions/$subscriptionId"

# Define the target Resource Group names
$labResourceGroup = "rg-rbac-lab-canadacentral"
$controlResourceGroup = "rg-rbac-control-canadacentral"

# Construct full Resource ID scopes for both Resource Groups
$labScope = "$subscriptionScope/resourceGroups/$labResourceGroup"
$controlScope = "$subscriptionScope/resourceGroups/$controlResourceGroup"

# Display all effective role assignments for the lab Resource Group (includes both direct and inherited assignments)
Get-AzRoleAssignment -Scope $labScope |  Select-Object DisplayName, SignInName,ObjectType,RoleDefinitionName,Scope | Format-Table -AutoSize

# Display only direct role assignments explicitly granted at this Resource Group scope (-AtScope ignores inherited assignments)
Get-AzRoleAssignment -Scope $labScope -AtScope | Select-Object DisplayName, ObjectType, RoleDefinitionName,Scope | Format-Table -AutoSize

# Fetch all effective role assignments for the lab Resource Group and store them in a variable
$assignments = Get-AzRoleAssignment -Scope $labScope

## Process the assignments and add a calculated property "AccessOrigin" to classify roles as "Direct" or "Inherited"
$rbacAudit = $assignments | Select-Object DisplayName, ObjectType, RoleDefinitionName,
                  @{
                      Name = "AccessOrigin"
                      Expression = {
                          if ($_.Scope -eq $labScope) {
                              "Direct"
                          }
                          else {
                              "Inherited"
                          }
                      }
                  }

# Output the classified audit findings as a clean table in the console
$rbacAudit | Format-Table -AutoSize

# Define the target local file path for exporting the CSV report
$reportPath = "C:\Users\user\Documents\Training\Git\Projects\Cloud-Architect-Portfolio\Labs\Week02-Azure-Rbac-Governance\Mission 5-Audit et automatisation RBAC\reports\RBAC-Audit-Lab.csv"

# Export the audited RBAC data to a UTF-8 encoded CSV file without type information headers
$rbacAudit | Export-Csv -Path $reportPath -NoTypeInformation -Encoding UTF8