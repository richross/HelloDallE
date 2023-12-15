param location string = resourceGroup().location
param appName string = 'HelloDallE-Philly'
param storageAccountName string = 'hellodallephilly'
param vnetName string = 'DallEWorldVnet'
param subnetName string = 'DallESubnet'
param privateEndpointName string = 'imagestractrross-pe'
// param tableName string = 'questions'

var subnetStorageName = '${subnetName}-storage'
var subnetWebName = '${subnetName}-web'

// create an app service plan for the applications
resource appServicePlan 'Microsoft.Web/serverfarms@2023-01-01' = {
  name: 'MTCApplications'
  location: location
  sku: {
    name: 'S1'
    tier: 'Standard'
  }
  kind: 'linux'
}

resource appService 'Microsoft.Web/sites@2022-09-01' = {
  name: appName
  location: location
  kind: 'app'
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig : {
      netFrameworkVersion: 'v7.0'
      vnetRouteAllEnabled: true
    }
  }
}

// create a virtual network with a subnet for the storage account
resource vnet 'Microsoft.Network/virtualNetworks@2021-02-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
      {
        name: subnetStorageName
        properties: {
          addressPrefix: '10.0.0.0/24'
          serviceEndpoints: [
            {
              service: 'Microsoft.Storage'
              locations: [
                location
              ]
            }
          ]
        }
      }
      {
        name: subnetWebName
        properties: {
          addressPrefix: '10.0.1.0/24'
          serviceEndpoints: [
            {
              service: 'Microsoft.Web'
              locations: [
                location
              ]
            }
          ]
          delegations: [
            {
              name: 'MicrosoftWebServerFarmDelegation'
              properties: {
                serviceName: 'Microsoft.Web/serverFarms'
              }
            }
          ]
        }
      }
    ]
  }
}

// resource that defines a storage account with a private endpoint and connected to the appService resource
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
  properties: {
    accessTier: 'Hot'
    supportsHttpsTrafficOnly: true
    networkAcls: {
      bypass: 'AzureServices'
      defaultAction:'Deny'
      virtualNetworkRules: [
        {
          id: resourceId('Microsoft.Network/virtualNetworks/subnets', vnetName, subnetStorageName)
          action:'Allow'
        }
      ]
    }
    publicNetworkAccess: 'Disabled'
  }
}


module privateEndPointModule 'privateEndpoint.bicep' = {
  name: privateEndpointName
  scope: resourceGroup()
  params: {
    privateEndpointName: privateEndpointName
    location: location
    vnetName: vnetName
    subnetName: subnetStorageName
    serviceId: storageAccount.id
    groupIdArray: ['table']
  }
}

resource appServiceVnetIntegration 'Microsoft.Web/sites/networkConfig@2022-09-01' = {
  name: 'virtualNetwork'
  parent: appService
  properties: {
    subnetResourceId: resourceId('Microsoft.Network/virtualNetworks/subnets', vnetName, subnetWebName)
  }
}
