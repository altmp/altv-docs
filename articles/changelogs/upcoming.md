# 13.0-Release

> [!WARNING]
> This update isn't released yet.

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
> - weapon shoot & weapon change event
> - once method to webview
> - sendPlayerName to disable sending player name from server on connect
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
> ```

## Server

### Added

> [!div class="nohljsln"]
> ```yaml
> - getPedModelInfoByHash method
> - bones info to getVehicleModelInfoByHash method
> - toggleWorldProfiler
> - worldProfiler serverconfig entry
> - playerConnectDenied event
> ```

### Fixed

> [!div class="nohljsln"]
> ```yaml
> - Master server used default interface even if bound to different ip
> - getServerConfig() does not return variable values properly that start with numeric characters
> ```

### <span style="color: red;">Breaking changes</span>

> [!div class="nohljsln"]
> ```yaml
> - attachTo now takes boneid instead of boneindex
> ```

## Server & Client

### Fixed

> [!div class="nohljsln"]
> ```yaml
> - blip route didn't update when setting pos
> - Blips' heading indicator showed as a dollar sign
> ```


## JS Module

### <span style="color: red;">Breaking changes</span>

> [!div class="nohljsln"]
> ```yaml
> - player, blips, vehicles all getter are readonly now (server & client)
> - emitClient & emitClientRaw with null, use emitAllClients & emitAllClientsRaw instead
> ```

## C# Server Module

### <span style="color: red;">Breaking changes</span>

> [!div class="nohljsln"]
> ```yaml
> - IPlayer DiscordId changed type from string to long
> - IConnectionInfo DiscordUserId changed type from string to long
> ```
