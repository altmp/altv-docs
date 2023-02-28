# 14.0-Release

> [!WARNING]
> This update isn't released yet.

## Client

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
> - downloadspeed setting
> - Updated cef to v103
> - general new UI
> - clear console command
> - ime support for rmlui
> ```

### Fixed

> [!div class="nohljsln"]
> ```yaml
> - Disconnection modal displayed twice after reconnect
> - The Win key got blocked by active webview in the game
> - Ipv6 support
> - wrong menu after connect rejection
> - webview freezed on FileDialog
> - cursor type didnt reset on webview destroy
> - crashdump location folder
> - cursor in iframe inputs wasnt visible
> - scrolling in iframes
> - rmlui clipboard
> - blips & object are not destroyed on resource stop
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
> - (Client) Updated v8 to 10.2
> - Allow emitting typed arrays
> ```

### Fixed
> [!div class="nohljsln"]
> ```yaml
> - (client) webview, audio, websocket & rml geteventhandler returned removed ones
> ```