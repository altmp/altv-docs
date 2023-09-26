# Object API

Since alt:V Update 15 you are able to create server side streamed & synchronized objects. These server side created objects are dynamic and will be synced with full physics to all players near.

> [!WARNING]
> Only use them when physics are necessary, as they can significantly impact your server performance and overall traffic.
> 
> Use client side created LocalObject for static objects that don't need any physics to be synced across near players.

[LocalObject class in JS API reference](https://docs.altv.mp/js/api/alt-client.LocalObject.html)<br>
[LocalObject class in C# API reference](https://docs.altv.mp/cs/api/AltV.Net.Client.Elements.Entities.LocalObject.html)<br>

With default server configuration, up to 120 of the closest objects are streamed at the same time. The max streaming values can be edited in the server configuration.

See [server configuration](configs/server.md) [maxStreaming] section.

<br>

> [!TIP]
> See <a href='https://forge.plebmasters.de/objects'>Pleb Masters: Forge</a> for a full list of all objects.

## Usage

[Object class in JS API reference](https://docs.altv.mp/js/api/alt-server.Object.html)<br>
[Object class in C# API reference](https://docs.altv.mp/cs/api/AltV.Net.Elements.Entities.Object.html)<br>

### Example

```js
// Create physics synchronized soccer ball
let object = new alt.Object("p_ld_soc_ball_01",  new alt.Vector3(0,0,71), new alt.Vector3(0,0,0));
```
