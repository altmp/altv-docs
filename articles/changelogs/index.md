# 13.0-Release

> [!WARNING]
> This update is the latest.

> [!TIP]
> This update was released on 07.12.2022

## Client

### <span style="color: red;">Breaking changes</span>

> [!div class="nohljsln"]
> ```yaml
> - some natives got renamed
> ```

### Added

> [!div class="nohljsln"]
> ```yaml
> - weapondata playerDamageModifier getter & setter
> - isPointOnScreen method
> - vehicle engineOn, getWheelSurfaceMaterial getter
> - localplayer getWeaponAmmo, weapons, getWeaponComponents getter
> - localplayer hasWeapon method
> - cef getEventListeners method
> - few new natives
> - logDebug to prints custom log if client is in debugmode
> - Object api
> - increased weapon component pool
> - increased decal defs pool (20000-20249 decal ids which copy settings from id 10000)
> - weapon shoot, weapon change, weapondamage event
> - once method to webview
> - dashboard light getters and setters
> ```

### Fixed

> [!div class="nohljsln"]
> ```yaml
> - Connect to server via ipv6 adress
> - resource deps with subfolder clientside
> - memorybuffer method
> - playermodel getter returned new value with a delay
> - clear focus data didn't reset on disconnect
> - some natives didn't return boolean correctly (js clientside)
> - rmlui cursor setting
> ```

## Server

### Added

> [!div class="nohljsln"]
> ```yaml
> - getPedModelInfoByHash method
> - bones info to getVehicleModelInfoByHash method
> - toggleWorldProfiler
> - worldProfiler server config entry
> - playerConnectDenied event
> - sendPlayerNames server config entry to disable sending player name to all clients on connect
> - player sendNames property
> - sendNames parameter to accept method in connection queue (default is true)
> - player dimension change event
> - Warning when DLC resource name not only contain lowercase letters, numbers or "-"/"_" as special character or its not starting with a letter
> - Add pedmodels.bin file to server data
> - scriptMaxSpeed, hybridExtraActive, hybridExtraState, counterMeasureCount, rocketRefuelSpeed properties to vehicle
> - getWeaponCapacity & setWeaponCapacity methods
> - getLocalMetaKeys method
> ```

### Fixed

> [!div class="nohljsln"]
> ```yaml
> - Master server used default interface even if bound to different ip
> - getServerConfig() does not return variable values properly that start with numeric characters
> - server connected to external voice server with --justpack argument
> - setting password during runtime didn't work
> - server crash with invalid carcols.meta
> - server crash when enabling stdconsole without console enabled
> ```

### <span style="color: red;">Breaking changes</span>

> [!div class="nohljsln"]
> ```yaml
> - attachTo now takes boneid instead of boneindex
> - Connection info authToken has a limit of 255 characters
> - config cli argument only works with toml configs now
> ```

## Server & Client

### <span style="color: red;">Breaking changes</span>

> [!div class="nohljsln"]
> ```yaml
> - Automatically change all configurations for Client (alt.cfg/history.servers) to [toml](https://toml.io/en/) format
> - Change all configurations for Server (server.cfg/resource.cfg/stream.cfg) to [toml](https://toml.io/en/) format by using the command line argument "--convert-config-format" on server start
> ```

### Added

> [!div class="nohljsln"]
> ```yaml
> - getSyncedMetaKeys, getStreamSyncedMetaKeys, getMetaKeys methods
> - baseObjectCreate, baseObjectRemove events
> ```

### Fixed

> [!div class="nohljsln"]
> ```yaml
> - blip route didn't update when setting pos
> - Blips' heading indicator showed as a dollar sign
> ```

## JS Module

### Added

> [!div class="nohljsln"]
> ```yaml
> - Utils.inspect (ported util.inspect from NodeJS with small differences)
> - functions & classes in Utils (e.g. drawText3d, loadMapArea, Timeout class, etc.)
> - log, logDebug, logError, logWarning now use alt.Utils.inspect
> - player.spawn(model, pos) overload
> ```

### Fixed
> [!div class="nohljsln"]
> ```yaml
> - HandlingData.handlingNameHash returned wrong hash
> ```

### <span style="color: red;">Breaking changes</span>

> [!div class="nohljsln"]
> ```yaml
> - player, blips, vehicles all getter are readonly now (server & client)
> - emitClient & emitClientRaw with null, use emitAllClients & emitAllClientsRaw instead
> - Worker is deprecated
> ```

## C# Server Module

### <span style="color: red;">Breaking changes</span>

> [!div class="nohljsln"]
> ```yaml
> - IPlayer DiscordId changed type from string to long
> - IConnectionInfo DiscordUserId changed type from string to long
> - By AsyncResource constructor the default of "forceAsyncBaseObjects" is set to "true". To go back to old behavior you need to set "false"
> - Refs were removed (Ref classes, .TryCreateRef etc)
> - ToAsync now returns null when providing async context
> ```

### Changed

> [!div class="nohljsln"]
> ```yaml
> - Async events do not force entities to exist anymore (previously it was guaranteed that if entity exists at async event start, it will exist until async event finishes)
> - ToAsync does not force entity to exist anymore. If base entity will be destroyed, async entity will fallback to cached value (or default for specific type, if caching is disabled)
> ```

### Added
> [!div class="nohljsln"]
> ```yaml
> - After entity is destroyed getters return last available information instead of throwing exception or returning default. This behavior can be reverted by setting "Alt.CacheEntities" to "false"
> - Added ability to configure behavior of handling setter/getter call on non existent entity via "Alt.ThrowIfEntityDoesNotExist". Default value is "false"
> ```

## C# Client Module

### Fixed
> [!div class="nohljsln"]
> ```yaml
> - Func<bool> returned invalid result when invoked if sandboxing is enabled
> ```

### Added
> [!div class="nohljsln"]
> ```yaml
> - AltAsync.WaitFor allows to wait asynchronously for some result. After awaiting the function automatically returns you to main thread
> ```
