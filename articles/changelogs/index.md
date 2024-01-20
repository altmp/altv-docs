# 16.0.0-Release

> [!WARNING]
> This update is the latest.

> [!TIP]
> This update was released on 20.10.2023

## Server
- Added config `masterlistRelay` to server.toml, its default value is `""`
- Added config `mtu` to server.toml, its default value is `1400`
- Added config `enableSyncedMetaData` to server.toml, its default value is `true`
- Added property `versionMajor` to `ConnectionInfo` to JS-Module and `VersionMajor` to `IConnectionInfo` to C#-Module
- Added property `versionMinor` to `ConnectionInfo` to JS-Module and `VersionMinor` to `IConnectionInfo` to C#-Module
- Added property `modelHash` to `IVehicleModel` to JS-Module and `ModelHash` to `VehicleModelInfo` to C#-Module
- Added property `modelName` to `WeaponModelInfo` to JS-Module
- Added method `setBadge` to `alt.Vehicle` to JS-Module and `setBadge` to `Alt.Vehicle` to c#-Module
- Added class `VehicleBadgePosition` to JS-Module and `VehicleBadgePosition` to C#-Module
- Added event `playerConnectDenied` to JS-Module and `OnPlayerConnectDeniedEvent` in C#-Module
- Added argument `count` to `player.addDecoration` to JS-Module and `count` to `Player.AddDecoration` to C#-Module 
- Deprecated property `build` from `ConnectionInfo` in JS-Module
- Removed property `MajorVersion` from `IConnectionInfo` in C#-Module


## Client
- Added method `alt.getServerTime` to JS-Module and `alt.ServerTime` to C#-Module
- Added method `alt.getPoolSize` to JS-Module and `alt.GetPoolSize` to C#-Module
- Added method `alt.getPoolCount` to JS-Module and `alt.GetPoolCount` to C#-Module
- Added method `alt.getPoolEntities` to JS-Module and `alt.GetPoolEntities` to C#-Module
- Added method `alt.getVoicePlayers` to JS-Module and `alt.GetVoicePlayers` to C#-Module
- Added method `alt.removeVoicePlayer` to JS-Module and `alt.RemoveVoicePlayer` to C#-Module
- Added method `alt.getVoiceSpatialVolume` to JS-Module and `alt.GetVoiceSpatialVolume` to C#-Module
- Added method `alt.setVoiceSpatialVolume` to JS-Module and `alt.SetVoiceSpatialVolume` to C#-Module
- Added method `alt.getVoiceNonSpatialVolume` to JS-Module and `alt.GetVoiceNonSpatialVolume` to C#-Module
- Added method `alt.setVoiceNonSpatialVolume` to JS-Module and `alt.SetVoiceNonSpatialVolume` to C#-Module
- Added method `alt.addVoiceFilter` to JS-Module and `alt.AddVoiceFilter` to C#-Module
- Added method `alt.removeVoiceFilter` to JS-Module and `alt.RemoveVoiceFilter` to C#-Module
- Added method `alt.getVoiceFilter` to JS-Module and `alt.GetVoiceFilter` to C#-Module
- Added method `alt.updateClipContext` to JS-Module and `alt.UpdateClipContext` to C#-Module
- Added method `getSyncInfo` to `Entity` to JS-Module and `SyncInfo` to `IEntity` to C#-Module
- Added method `addVolumeEffect` to `AudioFilter` to JS-Module and `AddVolumeEffect` to `AudioFilter` to C#-Module
- Added class `ISyncInfo` to JS-Module and `SyncInfo` to C#-Module
- Added xml styling support to TextLabel ([more details](https://docs.altv.mp/articles/textlabel.html))

