param virtualNetworks_myvnet_name string = 'myvnet'
param sites_HelloDallE_MTCPhilly_name string = 'HelloDallE-MTCPhilly'
param privateEndpoints_imagestract_pe_name string = 'imagestract-pe'
param storageAccounts_datastractrrross_name string = 'datastractrrross'
param storageAccounts_imagestractrross_name string = 'imagestractrross'
param configurationStores_dalleconfigurations_name string = 'dalleconfigurations'
param privateDnsZones_privatelink_table_core_windows_net_name string = 'privatelink.table.core.windows.net'
param networkSecurityGroups_myvnet_mysubnet_web_nsg_eastus_name string = 'myvnet-mysubnet-web-nsg-eastus'
param networkSecurityGroups_myvnet_mysubnet_storage_nsg_eastus_name string = 'myvnet-mysubnet-storage-nsg-eastus'
param serverfarms_plan_PromptEngineeringWithDalle_dev_externalid string = '/subscriptions/7f32b33b-24a6-4833-a6ad-9df3b4adbbe7/resourceGroups/rg-PromptEngineeringWithDalle-dev/providers/Microsoft.Web/serverfarms/plan-PromptEngineeringWithDalle-dev'

resource configurationStores_dalleconfigurations_name_resource 'Microsoft.AppConfiguration/configurationStores@2023-03-01' = {
  name: configurationStores_dalleconfigurations_name
  location: 'eastus'
  sku: {
    name: 'standard'
  }
  properties: {
    encryption: {}
    disableLocalAuth: false
    softDeleteRetentionInDays: 1
    enablePurgeProtection: false
  }
}

