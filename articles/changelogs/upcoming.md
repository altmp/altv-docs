# 13.0-Release

> [!WARNING]
> This update isn't released yet.

## Client

### Added

> [!div class="nohljsln"]
> ```yaml
> - weapondata playerDamageModifier getter & setter
> - isPointOnScreen method
> - vehicle engineOn getter
> - localplayer getWeaponAmmo, weapons, getWeaponComponents getter
> - localplayer hasWeapon method
> - cef getEventListeners method
> ```

### Fixed

> [!div class="nohljsln"]
> ```yaml
> - Connect to server via ipv6 adress
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
> ```