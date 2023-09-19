# Ped API

Since alt:V Update 15 you are able to create server side streamed & synchronized peds, often also referred as NPCs. These server side created peds can be controlled by assigning tasks to them on client side, which will then automatically be in sync with all players near.

> [!WARNING]
> These peds won't move and drive on their own, they need tasks assigned on client side to actually do something.
> For GTA Online similar behaviour, you will have to implement the logic on your own.

Use the convenient LocalPed class for spawning client side only peds, that other players won't see.

[LocalPed class in JS API reference](https://docs.altv.mp/js/api/alt-client.LocalPed.html)<br>
[LocalPed class in C# API reference](https://docs.altv.mp/cs/api/AltV.Net.Client.Elements.Entities.LocalPed.html)<br>

With default server configuration, up to 128 of the closest peds are streamed at the same time. The max streaming values can be edited in the server configuration.

> [!WARNING]
> Streamer entity pool of peds is the same used for streaming players. Regardless whether a ped is a NPC or player, the closest one will be streamed first.

See [server configuration](configs/server.md) [maxStreaming] section.

## Usage

[Ped class in JS API reference](https://docs.altv.mp/js/api/alt-server.Ped.html)<br>
[Ped class in C# API reference](https://docs.altv.mp/cs/api/AltV.Net.Elements.Entities.Ped.html)<br>

### Example

```js
// Create server side synced ped looking like a cow
let ped = new alt.Ped("A_C_Cow", new alt.Vector3(0,0,70), new.alt.Vector3(0,0,0));
```

To assign tasks, you'll need to apply them on the client side of the NetOwner.

```js
// server side
ped.netOwner.emit("ped_task", ped);

// client side
alt.onServer("ped_task", (ped) => {
   // Make the specified ped roam within a 10-meter radius of the given coordinates. It will always move at least 2 meters and pause for a minimum of 10 seconds.
   natives.taskWanderInArea(ped, 0, 0, 70, 10, 2, 10);
});
```