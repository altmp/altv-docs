# Ped API

Since alt:V Update 15 you are able to create server side streamed & synchronized peds, often also referred as NPCs. These server side created peds can be controlled by assigning tasks to them on client side, which will then automatically be in sync with all players near.

> [!WARNING]
> These peds won't move and drive on their own, they need tasks assigned on client side to actually do something.
> For GTA Online similar behaviour, you will have to implement the logic on your own.

With default server configuration, up to 128 of the closest peds are streamed at the same time. The max streaming values can be edited in the server configuration.

> [!WARNING]
> Streamer entity pool of peds is the same used for streaming players. Regardless whether a ped is a NPC or player, the closest one will be streamed first.

See [server configuration](configs/server.md) [maxStreaming] section.

<br>

> [!TIP]
> See <a href='https://forge.plebmasters.de/peds'>Pleb Masters: Forge</a> for a full list of all peds.

## Usage

[Ped class in JS API reference](https://docs.altv.mp/js/api/alt-server.Ped.html)<br>
[Ped class in C# API reference](https://docs.altv.mp/cs/api/AltV.Net.Elements.Entities.Ped.html)<br>

### Example

```js
//working example

////////////////////
//SERVERSIDE:
////////////////////
alt.on("playerConnect", (player) => {

    //spawn your own player
    player.spawn(7.904539108276367, 28.82634925842285, 70.866943359375, 0);

    //create serverside NPC (posX, posY, posZ, rotX, rotY, rotZ, steamingDistance)
    let ped = new alt.Ped("u_m_m_streetart_01", new alt.Vector3(9.717802047729492, 26.340801239013672, 70.81243896484375), new alt.Vector3(0, 0, 0), 200);

    //its important to wait until Ped is ready
    alt.setTimeout(() => {

        //then u set the netOwner
        ped.setNetOwner(alt.Player.all[0]);

        //then u emit the netOwner the walkaround task (server -> client)
        ped.netOwner.emit("ped_task", ped);

    }, 2500);

});

////////////////////
//CLIENTSIDE:
////////////////////
alt.onServer("ped_task", (ped) => {

    //just a debug message for the info if event is called
    alt.log(`ped_task taskWanderInArea was called for pedID: ${ped.scriptID}`);

    // Make the specified ped roam within a 10-meter radius of the given coordinates. It will always move to a random location inside the radius, while waiting a minimum of 2 and maximum of 10 seconds before moving.
    //taskWanderInArea: ped: Ped | x: float | y: float | z: float | radius: float | minimalLength: float | timeBetweenWalks: float
    native.taskWanderInArea(ped, 9.717802047729492, 26.340801239013672, 70.81243896484375, 10, 2, 10);

});
```

## Local Ped API

Its also possible to create local (clientside only) peds that other players won't see.

### Usage

[LocalPed class in JS API reference](https://docs.altv.mp/js/api/alt-client.LocalPed.html)<br>
[LocalPed class in C# API reference](https://docs.altv.mp/cs/api/AltV.Net.Client.Elements.Entities.LocalPed.html)<br>

#### Example
Clothes shop preview.

```js
// We don't need streaming enabled
// because we need to use ped immediately
const useStreaming = false;

const player = alt.Player.local;

const ped = new alt.LocalPed(player.model, player.dimension, player.pos, player.rot, useStreaming);

// More on that below
alt.Utils.assert(ped.scriptID !== 0);

// Copying appearance, clothes etc. of player to the ped
native.clonePedToTarget(player, ped);

// Now we can change clothes of ped
alt.setPedDlcClothes(ped.scriptID, 0, 11, 1, 0);
```

> [!WARNING]
> It is important to note that the ped may not be spawned immediately due to model loading or streaming, in the above example the ped is spawned immediately (supposedly, that's why we have an `alt.Utils.assert`) because the player model is already loaded and streaming is disabled.

Waiting for ped to spawn due to model loading and streaming.
```js
const model = "player_zero";
const dimension = alt.defaultDimension; // 0 dimension
const pos = new alt.Vector3(0, 0, 71);
const rot = alt.Vector3.zero;
const useStreaming = true;

const ped = new alt.LocalPed(model, dimension, pos, rot, useStreaming);

// Waiting until ped spawns for 5 seconds or rejecting current promise
// (timeout value is not required, 2 seconds by default in v15)
await ped.waitForSpawn(5000);

// ped.scripID is now valid and we can use it
alt.setPedDlcClothes(ped.scriptID, 0, 11, 1, 0);
```
