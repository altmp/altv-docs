# 10.0-Release

> [!WARNING]
> This update is the latest.

> [!TIP]
> This update was released on 20.05.2022

> [!CAUTION]
> This update contains **breaking changes**, which can potentially break the functionality of your gamemode, please verify and change accordingly.

> [!div class="nohljsln"]
> ```yaml
> - 10.1:
>    - Fixed problems with syncedMetaData
> ```

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
> - webview size setter & getter
> - webview pos getter
> - isRemote getter for blips
> - increased 2d volume of sound api
> - discord oAuth api
> - alt.isCursorVisible()
> - c# client module
> - console connect command
> - important missing ipls will be loaded by default now
> - disable idle cam flag also disables vehicle idle cam now
> ```

### Fixed

> [!div class="nohljsln"]
> ```yaml
> - clientside created blips didn't delete on reconnect
> - Rockstar launcher detected unexpected Files because of cef cache
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
> - arm64 build support
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
> - GetResourceExports crashed the server
> - calling OnCreateBaseObject for objects that got created before other resource existed
> - netowner reset on migration in few cases
> ```

## Server & Client

### Added

> [!div class="nohljsln"]
> ```yaml
> - resource class
> - resourceStop and resourceStart events now support async functions, and will wait until the async function is resolved
> - stringToSHA256 method
> - alt.Utils class
> ```

## JS Module

> [!div class="nohljsln"]
> ```yaml
> - Updated nodeJS to v17.7.0
> - Fixed emitClient & emitClientRaw not sending events properly when passing an array of players
> - Fixed JS module reserved commands are sent to users
> ```

## C# Server Module

> [!div class="nohljsln"]
> ```yaml
> - Now AltV.Net NuGet depends on AltV.Net.Shared and AltV.Net.CApi. Consider that, if you specify dlls manually to move/deploy
> - Floating point values now can be received as int in the events and meta
> - Alt.Server was deprecated, use Alt.Core instead
> - Function.Create was deprecated, use Alt.CreateFunction instead
> - MValueBuffer2 constructor was deprecated, use Alt.CreateMValueBuffer instead
> - MValueWriter2 constructor was deprecated, use Alt.CreateMValueWriter instead
> - MValueObject old constructor was deprecated, use one with ICore as first argument
> - MValueArray old constructor was deprecated, use one with ICore as first argument 
> - MValueAdapters API was deprecated, use corrseponding method from Alt instead
> - VehicleBuilder was deprecated, use Vehicle constructor instead
> - IColShape.IsPlayerIn was deprecated, use IColShape.IsEntityIn instead
> - IColShape.IsVehicleIn was deprecated, use IColShape.IsEntityIn instead
> - ICheckpoint.IsPlayerIn was deprecated, use ICheckpoint.IsEntityIn instead
> - ICheckpoint.IsVehicleIn was deprecated, use ICheckpoint.IsEntityIn instead
> - All entity async methods, and AltAsync async methods except for entity creation ones were deprecated. Use async entities instead. For more info see Async article in C# docs
> - AltInteractions Trigger method did trigger all types at once. Now, there's a TriggerAll method for that.
> ```

### <span style="color: red;">Breaking changes</span>

> [!div class="nohljsln"]
> ```yaml
> - IServer was renamed to ICore
> - IEntityPool, IBaseObjectPool and IBaseBaseObjectPool method signatures were changed. (now they return a nullable entity, instead of returning boolean and entity via out variable)
> - Alt.GetAll* methods now return IReadOnlyCollection instead of ICollection
> ```
