# Auto reconnect

This article will explain the auto reconnect feature introduced in the 9.0 update.

## What is auto reconnect

The auto reconnect allows the server to send a post request to the local client in order to initialize a connection /
reconnection to the server.<br>
This feature is only available when the client and server are in debug mode and is intended for a smoother local
development.<br>
It is important to note that you can also send the post request when you want, meaning it's possible to wait for your
server to finish his startup procedure (fetching data from database, loading modules..).

## Script usage

# [Javascript](#tab/tabid-1)

```js
import fetch from "node-fetch";

const RETRY_DELAY = 2500;
const DEBUG_PORT = 9223;

async function getLocalClientStatus() {
    try {
        const response = await fetch(`http://127.0.0.1:${DEBUG_PORT}/status`);
        return response.text();
    } catch (error) {
        return null;
    }
}

async function connectLocalClient() {
    const status = await getLocalClientStatus();
    if (status === null) return;

    if (status !== "MAIN_MENU" && status !== "IN_GAME") {
        setTimeout(() => connectLocalClient(), RETRY_DELAY);
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

const enum Status {
    Loading = "LOADING",
    MainMenu = "MAIN_MENU",
    DownloadingFiles = "DOWNLOADING_FILES",
    Connecting = "CONNECTING",
    InGame = "IN_GAME",
    Disconnecting = "DISCONNECTING",
    Error = "ERROR"
}

const RETRY_DELAY = 2500;
const DEBUG_PORT = 9223;

async function getLocalClientStatus(): Promise<Status | null> {
    try {
        const response = await fetch(`http://127.0.0.1:${DEBUG_PORT}/status`);
        return response.text() as unknown as Status;
    } catch (error) {
        return null;
    }
}

async function connectLocalClient(): Promise<void> {
    const status = await getLocalClientStatus();
    if (status === null) return;

    if (status !== Status.MainMenu && status !== Status.InGame) {
        setTimeout(() => connectLocalClient(), RETRY_DELAY);
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
using System.Runtime.Serialization;
using Timer = System.Timers.Timer;

namespace Example
{
    class ExampleResource : AsyncResource
    {
        private const int DebugPort = 9223;
        private const int RetryDelay = 2500;

        private readonly HttpClient _httpClient = new();
        private readonly Timer _timer = new(RetryDelay);

        private enum ClientStatus
        {
            [EnumMember(Value = "LOADING")] Loading,
            [EnumMember(Value = "MAIN_MENU")] MainMenu,
            [EnumMember(Value = "DOWNLOADING_FILES")] DownloadingFiles,
            [EnumMember(Value = "CONNECTING")] Connecting,
            [EnumMember(Value = "IN_GAME")] InGame,
            [EnumMember(Value = "DISCONNECTING")] Disconnecting,
            [EnumMember(Value = "ERROR")] Error
        }

        private async Task<ClientStatus> GetLocalClientStatus()
        {
            try
            {
                var status = await _httpClient.GetStringAsync($"http://127.0.0.1:{DebugPort}/status");
                var enumValue = typeof(ClientStatus).GetFields()
                    .FirstOrDefault(f => f.GetCustomAttribute<EnumMemberAttribute>()?.Value == status)?
                    .GetValue(null);
    
                return enumValue != null ? (ClientStatus)enumValue : ClientStatus.Error;
            }
            catch
            {
                return ClientStatus.Error;
            }
        }

        private async Task ConnectLocalClient()
        {
            var status = await GetLocalClientStatus();
            if (status == ClientStatus.Error) return;
            if (status != ClientStatus.MainMenu && status != ClientStatus.InGame && !_timer.Enabled)
            {
                _timer.Start();
                return;
            }
            if (status == ClientStatus.InGame && _timer.Enabled)
            {
                _timer.Stop();
                return;
            }
    
            try
            {
                await _httpClient.PostAsync(
                    $"http://127.0.0.1:{DebugPort}/reconnect",
                    // Only needed when a password is set in the server.cfg, otherwise pass null instead of StringContent
                    new StringContent("serverPassword")
                );
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Reconnect failed: {ex}");
            }
        }

        public override void OnStart()
        {
            _timer.Elapsed += (_, _) => _ = ConnectLocalClient();
            _ = ConnectLocalClient();
        }

        public override void OnStop()
        {
        }
    }
}
```