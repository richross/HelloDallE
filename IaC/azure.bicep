param location string = 'eastus'
param appName string = 'HelloDallE-App'
param appServicePlanName string = 'app-PromptEngineeringWithDalle-dev'
param storageAccountName string = 'imagesstorageaccountrross'
param vnetName string = 'myvnet'
param subnetName string = 'mysubnet'
param privateEndpointName string = 'myprivateendpoint'
param tableName string = 'questions'

resource appServicePlan 'Microsoft.Web/serverfarms@2022-09-01' existing = {
  name: appServicePlanName
}

resource appService 'Microsoft.Web/sites@2022-09-01' = {
  name: appName
  location: location
  kind: 'app'
  properties: {
    serverFarmId: appServicePlan.id
  }
}

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
  properties: {
    networkAcls: {
      bypass: 'AzureServices'
      defaultAction: 'Deny'
      virtualNetworkRules: [
        {
          id: resourceId('Microsoft.Network/virtualNetworks/subnets', vnetName, subnetName)
          action: 'Allow'
        }
      ]
    }
  }
}

resource privateEndpoint 'Microsoft.Network/privateEndpoints@2023-05-01' = {
  name: privateEndpointName
  location: location
  properties: {
    subnet: {
      id: resourceId('Microsoft.Network/virtualNetworks/subnets', vnetName, subnetName)
    }
    privateLinkServiceConnections: [
      {
        name: 'storageaccount'
        properties: {
          privateLinkServiceId: storageAccount.id
          groupIds: [
            'blob'
          ]
        }
      }
    ]
  }
}

resource table 'Microsoft.Storage/storageAccounts/tableServices@2023-01-01' = {
  name: tableName
  parent: storageAccount
}
