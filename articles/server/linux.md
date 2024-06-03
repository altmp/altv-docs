# Run a server on Linux


## Preparation

You need the following requirements to run a server on linux:
- A server that meets the [minimum requirements](../serverspecs.md)
- libatomic1 (`apt install libatomic1`)

If you plan to install the C# module, you will need:
- Latest [.NET 6 SDK](https://dotnet.microsoft.com/en-us/download/dotnet/6.0). (.NET 7 and 8 are also supported)

## Download the server

Download the server files from https://altv.mp/downloads/ and select all what you need.<br />
As example: If you dont need the JavaScript Module, you haven't to check it.

## Before start

After you download the server files, extract them in an empty directory.<br />
The files `altv-server` and `altv-crash-handler` must also have rights to execute.<br />
You can easily do this with the following commands:
- `chmod +x altv-server`
- `chmod +x altv-crash-handler`

> [!WARNING]
> For various security reasons, it is not recommended to start the server in the root directory or with the root user.

## C# Module settings

If you have downloaded a higher version than .NET 6, you must change the entries `"tfm”: "net6.0”` and `"version”: "6.0.0”` in `AltV.Net.Host.runtimeconfig.json`.<br />
Depending on which version you have downloaded, the `6` must be changed to this version.

For example: `"tfm”: "net6.0”` to `"tfm”: "net8.0”`.

## Final start

Once you have done all this, you can start the server quickly and easily with `./altv-server`.