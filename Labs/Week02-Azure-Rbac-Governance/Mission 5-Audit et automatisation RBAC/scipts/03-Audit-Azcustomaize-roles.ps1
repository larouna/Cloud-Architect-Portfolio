
#Display custom role
$customRoles = Get-AzRoleDefinition -Custom

$customRoles | Select-Object Name, IsCustom,
                  @{
                      Name = "ActionsCount"
                      Expression = {
                          $_.Actions.Count
                      }
                  },
                  AssignableScopes | Format-Table -AutoSize


#display actions 
$customRoles.Actions