resource networkSecurityGroups_myvnet_mysubnet_storage_nsg_eastus_name_resource 'Microsoft.Network/networkSecurityGroups@2023-05-01' = {
  name: networkSecurityGroups_myvnet_mysubnet_storage_nsg_eastus_name
  location: 'eastus'
  properties: {
    securityRules: [
      {
        name: 'AllowCorpnet'
        id: networkSecurityGroups_myvnet_mysubnet_storage_nsg_eastus_name_AllowCorpnet.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          description: 'CSS Governance Security Rule.  Allow Corpnet inbound.  https://aka.ms/casg'
          protocol: '*'
          sourcePortRange: '*'
          destinationPortRange: '*'
          sourceAddressPrefix: 'CorpNetPublic'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 2700
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'AllowSAW'
        id: networkSecurityGroups_myvnet_mysubnet_storage_nsg_eastus_name_AllowSAW.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          description: 'CSS Governance Security Rule.  Allow SAW inbound.  https://aka.ms/casg'
          protocol: '*'
          sourcePortRange: '*'
          destinationPortRange: '*'
          sourceAddressPrefix: 'CorpNetSaw'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 2701
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
    ]
  }
}

resource networkSecurityGroups_myvnet_mysubnet_web_nsg_eastus_name_resource 'Microsoft.Network/networkSecurityGroups@2023-05-01' = {
  name: networkSecurityGroups_myvnet_mysubnet_web_nsg_eastus_name
  location: 'eastus'
  properties: {
    securityRules: [
      {
        name: 'AllowCorpnet'
        id: networkSecurityGroups_myvnet_mysubnet_web_nsg_eastus_name_AllowCorpnet.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          description: 'CSS Governance Security Rule.  Allow Corpnet inbound.  https://aka.ms/casg'
          protocol: '*'
          sourcePortRange: '*'
          destinationPortRange: '*'
          sourceAddressPrefix: 'CorpNetPublic'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 2700
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'AllowSAW'
        id: networkSecurityGroups_myvnet_mysubnet_web_nsg_eastus_name_AllowSAW.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          description: 'CSS Governance Security Rule.  Allow SAW inbound.  https://aka.ms/casg'
          protocol: '*'
          sourcePortRange: '*'
          destinationPortRange: '*'
          sourceAddressPrefix: 'CorpNetSaw'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 2701
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
    ]
  }
}

resource privateDnsZones_privatelink_table_core_windows_net_name_resource 'Microsoft.Network/privateDnsZones@2018-09-01' = {
  name: privateDnsZones_privatelink_table_core_windows_net_name
  location: 'global'
  properties: {
    maxNumberOfRecordSets: 25000
    maxNumberOfVirtualNetworkLinks: 1000
    maxNumberOfVirtualNetworkLinksWithRegistration: 100
    numberOfRecordSets: 2
    numberOfVirtualNetworkLinks: 1
    numberOfVirtualNetworkLinksWithRegistration: 0
    provisioningState: 'Succeeded'
  }
}

resource storageAccounts_datastractrrross_name_resource 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccounts_datastractrrross_name
  location: 'eastus'
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
  kind: 'StorageV2'
  properties: {
    dnsEndpointType: 'Standard'
    defaultToOAuthAuthentication: false
    publicNetworkAccess: 'Enabled'
    allowCrossTenantReplication: false
    minimumTlsVersion: 'TLS1_2'
    allowBlobPublicAccess: false
    allowSharedKeyAccess: true
    networkAcls: {
      bypass: 'AzureServices'
      virtualNetworkRules: []
      ipRules: []
      defaultAction: 'Allow'
    }
    supportsHttpsTrafficOnly: true
    encryption: {
      requireInfrastructureEncryption: false
      services: {
        file: {
          keyType: 'Account'
          enabled: true
        }
        blob: {
          keyType: 'Account'
          enabled: true
        }
      }
      keySource: 'Microsoft.Storage'
    }
    accessTier: 'Hot'
  }
}

resource networkSecurityGroups_myvnet_mysubnet_storage_nsg_eastus_name_AllowCorpnet 'Microsoft.Network/networkSecurityGroups/securityRules@2023-05-01' = {
  name: '${networkSecurityGroups_myvnet_mysubnet_storage_nsg_eastus_name}/AllowCorpnet'
  properties: {
    description: 'CSS Governance Security Rule.  Allow Corpnet inbound.  https://aka.ms/casg'
    protocol: '*'
    sourcePortRange: '*'
    destinationPortRange: '*'
    sourceAddressPrefix: 'CorpNetPublic'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 2700
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
  dependsOn: [
    networkSecurityGroups_myvnet_mysubnet_storage_nsg_eastus_name_resource
  ]
}

resource networkSecurityGroups_myvnet_mysubnet_web_nsg_eastus_name_AllowCorpnet 'Microsoft.Network/networkSecurityGroups/securityRules@2023-05-01' = {
  name: '${networkSecurityGroups_myvnet_mysubnet_web_nsg_eastus_name}/AllowCorpnet'
  properties: {
    description: 'CSS Governance Security Rule.  Allow Corpnet inbound.  https://aka.ms/casg'
    protocol: '*'
    sourcePortRange: '*'
    destinationPortRange: '*'
    sourceAddressPrefix: 'CorpNetPublic'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 2700
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
  dependsOn: [
    networkSecurityGroups_myvnet_mysubnet_web_nsg_eastus_name_resource
  ]
}

resource networkSecurityGroups_myvnet_mysubnet_storage_nsg_eastus_name_AllowSAW 'Microsoft.Network/networkSecurityGroups/securityRules@2023-05-01' = {
  name: '${networkSecurityGroups_myvnet_mysubnet_storage_nsg_eastus_name}/AllowSAW'
  properties: {
    description: 'CSS Governance Security Rule.  Allow SAW inbound.  https://aka.ms/casg'
    protocol: '*'
    sourcePortRange: '*'
    destinationPortRange: '*'
    sourceAddressPrefix: 'CorpNetSaw'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 2701
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
  dependsOn: [
    networkSecurityGroups_myvnet_mysubnet_storage_nsg_eastus_name_resource
  ]
}

resource networkSecurityGroups_myvnet_mysubnet_web_nsg_eastus_name_AllowSAW 'Microsoft.Network/networkSecurityGroups/securityRules@2023-05-01' = {
  name: '${networkSecurityGroups_myvnet_mysubnet_web_nsg_eastus_name}/AllowSAW'
  properties: {
    description: 'CSS Governance Security Rule.  Allow SAW inbound.  https://aka.ms/casg'
    protocol: '*'
    sourcePortRange: '*'
    destinationPortRange: '*'
    sourceAddressPrefix: 'CorpNetSaw'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 2701
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
  dependsOn: [
    networkSecurityGroups_myvnet_mysubnet_web_nsg_eastus_name_resource
  ]
}

resource privateDnsZones_privatelink_table_core_windows_net_name_imagestractrross 'Microsoft.Network/privateDnsZones/A@2018-09-01' = {
  parent: privateDnsZones_privatelink_table_core_windows_net_name_resource
  name: 'imagestractrross'
  properties: {
    metadata: {
      creator: 'created by private endpoint imagestract-pe with resource guid bfc0096e-0bd4-4f8f-89e4-a3007557cf79'
    }
    ttl: 10
    aRecords: [
      {
        ipv4Address: '10.0.0.4'
      }
    ]
  }
}

resource Microsoft_Network_privateDnsZones_SOA_privateDnsZones_privatelink_table_core_windows_net_name 'Microsoft.Network/privateDnsZones/SOA@2018-09-01' = {
  parent: privateDnsZones_privatelink_table_core_windows_net_name_resource
  name: '@'
  properties: {
    ttl: 3600
    soaRecord: {
      email: 'azureprivatedns-host.microsoft.com'
      expireTime: 2419200
      host: 'azureprivatedns.net'
      minimumTtl: 10
      refreshTime: 3600
      retryTime: 300
      serialNumber: 1
    }
  }
}

resource storageAccounts_imagestractrross_name_resource 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccounts_imagestractrross_name
  location: 'eastus'
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
  kind: 'StorageV2'
  properties: {
    publicNetworkAccess: 'Disabled'
    routingPreference: {
      routingChoice: 'MicrosoftRouting'
      publishMicrosoftEndpoints: false
      publishInternetEndpoints: false
    }
    minimumTlsVersion: 'TLS1_2'
    allowBlobPublicAccess: false
    networkAcls: {
      resourceAccessRules: []
      bypass: 'None'
      virtualNetworkRules: [
        {
          id: virtualNetworks_myvnet_name_mysubnet_storage.id
          action: 'Allow'
          state: 'Succeeded'
        }
      ]
      ipRules: [
        {
          value: '64.211.197.134'
          action: 'Allow'
        }
        {
          value: '108.16.254.167'
          action: 'Allow'
        }
      ]
      defaultAction: 'Deny'
    }
    supportsHttpsTrafficOnly: true
    encryption: {
      services: {
        file: {
          keyType: 'Account'
          enabled: true
        }
        blob: {
          keyType: 'Account'
          enabled: true
        }
      }
      keySource: 'Microsoft.Storage'
    }
    accessTier: 'Hot'
  }
}

resource storageAccounts_datastractrrross_name_default 'Microsoft.Storage/storageAccounts/blobServices@2023-01-01' = {
  parent: storageAccounts_datastractrrross_name_resource
  name: 'default'
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
  properties: {
    changeFeed: {
      enabled: false
    }
    restorePolicy: {
      enabled: false
    }
    containerDeleteRetentionPolicy: {
      enabled: true
      days: 7
    }
    cors: {
      corsRules: []
    }
    deleteRetentionPolicy: {
      allowPermanentDelete: false
      enabled: true
      days: 7
    }
    isVersioningEnabled: false
  }
}

resource storageAccounts_imagestractrross_name_default 'Microsoft.Storage/storageAccounts/blobServices@2023-01-01' = {
  parent: storageAccounts_imagestractrross_name_resource
  name: 'default'
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
  properties: {
    cors: {
      corsRules: []
    }
    deleteRetentionPolicy: {
      allowPermanentDelete: false
      enabled: false
    }
  }
}

resource Microsoft_Storage_storageAccounts_fileServices_storageAccounts_datastractrrross_name_default 'Microsoft.Storage/storageAccounts/fileServices@2023-01-01' = {
  parent: storageAccounts_datastractrrross_name_resource
  name: 'default'
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
  properties: {
    protocolSettings: {
      smb: {}
    }
    cors: {
      corsRules: []
    }
    shareDeleteRetentionPolicy: {
      enabled: true
      days: 7
    }
  }
}

resource Microsoft_Storage_storageAccounts_fileServices_storageAccounts_imagestractrross_name_default 'Microsoft.Storage/storageAccounts/fileServices@2023-01-01' = {
  parent: storageAccounts_imagestractrross_name_resource
  name: 'default'
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
  properties: {
    protocolSettings: {
      smb: {}
    }
    cors: {
      corsRules: []
    }
    shareDeleteRetentionPolicy: {
      enabled: true
      days: 7
    }
  }
}

resource storageAccounts_imagestractrross_name_storageAccounts_imagestractrross_name_f5d71d91_54f0_4ae3_9349_e9172d2a555d 'Microsoft.Storage/storageAccounts/privateEndpointConnections@2023-01-01' = {
  parent: storageAccounts_imagestractrross_name_resource
  name: '${storageAccounts_imagestractrross_name}.f5d71d91-54f0-4ae3-9349-e9172d2a555d'
  properties: {
    provisioningState: 'Succeeded'
    privateEndpoint: {}
    privateLinkServiceConnectionState: {
      status: 'Approved'
      description: 'Auto-Approved'
      actionRequired: 'None'
    }
  }
}

resource Microsoft_Storage_storageAccounts_queueServices_storageAccounts_datastractrrross_name_default 'Microsoft.Storage/storageAccounts/queueServices@2023-01-01' = {
  parent: storageAccounts_datastractrrross_name_resource
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
  }
}

resource Microsoft_Storage_storageAccounts_queueServices_storageAccounts_imagestractrross_name_default 'Microsoft.Storage/storageAccounts/queueServices@2023-01-01' = {
  parent: storageAccounts_imagestractrross_name_resource
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
  }
}

resource Microsoft_Storage_storageAccounts_tableServices_storageAccounts_datastractrrross_name_default 'Microsoft.Storage/storageAccounts/tableServices@2023-01-01' = {
  parent: storageAccounts_datastractrrross_name_resource
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
  }
}

resource Microsoft_Storage_storageAccounts_tableServices_storageAccounts_imagestractrross_name_default 'Microsoft.Storage/storageAccounts/tableServices@2023-01-01' = {
  parent: storageAccounts_imagestractrross_name_resource
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
  }
}

