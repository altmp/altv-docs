# Parachute sync

Since v15 alt:V has parachute sync.

<iframe width="1280" height="720" src="https://www.youtube-nocookie.com/embed/Q2ltqCsZTPI" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## How to use

Object sync is disabled by default, in order to enable it add two event listeners to your server-side code, in JS there are [`clientDeleteObject`](https://docs.altv.mp/js/api/alt-server.IServerEvent.html#_altmp_altv_types_alt_server_IServerEvent_clientDeleteObject) and [`clientRequestObject`](https://docs.altv.mp/js/api/alt-server.IServerEvent.html#_altmp_altv_types_alt_server_IServerEvent_clientRequestObject).

### JS example

```js
import * as alt from "alt-server";

alt.on("clientRequestObject", (player, model, position) => {
    alt.log("Client:", player.name, "requesting object:", model, position);

    // you can cancel it if needed
    // return false;
});

alt.on("clientDeleteObject", (player) => {
    alt.log("Client:", player.name, "deleting object");

    // this one is also cancellable
    // return false;
});
```
