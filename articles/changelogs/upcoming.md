# 10.0-Release

> [!WARNING]
> This update isn't released yet.

> [!TIP]
> This update was released on 00.00.0000

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
> ```

### Fixed

> [!div class="nohljsln"]
> ```yaml
> - clientside created blips didn't delete on reconnect
> - Rockstar launcher detected unexpected Files
> - serverside blip attached to entity is not deleted with entity
> - serverside created blip API category setter doesent update
> - resolution change did not apply for rmlui
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
> ```

### Fixed

> [!div class="nohljsln"]
> ```yaml
> - blip rotation setter
> - vehicles created on resource start will be missing in resource start
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
> ```