resource sites_HelloDallE_MTCPhilly_name_resource 'Microsoft.Web/sites@2022-09-01' = {
  name: sites_HelloDallE_MTCPhilly_name
  location: 'East US'
  kind: 'app'
  properties: {
    enabled: true
    hostNameSslStates: [
      {
        name: 'hellodalle-mtcphilly.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Standard'
      }
      {
        name: 'hellodalle-mtcphilly.scm.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Repository'
      }
    ]
    serverFarmId: serverfarms_plan_PromptEngineeringWithDalle_dev_externalid
    reserved: false
    isXenon: false
    hyperV: false
    vnetRouteAllEnabled: true
    vnetImagePullEnabled: false
    vnetContentShareEnabled: false
    siteConfig: {
      numberOfWorkers: 1
      acrUseManagedIdentityCreds: false
      alwaysOn: false
      http20Enabled: false
      functionAppScaleLimit: 0
      minimumElasticInstanceCount: 0
    }
    scmSiteAlsoStopped: false
    clientAffinityEnabled: true
    clientCertEnabled: false
    clientCertMode: 'Required'
    hostNamesDisabled: false
    customDomainVerificationId: 'C837EA0F0F7A3615A193FF1C3C9CC251F74CC8D7289A9889E7E18AE87B503CFA'
    containerSize: 0
    dailyMemoryTimeQuota: 0
    httpsOnly: false
    redundancyMode: 'None'
    storageAccountRequired: false
    virtualNetworkSubnetId: virtualNetworks_myvnet_name_mysubnet_web.id
    keyVaultReferenceIdentity: 'SystemAssigned'
  }
}

resource sites_HelloDallE_MTCPhilly_name_ftp 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2022-09-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: 'ftp'
  location: 'East US'
  properties: {
    allow: false
  }
}

resource sites_HelloDallE_MTCPhilly_name_scm 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2022-09-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: 'scm'
  location: 'East US'
  properties: {
    allow: false
  }
}

