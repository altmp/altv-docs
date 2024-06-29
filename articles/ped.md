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

In this example, we are going to create a ped and make it wander around. We'll do this using the JavaScript API.

Server
```js
import alt from "alt-server";

// When some player connects
alt.on("playerConnect", (player) => {
  alt.log("Player connected:", player.name, "with assigned id:", player.id);

  // Spawn player at specific position and with "a_f_y_beach_02" model
  player.spawn("a_f_y_beach_02", new alt.Vector3(9.7, 26.3, 70.8));

  // Create a cat
  const model = "a_c_cat_01";
  const pos = new alt.Vector3(7.9, 28.8, 70.8);
  const rot = alt.Vector3.zero;
  const ped = new alt.Ped(model, pos, rot);

  // Set stream synced meta for client side to give wander task for this particular ped
  ped.setStreamSyncedMeta("giveWanderTask", true);
});
```

Client
```js
import alt from "alt-client";
import natives from "natives";

// If ped is spawned in the game and network owner is our local player give it wander task
alt.on("netOwnerChange", async (ped, netOwner) => {
  // Here `ped` is alt.Entity, so if its not alt.Ped we ignore it
  if (!(ped instanceof alt.Ped)) return;

  alt.log("netOwnerChange", {
    netOwner_name: netOwner?.name,
    ped_remoteID: ped.remoteID,
    ped_scriptID: ped.scriptID,
    giveWanderTask: ped.getStreamSyncedMeta("giveWanderTask"),
  });

  // If ped does not exists in the game we can't give it wander task
  if (!ped.isSpawned) return;

  giveSpawnedPedWanderTask(ped);
});

// If ped is spawned in the game and network owner is our local player give it wander task
// (we can't use netOwnerChange event alone because
// ped may not be spawned at the moment when netOwnerChange is triggered)
alt.on("gameEntityCreate", (ped) => {
  // Here `ped` is alt.Entity, so if its not alt.Ped we ignore it
  if (!(ped instanceof alt.Ped)) return;

  alt.log("gameEntityCreate", {
    netOwner_name: ped.netOwner?.name,
    ped_remoteID: ped.remoteID,
    ped_scriptID: ped.scriptID,
  });

  giveSpawnedPedWanderTask(ped);
});

function giveSpawnedPedWanderTask(ped) {
  // If network owner is not our player we ignore it
  if (ped.netOwner !== alt.Player.local) return;

  // Should we call wander task for this ped (set on server side)
  if (!ped.getStreamSyncedMeta("giveWanderTask")) return;

  alt.log("Giving wander task to ped:", {
    ped_remoteID: ped.remoteID,
    ped_scriptID: ped.scriptID,
  });

  // give wander task
  natives.taskWanderStandard(ped, 0, 0);
}
```

## Local Ped API

Its also possible to create local (client side only) peds that other players won't see.

### Usage

[LocalPed class in JS API reference](https://docs.altv.mp/js/api/alt-client.LocalPed.html)<br>
[LocalPed class in C# API reference](https://docs.altv.mp/cs/api/AltV.Net.Client.Elements.Entities.LocalPed.html)<br>

#### Example
Clothes shop preview.

```js
import alt from "alt-client";

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
import alt from "alt-client";

const model = "player_zero";
const dimension = alt.defaultDimension; // 0 dimension
const pos = new alt.Vector3(0, 0, 71);
const rot = alt.Vector3.zero;
const useStreaming = true;
const streamingDistance = 100; // customize for your needs

const ped = new alt.LocalPed(model, dimension, pos, rot, useStreaming, streamingDistance);

// Waiting until ped spawns for 5 seconds or rejecting current promise
// (timeout value is not required, 2 seconds by default in v15)
await ped.waitForSpawn(5000);

// ped.scripID is now valid and we can use it
alt.setPedDlcClothes(ped.scriptID, 0, 11, 1, 0);
```
