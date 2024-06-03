# Run a server on Windows


## Preparation

You need the following requirements to run a server on linux:
- A server that meets the [minimum requirements](../serverspecs.md)

If you plan to install the C# module, you will need:
- Latest [.NET 6 SDK](https://dotnet.microsoft.com/en-us/download/dotnet/6.0). (.NET 7 and 8 are also supported)

## Download the server

Download the server files from https://altv.mp/downloads/ and select all what you need.<br />
As example: If you dont need the JavaScript Module, you haven't to check it.

## Before start

After you download the server files, extract them in an empty directory.<br />

> [!WARNING]
> For various security reasons, it is not recommended to start the server as administrator.

## C# Module settings

If you have downloaded a higher version than .NET 6, you must change the entries `"tfm”: "net6.0”` and `"version”: "6.0.0”` in `AltV.Net.Host.runtimeconfig.json`.<br />
Depending on which version you have downloaded, the `6` must be changed to this version.

For example: `"tfm”: "net6.0”` to `"tfm”: "net8.0”`.

## Final start

Once you have done all this, you can quickly and easily start the server by double-clicking on the `altv-server.exe`.