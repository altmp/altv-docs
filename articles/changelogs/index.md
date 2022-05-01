# 9.0-Release

> [!WARNING]
> This update is the latest.

> [!TIP]
> This update was released on 04.02.2022

> [!CAUTION]
> This update contains **breaking changes**, which can potentially break the functionality of your gamemode, please verify and change accordingly.

> [!div class="nohljsln"]
> ```yaml
> - 9.1:
>    - Fixed crash in worker.pause & worker.resume
>    - Change invalid timer id message to warning
> - 9.3:
>    - Fixed model change
>    - Fixed invisible player & vehicles after server start in some cases
> - 9.4:
>    - Fixed bytecode related issues
> - 9.5:
>    - Fixed ENB compatibility
> - 9.6:
>    - Added cloth validation for overwritten gta dlc's, custom clothes & props
>    - Reduced AttachmentExtension pool & extendet AnimStore pool
> - 9.7:
>    - Add support for latest Rockstar Launcher Update
> - 9.8:
>    - alt.isKeyDown returned true when key was pressed but game not focused
> - 9.10:
>    - Add support for GTA version 2612
> - 9.12:
>    - Crashfix for GTA version 2612
> - 9.13:
>    - Disable placeholder files from gta version 2612
> ```

## Client

### Added

> [!div class="nohljsln"]
> ```yaml
> - debug http server for reconnect
> - isReloading getter
> - alt.Profiler.getMemoryProfile
> - alt.isCamFrozen()
> - password in connect url
> - spawned event
> - disabled social club menu
> - Option to exit Game Inside GTA:V  Menu
> - alt.copyToClipboard
> - start menu shortcut
> - reuse last password on reconnect command if no password specified
> - alt.worldToScreen, alt.screenToWorld & alt.getCamPos
> - vehicle seatCount getter
> - Vector2 and RGBA support in webviews
> ```

### Fixed

> [!div class="nohljsln"]
> ```yaml
> - netowner getter returned null
> - discord api wasn't working if it was started after alt:V launch
> - players didn't die at vehicle explosion
> - player got rejected if the server has no password, but pw field was not empty
> - player to player attach
> - "Temp data already defined"-Error
> - sometimes it wasn't possible to reconnect if you got a timeout once
> - weaponswap configflag deactivated vehicle weapons
> - setArtificialLightsState native
> - GetCursorPosition and SetCursorPosition was usable if game window was out of focus
> - getHeadshotBase64 crashes
> - AltV Voice LipSync
> ```

### <span style="color: red;">Breaking changes</span>

> [!div class="nohljsln"]
> ```yaml
> - client mods that need d3d11.dll to work are now disabled until further notice
> ```

## Server

### Added

> [!div class="nohljsln"]
> ```yaml
> - warning when Server is started with debug mode
> - string support in beforePlayerConnect event
> - voice channel GetPlayers and GetPlayerCount
> - server starts with default config if no server.cfg exists
> - alt.stopServer
> - IsEntityInStreamingRange accepts entity id now
> - Warning when specifying cdn url without protocol
> - don't stream in players that are not spawned
> - warning when announcing but CDN URL is empty
> - warning when health or armour setters are used with invalid values
> - 3 unknown train setter & getter
> - getVehicleModelInfoByHash
> - improved net owner calculations
> - improved server.cfg error message for Invalid token
> - polygon colshape
> - improved colshape remove performance
> - sync data optimization for high population areas
> - multithreaded sync
> - thread safe synced meta data
> - thread safe vehicle and player apis
> - improved server loop performance
> - connection queue
> - --help command-line option
> ```

### Fixed

> [!div class="nohljsln"]
> ```yaml
> - Crash if entity id limit is reached
> - OnPlayerLeaveVehicle event is never fired when a player disconnects
> - Vehicle locked state setter
> - crashes when using restartResource or stopResource
> - fixed colshape entity race conditions causing error logs
> - fixed connect race condition keeping entity connected
> - train doors were always open
> - version getter was broken on linux
> - vehicle healthdata getter was broken on linux
> ```

### <span style="color: red;">Breaking changes</span>

> [!div class="nohljsln"]
> ```yaml
> - vehicle base64 getters and setter are now checking the gta version and the old data before this change is incompatible
> ```

## Server & Client

### Added

> [!div class="nohljsln"]
> ```yaml
> - localMeta Api
> - getAllResources method
> - alt.time & alt.timeEnd
> ```
