# 11.0-Release

> [!WARNING]
> This update isn't released yet.

> [!CAUTION]
> This update contains **breaking changes**, which can potentially break the functionality of your gamemode, please verify and change accordingly.

## Client

### Added

> [!div class="nohljsln"]
> ```yaml
> - local currentWeaponRecoil, currentWeaponSpread, currentWeaponDamage, currentWeaponRange getter
> ```

<!-- ### Fixed

> [!div class="nohljsln"]
> ```yaml

> ``` -->

## Server

### Added

> [!div class="nohljsln"]
> ```yaml
> - isSpawned getter
> - currentAnimationDict & currentAnimationName getter
> ```

<!-- ### Fixed

> [!div class="nohljsln"]
> ```yaml
> - blip rotation setter
> ``` -->

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
> ```
