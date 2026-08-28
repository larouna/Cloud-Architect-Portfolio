
<#
.SYNOPSIS
Displays subscribed Microsoft cloud licenses.
#>

$ErrorActionPreference = "Stop"

if (-not (Get-MgContext)) 
{
    throw "Not connected to Microsoft Graph."
}

Get-MgSubscribedSku |
    Select-Object SkuPartNumber,
                  SkuId,
                  ConsumedUnits,
                  @{
                      Name = "EnabledUnits"
                      Expression = {
                          $_.PrepaidUnits.Enabled
                      }
                  } |
    Sort-Object SkuPartNumber |
    Format-Table -AutoSize