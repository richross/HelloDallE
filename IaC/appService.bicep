param appServicePlanId string
param location string
param appName string = 'HelloDallE-MTCPhilly'
param storageAccountName string = 'imagestractrross'
param vnetName string = 'myvnet'
param subnetName string = 'mysubnet'
param privateEndpointName string = 'myprivateendpoint'
param tableName string = 'questions'

var subnetStorageName = '${subnetName}-storage'
var subnetWebName = '${subnetName}-web'

resource appService 'Microsoft.Web/sites@2022-09-01' = {
  name: appName
  location: location
  kind: 'app'
  properties: {
    serverFarmId: appServicePlanId
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
        name: '${subnetName}-storage'
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
        name: '${subnetName}-web'
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
    networkAcls: {
      bypass: 'AzureServices'
      defaultAction: 'Deny'
      virtualNetworkRules: [
        {
          id: resourceId('Microsoft.Network/virtualNetworks/subnets', vnetName, subnetStorageName)
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
      id: resourceId('Microsoft.Network/virtualNetworks/subnets', vnetName, subnetStorageName)
    }
    privateLinkServiceConnections: [
      {
        name: 'plsConnection'
        properties: {
          privateLinkServiceId: storageAccount.id
          groupIds: ['table']
        }
      }
    ]
  }
}

resource appServiceVnetIntegration 'Microsoft.Web/sites/networkConfig@2022-09-01' = {
  name: 'virtualNetwork'
  parent: appService
  properties: {
    subnetResourceId: vnet.properties.subnets[1].id
  }
}

// resource privateDnsZoneGroup 'Microsoft.Network/privateEndpoints/privateDnsZoneGroups@2023-05-01' = {
//   name: '${privateEndpoint.name}/default'
//   properties: {
//     privateDnsZoneConfigs: [
//       {
//         name: 'config1'
//         properties: {
//           privateDnsZoneId: '/subscriptions/${subscription().subscriptionId}/resourceGroups/${resourceGroup().name}/providers/Microsoft.Network/privateDnsZones/blob.core.windows.net'
//         }
//       }
//     ]
//   }
// }
