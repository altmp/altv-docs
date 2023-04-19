# 自动重连

本文将解释9.0更新中引入的自动重新连接功能。

## 自动重连是什么

自动重连允许服务器向本地客户端发送POST请求,以初始化与服务器的连接/重连。<br>
此功能仅在客户端和服务器处于调试模式时可用,旨在实现更流畅的本地开发。<br>
需要注意的是,您也可以在需要时发送POST请求,这意味着可以等待服务器完成启动过程(从数据库获取数据,加载模块等)。

## 脚本使用  

# [Javascript](#tab/tabid-1)  

```js
import fetch from "node-fetch";  

const RETRY_DELAY = 2500;   //重试延迟
const DEBUG_PORT = 9223;   //调试端口

async function getLocalClientStatus() { //获取本地客户端状态
  try {
    const response = await fetch(`http://127.0.0.1:${DEBUG_PORT}/status`); 
    return response.text();
  } catch (error) {
    return null;
  }
}

async function connectLocalClient() {   //尝试重新连接本地客户端
  const status = await getLocalClientStatus();
  if (status === null) return;

  if (status !== "MAIN_MENU" && status !== "IN_GAME") {  //如果状态不是主菜单或游戏中
    setTimeout(() => connectLocalClient(), RETRY_DELAY);   //2.5秒后重试
  }   

  try {
    await fetch(`http://127.0.0.1:${DEBUG_PORT}/reconnect`, {  
      method: "POST",
      body: "serverPassword",   //只有在server.toml中设置了密码时才需要
      // 否则传入null代替StringContent
    });
  } catch (error) {
    console.log(error);
  }
}

connectLocalClient();   //调用connectLocalClient
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
  Error = "ERROR",  
}

const RETRY_DELAY = 2500;     //重试延迟  
const DEBUG_PORT = 9223;     //调试端口  

async function getLocalClientStatus(): Promise<Status | null> {   //获取本地客户端状态
  try {
    const response = await fetch(`http://127.0.0.1:${DEBUG_PORT}/status`); 
    return response.text() as unknown as Status;
  } catch (error) {
    return null;
  }
}

async function connectLocalClient(): Promise<void> {   //尝试重新连接本地客户端
  const status = await getLocalClientStatus();
  if (status === null) return;  

  if (status !== Status.MainMenu && status !== Status.InGame) {   //如果状态不是主菜单或游戏中  
    setTimeout(() => connectLocalClient(), RETRY_DELAY);     //2.5秒后重试
  }   

  try {
    await fetch(`http://127.0.0.1:${DEBUG_PORT}/reconnect`, {    
      method: "POST",  
      body: "serverPassword",     //只有在server.toml中设置了密码时才需要  
      // 否则传入null代替StringContent
    });
  } catch (error) {
    console.log(error);
  }
}  

connectLocalClient();   //调用connectLocalClient
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
    private const int DebugPort = 9223;   //调试端口
    private const int RetryDelay = 2500;   //重试延迟

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

    private async Task<ClientStatus> GetLocalClientStatus()  //获取本地客户端状态
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

    private async Task ConnectLocalClient()  //尝试重新连接本地客户端
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
          // 只有在server.toml中设置了密码时才需要,否则传入null代替StringContent  
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

    public override void OnStop() {}
  }
}
```
