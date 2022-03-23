# CEF - Chromium Embedded Framework

The Chromium Embedded Framework (also known as CEF) is a web browser engine used in alt:V to render clientside webpages and assets - like in your everyday web browser. CEF will use your system locale.

## Debug Mode

To enable the debug mode/server on clientside for CEF, you have to enable the `debug: true` setting in your clientside configuration.

Then, the debug server is available under `localhost:9222` (in Chromium or older Chrome) or `chrome://inspect` (in newer Chrome).

## Linux

If CEF is not rendering in Linux, you might be missing required libraries in the `/cef` folder. To allow CEF to load properly you must copy the missing libraries from `/libs` to `/cef`. See below a list of files that need to be copied for CEF to work.

(Tested using [Wine-GE](https://github.com/GloriousEggroll/wine-ge-custom/releases) and [Lutris](https://lutris.net/) with GTA:V downloaded from Windows version of Steam)

### Files to be Copied

-   libcef.dll
-   icudtl.dat
-   snapshot_blob.bin
-   chrome_elf.dll
-   v8_context_snapshot.bin
