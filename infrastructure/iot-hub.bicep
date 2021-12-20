@minLength(3)
@maxLength(32)
param environmentName string = 'myprj'
param environmentSuffix string = 'ci'
param location string = resourceGroup().location
param iotHubSkuName string = 'S1'
param iotHubSkuCapacity int = 1
var iotHubName = '${environmentName}-${environmentSuffix}'

resource iotHubResource 'Microsoft.Devices/IotHubs@2020-08-01' = {
  name: iotHubName
  location: location
  sku: {
    name: iotHubSkuName
    capacity: iotHubSkuCapacity
  }
  properties: {
    authorizationPolicies: [
      {
        keyName: 'iothubowner'
        rights: 'RegistryWrite, ServiceConnect, DeviceConnect'
      }
      {
        keyName: 'service'
        rights: 'ServiceConnect'
      }
      {
        keyName: 'device'
        rights: 'DeviceConnect'
      }
      {
        keyName: 'registryRead'
        rights: 'RegistryRead'
      }
      {
        keyName: 'registryReadWrite'
        rights: 'RegistryWrite'
      }
      {
        keyName: 'deviceupdateservice'
        rights: 'RegistryRead, ServiceConnect, DeviceConnect'
      }
    ]
  }
}
