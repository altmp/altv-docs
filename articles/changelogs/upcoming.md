# 11.0-Release

> [!WARNING]
> This update isn't released yet.

## Client

### Added

> [!div class="nohljsln"]
> ```yaml
> - weapondata api (https://docs.altv.mp/js/api/alt-client.WeaponData.html)
> - Save external console position and reapply on every start
> - vehicle lockState, petrolTankHealth getter
> - focusdata api (overrideFocus, clearFocus, focusOverrideEntity, etc)
> - WheelCamber, WheelTrackWidth, WheelHeight, WheelTyreRadius, WheelRimRadius, WheelTyreWidth, fuelLevel, engineTemperature, oilLevel getter & setter
> - persistent localstorage for early auth
> - loadDefaultIpls method
> ```

### Fixed

> [!div class="nohljsln"]
> ```yaml
> - weapon auto swap flag disabled vehicle weapons
> - playPedAmbientSpeechWithVoiceNative native
> - RMLUI style property
> - "This PC" crashes the game directory selection dialog
> - vehicle gear setter
> - permission dialog for optional permissions
> ```

## Server

### Added

> [!div class="nohljsln"]
> ```yaml
> - isSpawned getter
> - currentAnimationDict & currentAnimationName getter
> - improved client-files wildcard support in ressource.cfg
> - autoenable headlightcolor mod if headlightColor setter is used
> - autoenable tireSmokeColor mod if tireSmokeColor setter is used
> - allow installation in appdata folder
> ```

### Fixed

> [!div class="nohljsln"]
> ```yaml
> - Fix frozen and collision setter
> - Bicycles don't work sometimes
> - Size property doesn't work for areablip
> - playAmbientSpeech method
> - removed clothing & appearance missmatch message
> ```

## Server & Client

### Added

> [!div class="nohljsln"]
> ```yaml
> - animationChange event
> ```

## JS Module

> [!div class="nohljsln"]
> ```yaml
> - Updated nodeJS launch options to support native ECMAScript module loader by default (removed experimental loader warning)
>   → The js-module automatically detects esm files if one of the described cases are fullfilled, see: https://nodejs.org/docs/latest-v17.x/api/esm.html#enabling
> - Added extra-cli-args to server.cfg
> ```