resource sites_HelloDallE_MTCPhilly_name_web 'Microsoft.Web/sites/config@2022-09-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: 'web'
  location: 'East US'
  properties: {
    numberOfWorkers: 1
    defaultDocuments: [
      'Default.htm'
      'Default.html'
      'Default.asp'
      'index.htm'
      'index.html'
      'iisstart.htm'
      'default.aspx'
      'index.php'
      'hostingstart.html'
    ]
    netFrameworkVersion: 'v7.0'
    phpVersion: '5.6'
    requestTracingEnabled: false
    remoteDebuggingEnabled: false
    remoteDebuggingVersion: 'VS2019'
    httpLoggingEnabled: false
    acrUseManagedIdentityCreds: false
    logsDirectorySizeLimit: 35
    detailedErrorLoggingEnabled: false
    publishingUsername: '$HelloDallE-MTCPhilly'
    scmType: 'None'
    use32BitWorkerProcess: true
    webSocketsEnabled: false
    alwaysOn: false
    managedPipelineMode: 'Integrated'
    virtualApplications: [
      {
        virtualPath: '/'
        physicalPath: 'site\\wwwroot'
        preloadEnabled: false
      }
    ]
    loadBalancing: 'LeastRequests'
    experiments: {
      rampUpRules: []
    }
    autoHealEnabled: false
    vnetName: '8ab6d37b-6152-43d8-9fdf-d38993732aaf_mysubnet-web'
    vnetRouteAllEnabled: true
    vnetPrivatePortsCount: 0
    localMySqlEnabled: false
    ipSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 2147483647
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 2147483647
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictionsUseMain: false
    http20Enabled: false
    minTlsVersion: '1.2'
    scmMinTlsVersion: '1.2'
    ftpsState: 'FtpsOnly'
    preWarmedInstanceCount: 0
    elasticWebAppScaleLimit: 0
    functionsRuntimeScaleMonitoringEnabled: false
    minimumElasticInstanceCount: 0
    azureStorageAccounts: {}
  }
}

resource sites_HelloDallE_MTCPhilly_name_42b64c48f8844f759d005e2a6124b8d8 'Microsoft.Web/sites/deployments@2022-09-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '42b64c48f8844f759d005e2a6124b8d8'
  location: 'East US'
  properties: {
    status: 4
    author_email: 'N/A'
    author: 'N/A'
    deployer: 'OneDeploy'
    message: 'OneDeploy'
    start_time: '2023-11-22T23:34:52.8156393Z'
    end_time: '2023-11-22T23:35:01.667047Z'
    active: false
  }
}

resource sites_HelloDallE_MTCPhilly_name_5b8310e1b4f7474d93680c45974da14f 'Microsoft.Web/sites/deployments@2022-09-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '5b8310e1b4f7474d93680c45974da14f'
  location: 'East US'
  properties: {
    status: 4
    author_email: 'N/A'
    author: 'N/A'
    deployer: 'OneDeploy'
    message: 'OneDeploy'
    start_time: '2023-11-23T01:36:55.8114033Z'
    end_time: '2023-11-23T01:36:57.7334225Z'
    active: false
  }
}

resource sites_HelloDallE_MTCPhilly_name_81568ccc34554568b4fea63c85ac94d6 'Microsoft.Web/sites/deployments@2022-09-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '81568ccc34554568b4fea63c85ac94d6'
  location: 'East US'
  properties: {
    status: 4
    author_email: 'N/A'
    author: 'N/A'
    deployer: 'OneDeploy'
    message: 'OneDeploy'
    start_time: '2023-11-24T19:13:47.895719Z'
    end_time: '2023-11-24T19:13:55.4240543Z'
    active: true
  }
}

resource sites_HelloDallE_MTCPhilly_name_ac5bea16bd284f4988e0da13c387b81e 'Microsoft.Web/sites/deployments@2022-09-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: 'ac5bea16bd284f4988e0da13c387b81e'
  location: 'East US'
  properties: {
    status: 4
    author_email: 'N/A'
    author: 'N/A'
    deployer: 'OneDeploy'
    message: 'OneDeploy'
    start_time: '2023-11-23T01:46:17.6153524Z'
    end_time: '2023-11-23T01:46:20.0240279Z'
    active: false
  }
}

resource sites_HelloDallE_MTCPhilly_name_ca38b473056d49f194e96365331f5ccc 'Microsoft.Web/sites/deployments@2022-09-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: 'ca38b473056d49f194e96365331f5ccc'
  location: 'East US'
  properties: {
    status: 4
    author_email: 'N/A'
    author: 'N/A'
    deployer: 'OneDeploy'
    message: 'OneDeploy'
    start_time: '2023-11-23T00:03:25.60709Z'
    end_time: '2023-11-23T00:03:27.81348Z'
    active: false
  }
}

resource sites_HelloDallE_MTCPhilly_name_eb281a7853fa4ad2a90bf443e5ee6495 'Microsoft.Web/sites/deployments@2022-09-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: 'eb281a7853fa4ad2a90bf443e5ee6495'
  location: 'East US'
  properties: {
    status: 4
    author_email: 'N/A'
    author: 'N/A'
    deployer: 'OneDeploy'
    message: 'OneDeploy'
    start_time: '2023-11-23T01:19:30.4045351Z'
    end_time: '2023-11-23T01:19:33.4379801Z'
    active: false
  }
}

