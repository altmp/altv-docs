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

async function getLocalClientStatus() {
    try {
        const response = await fetch(`http://127.0.0.1:${this.DEBUG_PORT}/status`);
        return response.text();
    } catch (error) {
        return "ERROR";
    }
}

async function connectLocalClient() {
    const status = await getLocalClientStatus();
    if (status === "ERROR") return;
    if (status !== "MAIN_MENU" && status !== "IN_GAME") {
        setTimeout(() => this.connectLocalClient(), 2500);
    }

    try {
        await fetch(`http://127.0.0.1:${DEBUG_PORT}/reconnect`, {
            method: "POST",
            body: "serverPassword", // only needed when a password is set in the server.cfg
        });
    } catch (error) {
        console.log(error);
    }
}

connectLocalClient();
```

# [Typescript](#tab/tabid-2)

```ts
import fetch from "node-fetch";
import alt from "alt-server";

type STATUS =
    | "LOADING"
    | "MAIN_MENU"
    | "DOWNLOADING_FILES"
    | "CONNECTING"
    | "IN_GAME"
    | "DISCONNECTING"
    | "ERROR";
const DEBUG_PORT = 9223;

async function getLocalClientStatus(): Promise<STATUS> {
    try {
        const response = await fetch(`http://127.0.0.1:${DEBUG_PORT}/status`);
        return response.text() as unknown as STATUS;
    } catch (error) {
        return "ERROR";
    }
}

async function connectLocalClient(): Promise<void> {
    const status = await getLocalClientStatus();
    if (status === "ERROR") return;
    if (status !== "MAIN_MENU" && status !== "IN_GAME") {
        setTimeout(() => this.connectLocalClient(), 2500);
    }

    try {
        await fetch(`http://127.0.0.1:${DEBUG_PORT}/reconnect`, {
            method: "POST",
            body: "serverPassword", // only needed when a password is set in the server.cfg
        });
    } catch (error) {
        console.log(error);
    }
}

connectLocalClient();
```

# [C#](#tab/tabid-3)

```csharp
using AltV.Net.Async;
using Timer = System.Timers.Timer;

namespace Example
{
    class ExampleResource : AsyncResource
    {
        private const int DebugPort = 9223;

        private readonly HttpClient _httpClient = new();
        private readonly Timer _timer = new(2500);

        private async Task<string> GetLocalClientStatus()
        {
            try
            {
                var response = await this._httpClient.GetAsync($"http://127.0.0.1:{DebugPort}/status");
                return await response.Content.ReadAsStringAsync();
            }
            catch (Exception)
            {
                return "ERROR";
            }
        }

        private async Task ConnectLocalClient()
        {
            var status = await this.GetLocalClientStatus();
            if (status == "ERROR") return;
            if (status != "MAIN_MENU" && status != "IN_GAME")
            {
                this._timer.Start();
                return;
            }

            try
            {
                await this._httpClient.PostAsync(
                    $"http://127.0.0.1:{DebugPort}/reconnect",
                    new StringContent("serverPassword")  // only needed when a password is set in the server.cfg, otherwise pass null instead of StringContent
                );
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
        }

        public override void OnStart()
        {
            this._timer.Elapsed += (_, _) =>
            {
                _ = this.ConnectLocalClient();
            };

            _ = this.ConnectLocalClient();
        }

        public override void OnStop()
        {
        }
    }
}
```
