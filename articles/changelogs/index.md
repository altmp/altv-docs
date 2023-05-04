# 14.0-Release

> [!WARNING]
> This update is the latest.

> [!TIP]
> This update was released on 31.03.2023

> [!div class="nohljsln"]
> ```yaml
> - 14.1:
>    - Fixed Wrong playercount
> - 14.2:
>    - Fixed Some cef core fixes
> - 14.3:
>    - Fixed cef performance issues
> - 14.4:
>    - Fixed some master server problems
> - 14.5:
>    - Masterserver fixes
> - 14.6:
>    - Masterserver fixes
> - 14.7:
>    - Masterserver fixes
> - 14.8:
>    - Masterserver fixes
> - 14.9:
>    - Masterserver fixes
> - 14.10:
>    - Masterserver fixes
> - 14.11:
>    - CI Changes
> - 14.13:
>    - Streamermode fixes
> - 14.14:
>    - Freeze on huge amount of entities fix
>    - Vehicle teleport on owner change fix
>    - Vehicle angular velocity shuttering fix
>    - Dead body sync fix
> - 14.15:
>    - Revert Vehicle angular velocity shuttering fix
> - 14.16:
>    - Vehicle angular velocity shuttering fix
> - 14.17:
>    - Revert network optimizations
> - 14.18:
>    - weapon meta crashes
> - 14.19:
>    - Fix linux client
> - 14.20:
>    - Another fix for linux client
> ```

## Client

### <span style="color: red;">Breaking changes</span>

> [!div class="nohljsln"]
> ```yaml
> - disabled cloth sync if setted via native
> ```

### Added

> [!div class="nohljsln"]
> ```yaml
> - Render RMLUI under CEF
> - Updated RMLUI to 5.0
> - RMLUI antialiasing
> - RMLUI fallback font
> - getPedBonePos method
> - Side Mouse buttons for voice keybinding
> - Display downloadspeed while downloading ressources
> - Server Permission translations
> - submit nickname on first start by pressing enter
> - adaptivity for client console layout
> - cef support while pause menu ped is active
> - Updated cef to v103
> - general new UI
> - clear console command
> - ime support for rmlui
> - error message in launcher, if gta:v start fails
> - language selection on installation
> - debug, branch & skipprocessconfirmation cli arg
> - installer & uninstaller rework
> - general launcher rework
> ```

### Fixed

> [!div class="nohljsln"]
> ```yaml
> - Disconnection modal displayed twice after reconnect
> - wrong menu after connect rejection
> - webview freezed on FileDialog
> - cursor type didnt reset on webview destroy
> - crashdump location folder
> - cursor in iframe inputs wasnt visible
> - scrolling in iframes
> - rmlui clipboard
> - blips & object got not destroyed on resource stop
> - vehiclelayout meta
> - alt + f4 in vehicle stopped vehicle immediately
> - crash while pressing ESC after ressource restart
> - launcher shortcut was system wide
> - website url of a server was always lowercase
> - inputs in webviews didnt trigger focus & blur events
> - GTA Sound options didnt save
> - webview stayed unfocus if data url was used
> - cloning ped in pause menu disappeared all UI's
> - testProbeAgainstWater native
> ```

## Server

### Added

> [!div class="nohljsln"]
> ```yaml
> - "all" as setting language
> ```

## JS Module

### Added
> [!div class="nohljsln"]
> ```yaml
> - (server) Display source path on deprecated methods usage
> - (Server) Automatically fix paths with special characters
> - (Server) partial TextEncoder and TextDecoder
> - (Server) Updated nodeJS to 18.13.1
> - (Server) Possible to modify damage value in weapondamage event
> - (Client) Updated v8 to 10.2
> - Allow emitting typed arrays
> ```

### Fixed
> [!div class="nohljsln"]
> ```yaml
> - (client) webview, audio, websocket & rml geteventhandler returned removed ones
> - (client) crash in vehicle handling if entity is invalid
> - (client) Internal error. Icu error when using for example toLocaleString
> ```

## C# Module

### <span style="color: red;">Breaking changes</span>

> [!div class="nohljsln"]
> ```yaml
> - OnRemove() method replaced by OnDestroy()
> ```

### Added
> [!div class="nohljsln"]
> ```yaml
> - alt:V custom .NET project template 
> - (client) Add all missing vehicle properties
> ```

### Fixed
> [!div class="nohljsln"]
> ```yaml
> - (client) weapondata using properties
> ```

### Rework
> [!div class="nohljsln"]
> ```yaml
> - Mark Remove() method as deprecated and add Destroy() method for consistent alt:V api
> ```