resource sites_HelloDallE_MTCPhilly_name_sites_HelloDallE_MTCPhilly_name_azurewebsites_net 'Microsoft.Web/sites/hostNameBindings@2022-09-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '${sites_HelloDallE_MTCPhilly_name}.azurewebsites.net'
  location: 'East US'
  properties: {
    siteName: 'HelloDallE-MTCPhilly'
    hostNameType: 'Verified'
  }
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_08T17_17_22_4481618 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-08T17_17_22_4481618'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_09T02_17_24_8435861 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-09T02_17_24_8435861'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_09T11_17_27_2751487 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-09T11_17_27_2751487'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_09T17_17_28_8993867 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-09T17_17_28_8993867'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_09T23_17_30_4671934 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-09T23_17_30_4671934'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_10T11_17_33_7022742 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-10T11_17_33_7022742'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_10T17_17_35_2562940 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-10T17_17_35_2562940'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_10T23_17_36_8776722 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-10T23_17_36_8776722'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_11T11_17_40_8838066 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-11T11_17_40_8838066'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_11T17_17_42_4757614 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-11T17_17_42_4757614'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_12T02_17_44_8741667 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-12T02_17_44_8741667'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_12T09_17_46_7425014 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-12T09_17_46_7425014'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_12T15_17_48_4032988 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-12T15_17_48_4032988'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_13T02_17_51_2946512 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-13T02_17_51_2946512'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_13T09_17_53_1427888 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-13T09_17_53_1427888'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_13T15_17_54_7496129 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-13T15_17_54_7496129'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_14T02_17_57_6584367 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-14T02_17_57_6584367'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_14T08_17_59_2635357 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-14T08_17_59_2635357'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_14T14_18_00_8300586 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-14T14_18_00_8300586'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_14T20_18_02_4280956 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-14T20_18_02_4280956'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_15T02_18_04_0298589 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-15T02_18_04_0298589'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_15T14_18_07_2181542 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-15T14_18_07_2181542'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_15T20_18_08_8266716 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-15T20_18_08_8266716'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_16T02_18_10_4190450 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-16T02_18_10_4190450'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_16T14_18_13_6402996 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-16T14_18_13_6402996'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_16T20_18_15_2337889 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-16T20_18_15_2337889'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_17T02_18_16_8549405 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-17T02_18_16_8549405'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_17T11_18_19_2309456 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-17T11_18_19_2309456'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_17T20_18_21_6174493 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-17T20_18_21_6174493'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_18T02_18_23_2302067 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-18T02_18_23_2302067'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_18T11_18_25_6098506 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-18T11_18_25_6098506'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_18T20_18_27_9797039 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-18T20_18_27_9797039'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_19T02_18_29_5841914 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-19T02_18_29_5841914'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_19T14_18_32_7625115 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-19T14_18_32_7625115'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_19T20_18_34_3609704 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-19T20_18_34_3609704'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_20T02_18_35_9814539 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-20T02_18_35_9814539'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_20T09_18_37_8640728 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-20T09_18_37_8640728'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_20T12_18_38_6765906 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-20T12_18_38_6765906'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_20T15_18_39_4919961 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-20T15_18_39_4919961'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_20T20_18_40_8231113 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-20T20_18_40_8231113'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_20T23_18_41_6128902 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-20T23_18_41_6128902'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_21T02_18_42_4016975 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-21T02_18_42_4016975'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_21T09_18_44_2559432 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-21T09_18_44_2559432'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_21T12_18_45_0613003 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-21T12_18_45_0613003'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_21T15_18_45_8826955 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-21T15_18_45_8826955'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_21T20_18_47_2156444 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-21T20_18_47_2156444'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_21T23_18_48_0343069 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-21T23_18_48_0343069'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_22T02_18_48_8333003 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-22T02_18_48_8333003'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_22T08_18_50_4476610 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-22T08_18_50_4476610'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_22T11_18_51_2969355 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-22T11_18_51_2969355'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_22T14_18_52_0890690 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-22T14_18_52_0890690'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_22T17_18_52_8896705 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-22T17_18_52_8896705'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_22T20_18_53_7027109 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-22T20_18_53_7027109'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_22T23_18_54_4831582 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-22T23_18_54_4831582'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_23T02_18_55_2739810 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-23T02_18_55_2739810'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_23T09_18_57_1479506 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-23T09_18_57_1479506'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_23T12_18_57_9344983 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-23T12_18_57_9344983'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_23T15_18_58_7476790 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-23T15_18_58_7476790'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_23T18_18_59_5599226 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-23T18_18_59_5599226'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_23T23_19_00_8702407 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-23T23_19_00_8702407'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_24T02_19_01_6679458 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-24T02_19_01_6679458'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_24T07_19_03_0095881 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-24T07_19_03_0095881'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_24T10_19_03_8199857 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-24T10_19_03_8199857'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_24T13_19_04_6031439 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-24T13_19_04_6031439'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_24T16_19_05_4013537 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-24T16_19_05_4013537'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_24T19_19_06_2057997 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-24T19_19_06_2057997'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_24T22_19_06_9912153 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-24T22_19_06_9912153'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_25T01_19_07_8050373 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-25T01_19_07_8050373'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_25T04_19_08_6261710 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-25T04_19_08_6261710'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_25T07_19_09_4159433 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-25T07_19_09_4159433'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_25T13_19_11_0199772 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-25T13_19_11_0199772'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_25T16_19_11_8109389 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-25T16_19_11_8109389'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_25T19_19_12_6215175 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-25T19_19_12_6215175'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_25T22_19_13_4120846 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-25T22_19_13_4120846'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_26T01_19_14_2041504 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-26T01_19_14_2041504'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_26T04_19_14_9882604 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-26T04_19_14_9882604'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_26T07_19_15_7944620 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-26T07_19_15_7944620'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_26T13_19_17_4227758 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-26T13_19_17_4227758'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_26T16_19_18_1840348 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-26T16_19_18_1840348'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_26T19_19_18_9993564 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-26T19_19_18_9993564'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_26T22_19_19_7902924 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-26T22_19_19_7902924'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_27T01_19_20_6009158 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-27T01_19_20_6009158'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_27T04_19_21_3988047 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-27T04_19_21_3988047'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_27T07_19_22_2220007 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-27T07_19_22_2220007'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_27T13_19_23_8237536 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-27T13_19_23_8237536'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_27T16_19_24_6481731 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-27T16_19_24_6481731'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_27T19_19_25_4580769 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-27T19_19_25_4580769'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_27T22_19_26_2237425 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-27T22_19_26_2237425'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_28T01_19_27_0269848 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-28T01_19_27_0269848'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_28T04_19_27_8218734 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-28T04_19_27_8218734'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_28T06_40_12_1590903 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-28T06_40_12_1590903'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_28T13_43_18_2778309 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-28T13_43_18_2778309'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_28T16_43_18_4045925 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-28T16_43_18_4045925'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_28T21_43_18_5590564 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-28T21_43_18_5590564'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_29T00_43_18_6658546 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-29T00_43_18_6658546'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_29T03_43_18_7878372 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-29T03_43_18_7878372'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_29T06_43_18_8867025 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-29T06_43_18_8867025'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_29T13_43_19_1242455 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-29T13_43_19_1242455'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_29T16_43_19_2519663 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-29T16_43_19_2519663'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_29T19_43_19_3658684 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-29T19_43_19_3658684'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_29T22_43_19_4634373 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-29T22_43_19_4634373'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_30T03_43_19_6717671 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-30T03_43_19_6717671'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_30T06_43_19_7231365 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-30T06_43_19_7231365'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_30T11_43_19_8896604 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-30T11_43_19_8896604'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_30T12_43_19_8851320 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-30T12_43_19_8851320'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_30T13_43_19_9257283 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-30T13_43_19_9257283'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_30T14_43_19_9613719 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-30T14_43_19_9613719'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_30T15_43_20_0443746 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-30T15_43_20_0443746'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_30T16_43_20_0677449 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-30T16_43_20_0677449'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_30T17_43_20_0941277 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-30T17_43_20_0941277'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_30T18_43_20_1184005 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-30T18_43_20_1184005'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_30T19_43_20_1893317 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-30T19_43_20_1893317'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_30T20_43_20_1814946 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-30T20_43_20_1814946'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_30T21_43_20_2364444 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-30T21_43_20_2364444'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_30T22_43_20_2567078 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-30T22_43_20_2567078'
}

