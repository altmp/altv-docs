# Auto reconnect

This article will explain the auto reconnect feature introduced in the 9.0 update.

## What is auto reconnect

The auto reconnect allows the server to send a post request to the local client in order to initialize a connection / reconnection to the server.<br>
This feature is only available when the client and server are in debug mode and is intended for a smoother local development.<br>
It is important to note that you can also send the post request when you want, meaning it's possible to wait for your server to finish his startup procedure (fetching data from database, loading modules..).

## Script usage

# [Javascript](#tab/tabid-1)

```js
import fetch from "node-fetch";
import alt from "alt-server";

const DEBUG_PORT = 9223;

async function getClientStatus() {
    try {
        const response = await fetch(`http://127.0.0.1:${DEBUG_PORT}/status`);
        return Promise.resolve(response.text());
    } catch (error) {
        return Promise.resolve("ERROR");
    }
}

async function autoReconnect()  {
    const status = await getClientStatus();
    if (status !== "MAIN_MENU" || status !== "IN_GAME") {
        setTimeout(autoReconnect, 2500);
        return;
    }

    try {
        await fetch(`http://127.0.0.1:${DEBUG_PORT}/reconnect`, {
            method: "POST",
            body: "serverPassword" // only needed when a password is set in the server.cfg
        });
    } catch(error) {
        console.log(error);
    }
}

autoReconnect();
```

# [Typescript](#tab/tabid-2)

```ts
import fetch from "node-fetch";
import alt from "alt-server";

type STATUS = "LOADING" | "MAIN_MENU" | "DOWNLOADING_FILES" | "CONNECTING" | "IN_GAME" | "DISCONNECTING" | "ERROR";
const DEBUG_PORT = 9223;

async function getClientStatus(): Promise<STATUS> {
    try {
        const response = await fetch(`http://127.0.0.1:${DEBUG_PORT}/status`);
        const body = response.text() as unknown as STATUS;
        return Promise.resolve(body);
    } catch (error) {
        return Promise.resolve("ERROR");
    }
}

async function autoReconnect(): Promise<void> {
    const status = await getClientStatus();
    if (status !== "MAIN_MENU" || status !== "IN_GAME") {
        setTimeout(autoReconnect, 2500);
        return;
    }

    try {
        fetch(`http://127.0.0.1:${DEBUG_PORT}/reconnect`, {
            method: "POST",
            body: "serverPassword" // only needed when a password is set in the server.cfg
        });
    } catch(error) {
        console.log(error);
    }
}

autoReconnect();
```

# [C#](#tab/tabid-3)

```csharp
```