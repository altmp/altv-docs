# 10.0-Release

> [!WARNING]
> This update isn't released yet.

> [!CAUTION]
> This update contains **breaking changes**, which can potentially break the functionality of your gamemode, please verify and change accordingly.

## Client

### Added

> [!div class="nohljsln"]
> ```yaml
> - windowFocusChange Event
> - netOwnerChange event for local player ownership changes
> - loading rml document from string
> - alt.setMinimapComponentPosition
> - alt.setMinimapIsRectangle
> - branch validation to launcher config
> - alt.getScreenResolution
> - windowResolutionChange event
> - webview size and pos getter & setter
> - alt.utils class
> - isRemote getter for blips
> - increased 2d volume of sound api
> - discord oAuth api
> - alt.isCursorVisible()
> - c# module
> - console connect command
> - important missing ipls will be loaded by default now
> ```

### Fixed

> [!div class="nohljsln"]
> ```yaml
> - clientside created blips didn't delete on reconnect
> - Rockstar launcher detected unexpected Files
> - serverside blip attached to entity is not deleted with entity
> - serverside created blip API category setter doesent update
> - resolution change did not apply for rmlui
> - webview visible setter before view is initialized didn't worked
> - webview size and pos parameter in constructor
> - pixelation in rmlui when resolution changes
> - resource import/export
> - missing collision for helicopters, what caused explosions
> ```

### <span style="color: red;">Breaking changes</span>

> [!div class="nohljsln"]
> ```yaml
> - disabled document.execCommand in webviews
> ```

## Server

### Added

> [!div class="nohljsln"]
> ```yaml
> - getServerConfig method
> - optimized synced meta data
> - support for resources in subfolders
> - error message when binding to invalid host address
> - serverStarted event
> - node inspector, source-maps, heap-profiler, profiler server.cfg entry for js module, global-fetch, global-webcrypto, network-imports (see https://docs.altv.mp/articles/configs/server.html for references)
> - props & clothes setters returns a bool now
> - collision & frozen setter, getter
> - don't disable props when inside a bike, helicopter, submarine
> - cancelable requestControl event
> - hasAutoAttachTrailer to vehicleModelInfo
> - isAccepted getter to ConnectionInfo
> ```

### Fixed

> [!div class="nohljsln"]
> ```yaml
> - blip rotation setter
> - vehicles created on resource start will be missing in resource start
> - empty resources got sended to client
> - last command being executed when pressed enter
> - checkpoint destroy
> - utf-8 with BOM destroyed server.cfg
> ```

<!-- ### <span style="color: red;">Breaking changes</span>

> [!div class="nohljsln"]
> ```yaml
> ``` -->

## Server & Client

### Added

> [!div class="nohljsln"]
> ```yaml
> - resource class
> - resourceStop and resourceStart events now support async functions, and will wait until the async function is resolved
> - stringToSHA256 method
> ```

## JS Module

> [!div class="nohljsln"]
> ```yaml
> - Updated nodeJS to v17.7.0
> - Fixed emitClient & emitClientRaw not sending events properly when passing an array of players
> ```