resource sites_HelloDallE_MTCPhilly_name_2023_11_30T23_43_20_2673359 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-11-30T23_43_20_2673359'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_01T00_43_20_3066727 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-01T00_43_20_3066727'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_01T01_43_20_3564437 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-01T01_43_20_3564437'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_01T02_43_20_3781797 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-01T02_43_20_3781797'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_01T03_43_20_3997953 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-01T03_43_20_3997953'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_01T04_43_20_5112084 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-01T04_43_20_5112084'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_01T05_43_20_4817284 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-01T05_43_20_4817284'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_01T06_43_20_5211502 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-01T06_43_20_5211502'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_01T07_43_20_5534069 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-01T07_43_20_5534069'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_01T08_43_20_6061998 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-01T08_43_20_6061998'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_01T09_43_20_6147893 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-01T09_43_20_6147893'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_01T10_43_20_6653462 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-01T10_43_20_6653462'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_01T11_43_20_6779003 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-01T11_43_20_6779003'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_01T12_43_20_7518834 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-01T12_43_20_7518834'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_01T13_43_20_8164071 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-01T13_43_20_8164071'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_01T14_43_20_7820747 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-01T14_43_20_7820747'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_01T15_43_20_8266044 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-01T15_43_20_8266044'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_01T16_43_20_8800833 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-01T16_43_20_8800833'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_01T17_43_20_8878622 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-01T17_43_20_8878622'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_01T18_43_20_9225207 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-01T18_43_20_9225207'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_01T19_43_20_9454210 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-01T19_43_20_9454210'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_01T20_43_21_0237991 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-01T20_43_21_0237991'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_01T21_43_21_0279861 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-01T21_43_21_0279861'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_01T22_43_21_0703153 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-01T22_43_21_0703153'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_01T23_43_21_0883220 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-01T23_43_21_0883220'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_02T00_43_21_1685805 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-02T00_43_21_1685805'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_02T01_43_21_1738579 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-02T01_43_21_1738579'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_02T02_43_21_2132148 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-02T02_43_21_2132148'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_02T03_43_21_2235766 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-02T03_43_21_2235766'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_02T04_43_21_2854246 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-02T04_43_21_2854246'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_02T05_43_21_2785464 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-02T05_43_21_2785464'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_02T06_43_21_3298315 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-02T06_43_21_3298315'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_02T07_43_21_3810298 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-02T07_43_21_3810298'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_02T08_43_21_4049531 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-02T08_43_21_4049531'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_02T09_43_21_4632548 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-02T09_43_21_4632548'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_02T10_43_21_4702200 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-02T10_43_21_4702200'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_02T11_43_21_4707240 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-02T11_43_21_4707240'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_02T12_43_21_5158503 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-02T12_43_21_5158503'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_02T13_43_21_6202846 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-02T13_43_21_6202846'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_02T14_43_21_5815534 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-02T14_43_21_5815534'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_02T15_43_21_6139825 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-02T15_43_21_6139825'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_02T16_43_21_6949408 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-02T16_43_21_6949408'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_02T17_43_21_7160367 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-02T17_43_21_7160367'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_02T18_43_21_7172799 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-02T18_43_21_7172799'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_02T19_43_21_7393606 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-02T19_43_21_7393606'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_02T20_43_21_7797829 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-02T20_43_21_7797829'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_02T21_43_21_8550041 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-02T21_43_21_8550041'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_02T22_43_21_8522735 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-02T22_43_21_8522735'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_02T23_43_21_9007170 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-02T23_43_21_9007170'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_03T00_43_21_9046266 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-03T00_43_21_9046266'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_03T01_43_21_9611304 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-03T01_43_21_9611304'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_03T02_43_21_9689612 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-03T02_43_21_9689612'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_03T03_43_21_9993980 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-03T03_43_21_9993980'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_03T04_43_22_0525672 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-03T04_43_22_0525672'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_03T05_43_22_0788690 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-03T05_43_22_0788690'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_03T06_43_22_0900481 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-03T06_43_22_0900481'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_03T07_43_22_1163172 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-03T07_43_22_1163172'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_03T08_43_22_1492720 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-03T08_43_22_1492720'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_03T09_43_22_5950277 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-03T09_43_22_5950277'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_03T10_43_22_6330428 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-03T10_43_22_6330428'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_03T11_43_22_6480647 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-03T11_43_22_6480647'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_03T12_43_22_6671786 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-03T12_43_22_6671786'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_03T13_43_22_7352683 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-03T13_43_22_7352683'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_03T14_43_22_7310147 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-03T14_43_22_7310147'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_03T15_43_22_8018883 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-03T15_43_22_8018883'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_03T16_43_22_8299594 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-03T16_43_22_8299594'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_03T17_43_22_8681390 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-03T17_43_22_8681390'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_03T18_43_22_9025404 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-03T18_43_22_9025404'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_03T19_43_22_9245622 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-03T19_43_22_9245622'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_03T20_43_22_9666887 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-03T20_43_22_9666887'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_03T21_43_23_0416800 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-03T21_43_23_0416800'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_03T22_43_23_0582172 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-03T22_43_23_0582172'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_03T23_43_23_0585409 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-03T23_43_23_0585409'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_04T00_43_23_1328635 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-04T00_43_23_1328635'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_04T01_43_23_1878573 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-04T01_43_23_1878573'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_04T02_43_23_1839294 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-04T02_43_23_1839294'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_04T03_43_23_2159519 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-04T03_43_23_2159519'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_04T04_43_23_2767068 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-04T04_43_23_2767068'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_04T05_43_23_2971844 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-04T05_43_23_2971844'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_04T06_43_23_3078779 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-04T06_43_23_3078779'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_04T07_43_23_3349664 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-04T07_43_23_3349664'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_04T08_43_23_3883320 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-04T08_43_23_3883320'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_04T09_43_23_4406381 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-04T09_43_23_4406381'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_04T10_43_23_4949419 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-04T10_43_23_4949419'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_04T11_43_23_4861906 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-04T11_43_23_4861906'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_04T12_43_23_5044694 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-04T12_43_23_5044694'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_04T13_43_23_5727021 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-04T13_43_23_5727021'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_04T14_43_23_5806826 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-04T14_43_23_5806826'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_04T15_43_23_6390942 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-04T15_43_23_6390942'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_04T16_43_23_6890861 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-04T16_43_23_6890861'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_04T17_43_23_7245068 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-04T17_43_23_7245068'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_04T18_43_23_7475090 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-04T18_43_23_7475090'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_04T19_43_23_7796268 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-04T19_43_23_7796268'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_04T20_43_23_8159736 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-04T20_43_23_8159736'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_04T21_43_23_9061876 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-04T21_43_23_9061876'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_04T22_43_23_9308941 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-04T22_43_23_9308941'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_04T23_43_23_9493516 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-04T23_43_23_9493516'
}

