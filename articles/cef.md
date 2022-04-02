# CEF - Chromium Embedded Framework

The Chromium Embedded Framework (also known as CEF) is a web browser engine used in alt:V to render clientside webpages and assets - like in your everyday web browser. CEF will use your system locale.

## Debug Mode

To enable the debug mode/server on clientside for CEF, you have to enable the `debug: true` setting in your clientside configuration.

Then, the debug server is available under `localhost:9222` (in Chromium or older Chrome) or `chrome://inspect` (in newer Chrome).

CEF not working? [Click here](~/articles/troubleshooting/client.md#webview-not-rendering-on-linux) to see troubleshooting steps.
