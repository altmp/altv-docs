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
> ```

### Fixed

> [!div class="nohljsln"]
> ```yaml
> - Disconnection modal displayed twice after reconnect
> - The Win key got blocked by active webview in the game
> - Ipv6 support
> - wrong menu after connect rejection
> - Crashlogs are back in the alt:V client folder
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
> ```

### Fixed
> [!div class="nohljsln"]
> ```yaml
> - (client) webview, audio, websocket & rml geteventhandler returned removed ones
> ```