resource sites_HelloDallE_MTCPhilly_name_2023_12_05T00_43_23_9809856 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '2023-12-05T00_43_23_9809856'
}

resource privateDnsZones_privatelink_table_core_windows_net_name_ozulcsjk7bws2 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2018-09-01' = {
  parent: privateDnsZones_privatelink_table_core_windows_net_name_resource
  name: 'ozulcsjk7bws2'
  location: 'global'
  properties: {
    registrationEnabled: false
    virtualNetwork: {
      id: virtualNetworks_myvnet_name_resource.id
    }
  }
}

resource privateEndpoints_imagestract_pe_name_resource 'Microsoft.Network/privateEndpoints@2023-05-01' = {
  name: privateEndpoints_imagestract_pe_name
  location: 'eastus'
  properties: {
    privateLinkServiceConnections: [
      {
        name: privateEndpoints_imagestract_pe_name
        id: '${privateEndpoints_imagestract_pe_name_resource.id}/privateLinkServiceConnections/${privateEndpoints_imagestract_pe_name}'
        properties: {
          privateLinkServiceId: storageAccounts_imagestractrross_name_resource.id
          groupIds: [
            'table'
          ]
          privateLinkServiceConnectionState: {
            status: 'Approved'
            description: 'Auto-Approved'
            actionsRequired: 'None'
          }
        }
      }
    ]
    manualPrivateLinkServiceConnections: []
    customNetworkInterfaceName: '${privateEndpoints_imagestract_pe_name}-nic'
    subnet: {
      id: virtualNetworks_myvnet_name_mysubnet_storage.id
    }
    ipConfigurations: []
    customDnsConfigs: []
  }
}

