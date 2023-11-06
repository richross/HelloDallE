targetScope = 'subscription'

// params for the main template
param appServicePlanName string = 'plan-PromptEngineeringWithDalle-dev'
param appServiceLocation string = 'eastus'


// Access existing resource group of the app service plan
resource resourceGroup 'Microsoft.Resources/resourceGroups@2023-07-01' existing = {
  name: 'rg-PromptEngineeringWithDalle-dev'
}

// Access existing app service plan
resource appServicePlan 'Microsoft.Web/serverfarms@2022-09-01' existing = {
  name: appServicePlanName
  scope: resourceGroup
}

// create the resource group for the app service
resource appServiceResourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg-PromptEngineeringWithDalle-dev-appService'
  location: appServiceLocation
}

// Call the App Service module passing in the app service plan Id
module appService 'appService.bicep' = {
  name: 'appService'
  scope: appServiceResourceGroup
  params: {
    appServicePlanId: appServicePlan.id
    location: appServiceLocation
  }
}
