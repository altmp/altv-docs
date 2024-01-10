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

### How does the cloud auth system work?
When a client connects to the server, a request can be made to the alt:V backend.\
This request retrieves the associated unique identifier for the client's Rockstar account, which then can be used to verify and authenticate the client.

### Can a client spoof or tamper with the unique identifier?
No, due to the involvement of our backend in the process, clients cannot spoof or manipulate their unique identifiers.\
Every operation is verified through our backend, making sure each player's unique ID stays correct and genuine.

### What can change the unique cloud auth identifier?
The unique cloud auth identifier is strictly linked to your Rockstar account so changing the Rockstar account will change the ID.\
This ID isn't reliant on your hardware or any software.\
If a stricter verification method is needed, you can consider incorporating additional checks such as hardware ID and other options.

### Can I create my own cloud auth implementation or use it outside of alt:V?
No, creating your own cloud auth implementation is not possible.\
Our backend plays a key role in the process and for safety reasons, we do not disclose detailed information about its workings.\
This makes it impossible to reproduce an independent cloud auth system.

## Usage

[Player cloudID in JS API reference](https://docs.altv.mp/js/api/alt-server.Player.html#_altmp_altv_types_alt_server_Player_cloudID) <br>
[Player CloudId in C# API reference](https://docs.altv.mp/cs/api/AltV.Net.Elements.Entities.Player.html#AltV_Net_Elements_Entities_Player_CloudId) <br>
[IConnectionInfo cloudID in JS API reference](https://docs.altv.mp/js/api/alt-server.IConnectionInfo.html#_altmp_altv_types_alt_server_IConnectionInfo_cloudID) <br>
[IConnectionInfo CloudId in C# API reference](https://docs.altv.mp/cs/api/AltV.Net.Elements.Entities.IConnectionInfo.html#AltV_Net_Elements_Entities_IConnectionInfo_CloudId)

In case of successful authentication cloud id property returns non-empty string

In case of failure cloud id property returns an empty string, and result property returns error code

[Player cloudAuthResult in JS API reference](https://docs.altv.mp/js/api/alt-server.Player.html#_altmp_altv_types_alt_server_Player_cloudAuthResult) <br>
[Player CloudAuthResult in C# API reference](https://docs.altv.mp/cs/api/AltV.Net.Elements.Entities.Player.html#AltV_Net_Elements_Entities_Player_CloudAuthResult) <br>
[IConnectionInfo cloudAuthResult in JS API reference](https://docs.altv.mp/js/api/alt-server.IConnectionInfo.html#_altmp_altv_types_alt_server_IConnectionInfo_cloudAuthResult) <br>
[IConnectionInfo CloudAuthResult in C# API reference](https://docs.altv.mp/cs/api/AltV.Net.Elements.Entities.IConnectionInfo.html#AltV_Net_Elements_Entities_IConnectionInfo_CloudAuthResult)

## Possible errors:

- `NO_BENEFIT` - The server doesn't have the required benefit unlocked
- `VERIFY_FAILED` - Your server failed to retrieve player's cloud id from alt:V service for unknown reason

[Enum in JS API reference](https://docs.altv.mp/js/api/alt-server.CloudAuthResult.html)\
[Enum in C# API reference](https://docs.altv.mp/cs/api/AltV.Net.Data.CloudAuthResult.html)

## Example

```js
import * as alt from 'alt-server';

alt.on('playerConnect', (player) => {
    const result = player.cloudAuthResult;
    // 0 means success
    if (result !== 0) {
        alt.logError('Failed to authorize player:', player.name, 'error code:', result);
        return;
    }
    
    alt.log('Player:', player.name, 'connected with cloud id:', player.cloudID);
});
```
