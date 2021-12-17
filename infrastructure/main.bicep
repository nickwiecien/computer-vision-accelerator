// Configurable input parameters
@description('The environment suffix to append to resource names.')
param environmentSuffix string = 'ci'

@description('The environment prefix to append to resource names.')
param environmentName string = 'computer-vision'

// Resource names
var acrResourceName = '${environmentName}acr${environmentSuffix}'

// ACR
module azureContainerRegistry 'acr.bicep' = {
  name: 'azureContainerRegistryDeploy'
  params: {
    acrName: acrResourceName
  }
}

output acrName string = azureContainerRegistry.outputs.acrName
output acrLoginServer string = azureContainerRegistry.outputs.acrLoginServer