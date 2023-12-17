param privateEndpointName string
param location string
param vnetName string
param vnetId string
param subnetName string
param serviceId string
param groupIdArray string[]



//create a private endpoint for the provided resource
resource privateEndpoint 'Microsoft.Network/privateEndpoints@2023-05-01' = {
  name: privateEndpointName
  location: location
  properties: {
    subnet: {
      id: resourceId('Microsoft.Network/virtualNetworks/subnets', vnetName, subnetName)
    }
    customNetworkInterfaceName: '${privateEndpointName}-nic'
    privateLinkServiceConnections: [
      {
        name: 'privateLinkServiceConnection'
        properties: {
          privateLinkServiceId: serviceId
          groupIds: groupIdArray
        }
      }
    ]
  }
}

//create a private DNS zone for the provided resource
resource privateDNSZone 'Microsoft.Network/privateDnsZones@2020-06-01' = {
  name: 'privatelink.table.core.windows.net'
  location: 'global'
  dependsOn: [
    privateEndpoint
  ]
}

//create the private DNS zone group for the provided resource
resource privateDnsZoneGroup 'Microsoft.Network/privateEndpoints/privateDnsZoneGroups@2023-05-01' = {
  name: '${privateEndpointName}-dnszonegroup'
  parent: privateEndpoint
  properties: {
    privateDnsZoneConfigs: [
      {
        name: 'privateDnsZoneConfig'
        properties: {
          privateDnsZoneId: privateDNSZone.id
        }
      }
    ]
  }
}

//this was done manually in the portal, but the code was pulled from the 428828 installation 
resource privateDnsZones_virtualNetworkLink 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2018-09-01' = {
  parent: privateDNSZone
  name: 'foeiwjfoeqf'
  location: 'global'
  properties: {
    registrationEnabled: false
    virtualNetwork: {
      id: vnetId
    }
  }
}
