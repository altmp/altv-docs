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
> ```

### Fixed

> [!div class="nohljsln"]
> ```yaml
> - weapon auto swap flag disabled vehicle weapons
> - playPedAmbientSpeechWithVoiceNative native
> - RMLUI style property
> ```

## Server

### Added

> [!div class="nohljsln"]
> ```yaml
> - isSpawned getter
> - currentAnimationDict & currentAnimationName getter
> - improved client-files wildcard support in ressource.cfg
> ```

### Fixed

> [!div class="nohljsln"]
> ```yaml
> - Fix frozen and collision setter
> - Bicycles don't work sometimes
> - Size property doesn't work for areablip
> - playAmbientSpeech method
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
