# Cloud Auth

With alt:V Update 15 there's a new unique player identifier verified by our Cloud Auth service. Unlike socialID, socialClubName, hwidHash or hwidExHash the new identifier cannot be spoofed, and therefore can be used for authentication and other sensitive systems.

> [!WARNING]
> In order to use the Cloud Auth feature on your server, you need to have Silver+ tier on [alt:V Patreon](https://go.altv.mp/patreon).
> 
> Link your Patreon account on [Server Manager](https://my.alt-mp.com/) and make sure to have your server added there + a new server token generated to get access to the feature.

## FAQ

### What is cloud auth?
Cloud auth is a unique identification solution developed by alt:V.\
This system uses the alt:V backend to create a special ID for each player, which is directly linked to their Rockstar account.

### How secure is cloud auth?
The Cloud Auth system is highly secure.\
It utilizes our backend for setting up and confirming client identifiers, ensuring secure connections, protect against spoofing and adding an extra layer of security to the process.

### How does the Cloud Auth system work?
When a client connects to the server, a request can be made to the alt:V backend.\
This request retrieves the associated unique identifier for the client's Rockstar account, which then can be used to verify and authenticate the client.

### Can a client spoof or tamper with the unique identifier?
No, due to the involvement of our backend in the process, clients cannot spoof or manipulate their unique identifiers.\
Every operation is verified through our backend, making sure each player's unique ID stays correct and genuine.

### What can change the unique Cloud Auth identifier?
The unique cloud auth identifier is strictly linked to your Rockstar account so changing the Rockstar account will change the ID.\
This ID isn't reliant on your hardware or any software.\
If a stricter verification method is needed, you can consider incorporating additional checks such as hardware ID and other options.

### Will switching Rockstar accounts change the id?
Yes, switching Rockstar accounts will change the ID, because the unique ID is directly tied to your Rockstar account.\
If stricter verification is needed, additional measures such as incorporating hardware ID and other options can be implemented.

### Can I create my own cloud auth implementation or use it outside of alt:V?
No, creating your own cloud auth implementation is not possible.\
Our backend plays a key role in the process and for safety reasons, we do not disclose detailed information about its workings.\
This makes it impossible to reproduce an independent cloud auth system.

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

- `NO_BENEFIT` - The server doesn't have the required benefit unlocked
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