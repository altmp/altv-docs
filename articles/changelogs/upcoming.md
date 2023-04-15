# 15.0-Release

> [!WARNING]
> This update isn't released yet.

## Client

### Added

> [!div class="nohljsln"]
> ```yaml
> - Modify gamepool size
> - mute loading music
> - DISABLE_VEHICLE_ENGINE_SHUTDOWN_ON_LEAVE flag to keep engines on when leaving a vehicle
> - worldObjectPositionChange event
> - audio, checkpoint, webview all getter
> - audio, webview, httpclien, websocketclient id getter
> - audio, blip remoteid getter
> - worldObjectStreamIn & worldObjectStreamOut event
> - audio filter api
> - colshape api
> ```

### Fixed

> [!div class="nohljsln"]
> ```yaml
> - minimap textures couldn't be replaced
> - ap1_* ytds, vehshare.ytd, hud.ytd, minimap.ytd couldn't be replaced
> - gfx couldn't be replaced
> ```

## Server

### Added

> [!div class="nohljsln"]
> ```yaml
> - unreliable events
> - vehicleHorn event (cancable)
> - vehicleSiren, playerSpawn event
> - getEntitiesInDimension, getEntitiesInRange, getClosestEntities methods
> - support for singleplayer rpf files
> - extend limit to 65.000 entities (players, vehicles, etc.)
> - colshape & blip, voicechannel id getter
> - checkpoint all getter
> - extend resource limit to 4GB
> - added priority, filter getter & setter for voiceserver
> - player playAnimation, clearTasks method
> - streamsyncedmeta for checkpoints
> - vehicle quaternion setter & getter
> - objects Api
> ```

### Fixed

> [!div class="nohljsln"]
> ```yaml
> - Dead body position sync
> - vehicle angular interpolator
> - vehicle flickers when the netowner changes
> ```

## Server & Client
> [!div class="nohljsln"]
> ```yaml
> - getByID & getByRemoteID method for baseobjects
> - getMetaKeys & getSyncedMetaKeys methods
> - ped's Api
> - virtual entitys api
> - markers api
> - isEnteringVehicle, isLeavingVehicle, isOnLadder, isInCover, isInMelee player getter
> - metachange event
> ```

## JS Module

### <span style="color: red;">Breaking changes</span>

> [!div class="nohljsln"]
> ```yaml
> - Removed deprecated null in emitClient & emitClientRaw as target parameter
> ```

### Added
> [!div class="nohljsln"]
> ```yaml
> - (Client) toggleStrictChecks for natives
> - (Server|Client) baseObjectCreate & baseObjectRemove event
> - (Server) Missing maxDistance & isSpatial voicechannel getter
> ```