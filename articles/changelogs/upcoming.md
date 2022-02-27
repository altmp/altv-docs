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
> - enable xenon mod when setting headlight color
> - support for resources in subfolders
> - error message when binding to invalid host address
> - serverStarted event
> - boat anchor setter & getter
> ```

### Fixed

> [!div class="nohljsln"]
> ```yaml
> - blip rotation setter
> - vehicles created on resource start will be missing in resource start
> - empty resources got sended to client
> - last command being executed when pressed enter
> - checkpoint destroy
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
> ```