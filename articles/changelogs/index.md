# 16.0.0-Release

## 16.0.153
> [!WARNING]
> This update is the latest.

> [!TIP]
> This update was released on 16.04.2024

### Client
- Compatibility for GTA - Update 3179

### Launcher
- Added cachePath config
- Added auto detection for platform if game path is set
- Updated mirror for china
- Removed skipLauncherPatcher config

## 16.0.147
> [!TIP]
> This update was released on 30.03.2024

### Server
- Added caching for streamed bitsets
- Improved performance of player connect/disconnect events
- Improved performance of dimension checks
- Improved performance and stability of entity streamer
- Improved entity containers
- Improved performance of migration manager
- Improved entity fetch of cell manager
- Improved log of property sync errors
- Improved log of sync limit errors
- Improved alt.getEntitiesInDimension and Alt.GetEntitiesInDimension()
- Fixed colshape manager
- Fixed player to player attach offset
- Fixed default values of wheel getters
- Fixed wheelsCount getter [#2062](https://github.com/altmp/altv-issues/issues/2062)
- Fixed onStreamSyncedMetaChange event [#2231](https://github.com/altmp/altv-issues/issues/2231)
- Fixed order of player bones
- Fixed player to ped attachment
- Fixed ids of ped bones
- Fixed components startup order

### Client
- Added increase for high heel and props drawables from 255 to 4294967296
- Improved internal debug utilities
- Improved remote audio load timeout
- Migrated backup functionality to startup (launcher) to reduce permission related issues
- Added new medal.tv api
- Added runtime size validation
- Added compile time pattern initialization
- Added function to get streamed file name by index
- Fixed missing NULL check in detour functions
- Fixed crash caused by modded vehicles
- Fixed replacement of data files not working
- Fixed log of callstack logging
- Fixed isTalking timeout
- Fixed rml element remove call
- Fixed rml element create call
- Fixed rml element event [#2209](https://github.com/altmp/altv-issues/issues/2209)
- Fixed gameEntityDestroy event [#2236](https://github.com/altmp/altv-issues/issues/2236)
- Fixed static pattern initialization
- Fixed vehicle exit animation reset with clothes, props and hats
- Fixed memory leak in audio outputs
- Fixed weapon damage event
- Fixed game entity create and destroy event for local peds, local objects and local vehicles
- Improved mutex for rmlui
- Improved removal of audio output
- Improved microfreezes

## 16.0.0
> [!TIP]
> This update was released on 12.01.2024

### Server
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


### Client
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

