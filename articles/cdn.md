# Setup CDN

CDN (Content delivery Network) is a function to speedup the download of the resources for connecting users and to relive the server. The CDN can be provided with any filehosting server that supports HTTP/HTTPS.

It's working as followed: The client connects to the CDN Server, which provides the resource files for the client. After the download is complete, the client connects to the alt:V Server.

# Step-by-Step Tutorial

## Example values

In this tutorial following example values are used:

| Key   |             Value             |             Description             |
| ------ | :-------------------------------: | :-------------------------------: |
|   cdnUrl      |   http://connect.example.com/ |   The url to the cdn server.          |
|   Server IP   |   127.0.0.1                   |   The IP address of the alt:V server. |
|   Server Port |   7788                        |   The Port of the alt:V server.       |

## Step-by-Step Example

1. Add `useCdn = true` to `server.toml`.
2. Add `cdnUrl = "http://connect.example.com"` to `server.toml`.
3. Start you server with params `--host 127.0.0.1 --port 7788 --justpack`
4. Add all generated files from the folder `cdn_upload` to your CDN server, the files should be placed in the root of the domain. (You should be abble to access `connect.json` under `http://connect.example.com/connect.json`).
5. For direct connect use your cdnUrl `connect.example.com`

## CDN meta file

> [!CAUTION]
> With alt:V 16.0 a new file called `cdn-meta.bin` got added to the process.\
> Make sure to keep this file in your server's bin directory.

The `cdn-meta.bin` file is an important file in your server's bin folder, containing information about custom vehicles, peds and weapons.

This file has 2 primary purposes:
- it stops the server from parsing this data on every start
- you don't need to have these resources directly on your server, only on CDN