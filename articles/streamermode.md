# Streamer Mode

The idea behind Streamer Mode is to hide selected webviews (often used for HUD and Interfaces) to recording and streaming software like OBS. The software needs to record GTA V in "Game Capture"-Mode, this mode doesn't record overlays.

## How to activate streamer mode?

Open your alt:V folder and open the altv.cfg file with Notepad++ or Notepad and add `streamerMode: 'true'` to the end of the file. If a line with `streamerMode` already exist, modify the parameter `false` to `true`. Restart your game and now Streamer Mode is enabled.

## How to script with streamer mode?

To create a webview which isn't rendered in streamer mode, you need to set the overlay parameter from webview constructor to `true`. The default value of the overlay parameter is `false` if the argument isn't specified.

Here you can see an example on how to hide a webview from streaming software in streamer mode:

```js
let webview = new alt.WebView("https://altv.mp", true);
```