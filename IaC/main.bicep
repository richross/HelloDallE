// params for the main template
param location string = resourceGroup().location

// Call the App Service module passing in the app service plan Id
module appService 'appService.bicep' = {
  name: 'HelloDallE-Philly'
  params: {
    location: location
  }
}
