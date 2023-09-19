# Cloud Auth

With alt:V Update 15 there's a new unique player identifier verified by our Cloud Auth service. Unlike socialID, socialClubName, hwidHash or hwidExHash the new identifier cannot be spoofed, and therefore can be used for authentication and other sensitive systems.

> [!WARNING]
> In order to use the Cloud Auth feature on your server, you need to have Silver+ tier on [alt:V Patreon](https://go.altv.mp/patreon).
> 
> Link your Patreon account on [Server Manager](https://my.alt-mp.com/) and make sure to have your server added there + a new server token generated to get access to the feature.

## Usage

[Player method in JS API reference](https://docs.altv.mp/js/api/alt-server.Player.html#_altmp_altv_types_alt_server_Player_requestCloudID) <br>
[Player method in C# API reference](https://docs.altv.mp/cs/api/AltV.Net.Elements.Entities.ConnectionInfo.html#AltV_Net_Elements_Entities_ConnectionInfo_RequestCloudId) <br>
[IConnectionInfo in JS API reference](https://docs.altv.mp/js/api/alt-server.IConnectionInfo.html#_altmp_altv_types_alt_server_IConnectionInfo_requestCloudID)
[IConnectionInfo in C# API reference](https://docs.altv.mp/cs/api/AltV.Net.Elements.Entities.IConnectionInfo.html#AltV_Net_Elements_Entities_IConnectionInfo_RequestCloudId)

Keep in mind that this method is async.

> [!WARNING]
> This method will reject on auth failure (with await = throw exception)!

In case of successful authentication method resolves with a identifier string

In case of failure method rejects with a string, identifying the problem

### Possible errors:

- `NO_LICENSE` - Indicates that the player does not have valid GTA V license (player will be kicked by the server automatically soon)
- `SERVICE_UNAVAILABLE` - Indicates that Cloud Auth service is down.
- `INTERNAL_ERROR`, `WRONG_REQUEST` or any other string - Identifies internal service problem, should not happen. If received, please open an issue on our [Issue tracker](https://github.com/altmp/altv-issues/issues)

## Example

```js
let id;

try {
    id = await player.requestCloudID();
} catch(e) {
    if (e === 'NO_LICENSE') {
        player.kick('Unauthorized');
        return;
    } else {
        if (e !== 'SERVICE_UNAVAILABLE') reportProblem('Invalid Cloud Auth response: ' + e);
        // fallback to another login method
    }
}
```