resource privateEndpoints_imagestract_pe_name_default 'Microsoft.Network/privateEndpoints/privateDnsZoneGroups@2023-05-01' = {
  name: '${privateEndpoints_imagestract_pe_name}/default'
  properties: {
    privateDnsZoneConfigs: [
      {
        name: 'privatelink-table-core-windows-net'
        properties: {
          privateDnsZoneId: privateDnsZones_privatelink_table_core_windows_net_name_resource.id
        }
      }
    ]
  }
  dependsOn: [
    privateEndpoints_imagestract_pe_name_resource

  ]
}

resource virtualNetworks_myvnet_name_resource 'Microsoft.Network/virtualNetworks@2023-05-01' = {
  name: virtualNetworks_myvnet_name
  location: 'eastus'
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    dhcpOptions: {
      dnsServers: []
    }
    subnets: [
      {
        name: 'mysubnet-storage'
        id: virtualNetworks_myvnet_name_mysubnet_storage.id
        properties: {
          addressPrefix: '10.0.0.0/24'
          networkSecurityGroup: {
            id: networkSecurityGroups_myvnet_mysubnet_storage_nsg_eastus_name_resource.id
          }
          serviceEndpoints: [
            {
              service: 'Microsoft.Storage'
              locations: [
                'eastus'
                'westus'
                'westus3'
              ]
            }
          ]
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
      {
        name: 'mysubnet-web'
        id: virtualNetworks_myvnet_name_mysubnet_web.id
        properties: {
          addressPrefix: '10.0.1.0/24'
          networkSecurityGroup: {
            id: networkSecurityGroups_myvnet_mysubnet_web_nsg_eastus_name_resource.id
          }
          serviceEndpoints: [
            {
              service: 'Microsoft.Web'
              locations: [
                '*'
              ]
            }
          ]
          delegations: [
            {
              name: 'Microsoft.Web.serverFarms'
              id: '${virtualNetworks_myvnet_name_mysubnet_web.id}/delegations/Microsoft.Web.serverFarms'
              properties: {
                serviceName: 'Microsoft.Web/serverFarms'
              }
              type: 'Microsoft.Network/virtualNetworks/subnets/delegations'
            }
          ]
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
    ]
    virtualNetworkPeerings: []
    enableDdosProtection: false
  }
}

resource virtualNetworks_myvnet_name_mysubnet_storage 'Microsoft.Network/virtualNetworks/subnets@2023-05-01' = {
  name: '${virtualNetworks_myvnet_name}/mysubnet-storage'
  properties: {
    addressPrefix: '10.0.0.0/24'
    networkSecurityGroup: {
      id: networkSecurityGroups_myvnet_mysubnet_storage_nsg_eastus_name_resource.id
    }
    serviceEndpoints: [
      {
        service: 'Microsoft.Storage'
        locations: [
          'eastus'
          'westus'
          'westus3'
        ]
      }
    ]
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
  dependsOn: [
    virtualNetworks_myvnet_name_resource

  ]
}

resource virtualNetworks_myvnet_name_mysubnet_web 'Microsoft.Network/virtualNetworks/subnets@2023-05-01' = {
  name: '${virtualNetworks_myvnet_name}/mysubnet-web'
  properties: {
    addressPrefix: '10.0.1.0/24'
    networkSecurityGroup: {
      id: networkSecurityGroups_myvnet_mysubnet_web_nsg_eastus_name_resource.id
    }
    serviceEndpoints: [
      {
        service: 'Microsoft.Web'
        locations: [
          '*'
        ]
      }
    ]
    delegations: [
      {
        name: 'Microsoft.Web.serverFarms'
        id: '${virtualNetworks_myvnet_name_mysubnet_web.id}/delegations/Microsoft.Web.serverFarms'
        properties: {
          serviceName: 'Microsoft.Web/serverFarms'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets/delegations'
      }
    ]
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
  dependsOn: [
    virtualNetworks_myvnet_name_resource

  ]
}

resource storageAccounts_imagestractrross_name_default_test 'Microsoft.Storage/storageAccounts/blobServices/containers@2023-01-01' = {
  parent: storageAccounts_imagestractrross_name_default
  name: 'test'
  properties: {
    immutableStorageWithVersioning: {
      enabled: false
    }
    defaultEncryptionScope: '$account-encryption-key'
    denyEncryptionScopeOverride: false
    publicAccess: 'None'
  }
  dependsOn: [

    storageAccounts_imagestractrross_name_resource
  ]
}

resource storageAccounts_datastractrrross_name_default_questions 'Microsoft.Storage/storageAccounts/tableServices/tables@2023-01-01' = {
  parent: Microsoft_Storage_storageAccounts_tableServices_storageAccounts_datastractrrross_name_default
  name: 'questions'
  properties: {}
  dependsOn: [

    storageAccounts_datastractrrross_name_resource
  ]
}

resource storageAccounts_imagestractrross_name_default_questions 'Microsoft.Storage/storageAccounts/tableServices/tables@2023-01-01' = {
  parent: Microsoft_Storage_storageAccounts_tableServices_storageAccounts_imagestractrross_name_default
  name: 'questions'
  properties: {}
  dependsOn: [

    storageAccounts_imagestractrross_name_resource
  ]
}

resource sites_HelloDallE_MTCPhilly_name_8ab6d37b_6152_43d8_9fdf_d38993732aaf_mysubnet_web 'Microsoft.Web/sites/virtualNetworkConnections@2022-09-01' = {
  parent: sites_HelloDallE_MTCPhilly_name_resource
  name: '8ab6d37b-6152-43d8-9fdf-d38993732aaf_mysubnet-web'
  location: 'East US'
  properties: {
    vnetResourceId: virtualNetworks_myvnet_name_mysubnet_web.id
    isSwift: true
  }
}