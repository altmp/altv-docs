# 13.0-Release

> [!WARNING]
> This update is the latest.

> [!TIP]
> This update was released on 07.12.2022

> [!div class="nohljsln"]
> ```yaml
> - 13.2:
>    - Fixed client & server crash
> - 13.3:
>    - Fixed more client & server crash related to events
> - 13.4:
>    - Improve event performance
> - 13.5:
>    - Serverside improvements
> - 13.6:
>    - Serverside improvements
> - 13.7:
>    - Serverside improvements
> - 13.8:
>    - Serverside improvements
> - 13.9:
>    - Add more event validations
> - 13.10:
>    - Serverside improvements & crash fix
> - 13.11:
>    - Serverside improvements
> - 13.12:
>    - Fixed death event
> - 13.13:
>    - Serverside improvements
> - 13.14:
>    - Serverside improvements & crash fixes
> - 13.15:
>    - Serverside improvements, vehicle base64 setter & getter improvements, improve weapons & weapons component getter
> - 13.16:
>    - Improve streaming & fix migrations checks
> - 13.17:
>    - Improve vehicle base64 setter & getter
> - 13.18:
>    - Improve blips performance, fix vehicle creation
> - 13.19:
>    - Fix position setter
> - 13.20:
>    - Fix position setter, fix neon getter (js module only)
> - 13.21:
>    - Colshape improvement
>    - Improve vehicle base64 setter
>    - Add checks when serializing entities
> - 13.22:
>    - Improve emits inside disconnect event  (js module only)
>    - Serverside crash fix
> - 13.23:
>    - Serverside crash fix
> - 13.24:
>    - Fixed hasExtra property in getVehicleModelInfoByHash for modded vehicles
>    - Fix server crash
>    - Improve server performance
> - 13.25:
>    - Fixed vehicle extra reading crash for modded vehicles
> - 13.26:
>    - Improve dlc parser crashes
> - 13.27:
>    - Add Support GTA 2802
> - 13.28:
>    - 3d webview crashes
>    - fix ressource loading
> - 13.29:
>    - attachto api
> - 13.30:
>    - fix ressource loading
> - 13.31:
>    - fix ressource loading
> - 13.32:
>    - Revert 13.31
> - 13.33:
>    - fix 3d webviews
> - 13.34:
>    - Fix crashes in scriptById getter
>    - Fix crash in istalking  getter
> - 13.35:
>    - Improve networking
>    - Fix addExplosion native
>    - Small fix for setExtra
> - 13.36:
>    - improve asset loading
>    - Multiple cleanups and improvements
> - 13.37:
>    - Improve caching
> - 13.38:
>    - Disabled mod folder
>    - Fix clear blood damage sync
> - 13.39:
>    - Fix multiple server crash cases
>    - Only one logfile got created clientside
>    - Invalid polys fix was broken after gta update
> ```

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
