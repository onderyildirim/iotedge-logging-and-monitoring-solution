# Variables
$AzureRmSubscriptionName = "Onder"
$RgName = "Workbook-Rg-Name"
$workbookDisplayName = "Azure Inventory"
$workbookSourceId = "Azure Monitor"
$workbookType = "workbook"
$templateUri = "https://raw.githubusercontent.com/scautomation/Azure-Inventory-Workbook/master/armTemplate/template.json"
$wbIoTEdgeDeviceDetails = Invoke-RestMethod -Uri "https://raw.githubusercontent.com/microsoft/Application-Insights-Workbooks/master/Workbooks/IoTHub/IoT%20Edge%20device%20details/iotedge-device-details.workbook"
$wbIoTEdgeHealthSnapshot = Invoke-RestMethod -Uri "https://raw.githubusercontent.com/microsoft/Application-Insights-Workbooks/master/Workbooks/IoTHub/IoT%20Edge%20health%20snapshot/iotedge-health-snapshot.workbook"
$wbIoTEdgeFleetView = Invoke-RestMethod -Uri "https://raw.githubusercontent.com/microsoft/Application-Insights-Workbooks/master/Workbooks/IoTHub/IoT%20Edge/iotedge.workbook"
 
## Connectivity
# Login first with Connect-AzAccount if not using Cloud Shell
$AzureRmContext = Get-AzSubscription -SubscriptionName $AzureRmSubscriptionName | Set-AzContext -ErrorAction Stop
Select-AzSubscription -Name $AzureRmSubscriptionName -Context $AzureRmContext -Force -ErrorAction Stop
 
## Action
Write-Host "Deploying : $workbookType-$workbookDisplayName in the resource group : $RgName" -ForegroundColor Cyan
New-AzResourceGroupDeployment -Name $(("$workbookType-$workbookDisplayName").replace(' ', '')) -ResourceGroupName $RgName `
-TemplateUri $TemplateUri `
-workbookDisplayName $workbookDisplayName `
-workbookType $workbookType `
-workbookSourceId $workbookSourceId `
-Confirm -ErrorAction Stop


az group deployment create `
--resource-group MyResourceGroup `
--template-uri "https://raw.githubusercontent.com/scautomation/Azure-Inventory-Workbook/master/armTemplate/template.json" `
--parameters 
