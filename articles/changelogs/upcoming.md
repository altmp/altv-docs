# 15.0-Release

> [!WARNING]
> This update isn't released yet.

## Client

### <span style="color: red;">Breaking changes</span>

> [!div class="nohljsln"]
> ```yaml
> - Renamed Object to LocalObject
> - .id represents local id now, if you need same id as on server use .remoteId
> ```

### Added

> [!div class="nohljsln"]
> ```yaml
> - mute loading music
> - DISABLE_VEHICLE_ENGINE_SHUTDOWN_ON_LEAVE configflag to keep engines on when leaving a vehicle
> - FORCE_RENDER_SNOW configflag to enable snow on any weather
> - FORCE_HIDE_NIGHT_PROPS & FORCE_HIDE_NIGHT_PROPS
> - DISABLE_EMISSIVE_LIGHTS_RENDERING configflag to enable / disable emissive lights
> - audio, checkpoint, webview all getter
> - audio, webview, httpclien, websocketclient id getter
> - audio, blip remoteid getter
> - worldObjectPositionChange, worldObjectStreamIn & worldObjectStreamOut event
> - entityHitEntity event
> - audio filter, colshape, textlabel, weaponObject api
> - dimension getter, position & rotation setter for localplayer
> - httpclient, rmldocument, websocketclient, webview, checkpoint getbyID method
> - blip getByScriptID method
> - multiple webviews can be focused
> - resource config getter
> - vehicle rpm setter
> - warning if gta systems have performance issues
> - overwrite all game meta & dat files
> - DISABLE_SP_ENTER_VEHICLE_CLIPSET flag (true by default)
> - extendet texture budget
> - new setter & getter for object, checkpoint
> - localPed & localVehicle api
> - activityInputEnabled, activationLevel, noiseSuppressionEnabled, toggleInput methods
> - Extended Voice API Permission
> - isFullScreen method
> - cef hardware acceleration
> - improve ressource loading speed
> - downloadspeed settings
> - entity frozen setter/getter
> - taskchange event is cancable
> - startEnteringVehicle & startLeavingVehicle events
> - webview reload method
> - sourceentity parameter to weaponDamage event
> - gpuAccelerationActive webview getter
> - playerBulletHit event
> - checkpoint icon color getter/setter
> - extend audio api by output classes
> - audiocategory data api
> - all getter for weapondata api
> - gta v backup system
> - resetMinimapComponentPosition method
> - localstorage has method
> ```

### Fixed

> [!div class="nohljsln"]
> ```yaml
> - minimap textures couldn't be replaced
> - ap1_* ytds, vehshare.ytd, hud.ytd, minimap.ytd couldn't be replaced
> - gfx couldn't be replaced
> - cef flickering while marker is visible (native.drawRect(0, 0, 0, 0, 0, 0, 0, 0) workaround is no longer needed)
> - weapon dlc addon crashed the game on connect to the server
> - cef locale detection
> - webview didnt get destroyed
> - wrong reported resource downloadspeed
> - optional permissions
> - cancel button crashed client
> - voiceInputVolume sets volume in reverse
> - ladder sync
> - localplayer micLevel & isTalking getter
> - mouse cursor stucked in the middle of the screen if input was not set to raw
> - crash on invalid rml document input
> - multiple fixes related to the audio api
> - carmodcols can be loaded to use gta v chameleon colors
> - possible crash in getWheelSurfaceMaterial
> - wrong vehicle position on streamin after few restreams
> - playing animation directly after another one wasnt synced
> - entity models are not freed from memory
> ```

## Server

### <span style="color: red;">Breaking changes</span>

> [!div class="nohljsln"]
> ```yaml
> - Removed PlayerBeforeConnect event
> - Removed id support for entityinstreamingrange method
> - Removed entityWorkerCount server option
> ```

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
> - player playAnimation, clearTasks, playScenario method
> - streamsyncedmeta for checkpoints
> - vehicle quaternion setter & getter
> - objects Api
> - player socialClubName getter
> - socialClubName info in connectioInfo
> - option (spawnAfterConnect = true) to spawn player automatically at position 0,0,71
> - no-regenerate-rpf-cache cmd line arg
> - error message if justpack gets used without valid host config
> - possible to enable only specific gta dlcs with the dlc-whitelist config option
> - player streamedEntities getter
> - hashClientResourceName server option
> - Modify gamepool size via server config
> - prometheus support
> - Missing maxDistance & isSpatial voicechannel getter
> - streamer, migration thread count can be configured in server.toml
> - resource wildcard support in server.toml
> - getWeaponModelInfoByHash method, getAmmoHashForWeaponHash method & weaponmodels.bin file
> - ammo getter & setter method
> - canAttachCars to vehicleModelInfo
> - timestamp for entitys
> - hasWeapon, hasWeaponComponent, AmmoSpecialType, ammoFlags, ammoMax method for player
> - removeAllAmmo parameter for removeAllWeapons
> - blip dimension setter, blips can be shown to specific players
> - addDecoration, removeDecoration, clearDecorations, getDecorations method for player
> - setVoiceExternalPublic & setVoiceExternal method
> - player netOwnershipDisabled property
> ```

### Fixed

> [!div class="nohljsln"]
> ```yaml
> - Dead body position sync
> - vehicle angular interpolator
> - vehicle flickers when the netowner changes
> - player model setter removed all weapons
> - setting health directly after model change, left hp at 200
> - maxArmour resetted when player died
> - entity attachto api didnt accept all bone ids
> ```

## Server & Client

### <span style="color: red;">Breaking changes</span>

> [!div class="nohljsln"]
> ```yaml
> - Removed alt.Entity.getByID method
> ```

### Added
> [!div class="nohljsln"]
> ```yaml
> - getByID & getByRemoteID method for baseobjects
> - getMetaKeys & getSyncedMetaKeys methods
> - ped's Api
> - virtual entitys api
> - markers api
> - isEnteringVehicle, isLeavingVehicle, isOnLadder, isInCover, isInMelee player getter
> - metachange event
> - voiceConnection event
> - getVoiceConnectionState method
> - new blip api methods
> ```

### Fixed
> [!div class="nohljsln"]
> ```yaml
> - radius blip size property
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
> ```


## C# Module

### <span style="color: red;">Breaking changes</span>

> [!div class="nohljsln"]
> ```yaml
> - Removed deprecated Alt.Server property
> - All element constructors are deprecated. Please only use Alt.Create* or AltAsync.Create* instead. In one of the next updates the constructors will be removed.
> ```

### Fixed

> [!div class="nohljsln"]
> ```yaml
> - Fix OnRmlEvent Event
> ```
