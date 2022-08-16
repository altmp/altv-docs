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
> - vehicle engineOn getter
> - localplayer getWeaponAmmo, weapons, getWeaponComponents getter
> - localplayer hasWeapon method
> - cef getEventListeners method
> - few new natives
> - logDebug to prints custom log if client is in debugmode
> - Object api
> - increased weapon component pool
> - eval option to worker
> - weapon shoot event
> ```

### Fixed

> [!div class="nohljsln"]
> ```yaml
> - Connect to server via ipv6 adress
> - resource deps with subfolder clientside
> - memorybuffer method
> - playermodel getter returned new value with a delay
> ```

## Server

### Fixed

> [!div class="nohljsln"]
> ```yaml
> - Master server used default interface even if bound to different ip
> ```

## JS Module

### <span style="color: red;">Breaking changes</span>

> [!div class="nohljsln"]
> ```yaml
> - player, blips, vehicles all getter are readonly now (server & client)
> - emitClient & emitClientRaw with null, use emitAllClients & emitAllClientsRaw instead
> ```