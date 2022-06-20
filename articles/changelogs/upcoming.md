# 11.0-Release

> [!WARNING]
> This update isn't released yet.

> [!CAUTION]
> This update contains **breaking changes**, which can potentially break the functionality of your gamemode, please verify and change accordingly.

## Client

### Added

> [!div class="nohljsln"]
> ```yaml
> - weapondata api
> - Save external console position and reapply on every start
> - vehicle lockState, petrolTankHealth getter
> - focusdata api (overrideFocus, clearFocus, focusOverrideEntity, etc)
> - WheelCamber, WheelTrackWidth, WheelHeight, WheelTyreRadius, WheelRimRadius, WheelTyreWidth getter & setter
> ```

### Fixed

> [!div class="nohljsln"]
> ```yaml
> - weapon auto swap flag disabled vehicle weapons
> - playPedAmbientSpeechWithVoiceNative native
> - RMLUI style property
> - "This PC" crashes the game directory selection dialog
> - vehicle gear setter
> ```

## Server

### Added

> [!div class="nohljsln"]
> ```yaml
> - isSpawned getter
> - currentAnimationDict & currentAnimationName getter
> - improved client-files wildcard support in ressource.cfg
> - error message when setting tire smoke color or headlight color without correct mod enabled
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
