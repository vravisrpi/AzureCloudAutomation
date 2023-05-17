try
{
    "Logging in to Azure..."
    Connect-AzAccount -Identity
}
catch {
    Write-Error -Message $_.Exception
    throw $_.Exception
}

$ResourceGroups ='idp-rg'
Write-Output (" in resource group " + $ResourceGroups)

try
{
  "Downgrading the Plan to B1"
   $app=Set-AzAppServicePlan -Name 'idp-basic' -ResourceGroupName $ResourceGroups  -Tier Basic -WorkerSize Small
   Write-Output ("App SKU currently is " + $app.sku.size)
}

catch {
    Write-Error -Message $_.Exception
    throw $_.Exception
}
