# Virtual Entity API

In alt:V Update 15 we have added the virtual entity API. It provides you an easy way to synchronize your own entities, for example take a look at [this demo](https://discord.com/channels/371265202378899476/384874419446743041/1106288579598110741), fire particles there are virtual entities.

## Usage

Server Side

[VirtualEntity class in JS API reference](https://docs.altv.mp/js/api/alt-server.VirtualEntity.html)<br>
[VirtualEntityGroup class in JS API reference](https://docs.altv.mp/js/api/alt-server.VirtualEntityGroup.html)<br>
[VirtualEntity class in C# API reference](https://docs.altv.mp/cs/api/AltV.Net.Elements.Entities.VirtualEntity.html)<br>
[VirtualEntityGroup class in C# API reference](https://docs.altv.mp/cs/api/AltV.Net.Elements.Entities.VirtualEntityGroup.html)<br>

Client Side

[VirtualEntity class in JS API reference](https://docs.altv.mp/js/api/alt-client.VirtualEntity.html)<br>
[VirtualEntityGroup class in JS API reference](https://docs.altv.mp/js/api/alt-client.VirtualEntityGroup.html)<br>
[VirtualEntity class in C# API reference](https://docs.altv.mp/cs/api/AltV.Net.Client.Elements.Entities.VirtualEntity.html)<br>
[VirtualEntityGroup class in C# API reference](https://docs.altv.mp/cs/api/AltV.Net.Client.Elements.Entities.VirtualEntityGroup.html)<br>

API consists of two classes: group and entity.<br>

- Group is necessary to set the max number of entities per player stream.<br>
- Entity is assigned to a group.<br>

### What is "max number of entities per player stream"?<br>

Consider an example: we have balls as virtual entities, there are 100 virtual entities around the player in the game, if we set max number of entities to 3, the player will only see 3 closest.

<img src="https://i.imgur.com/yUZKwQQ.png" width="400px"/>

Yellow balls are virtual entities that are streamed to the player.<br>
Green circle is streaming range of balls (in this example, all balls have the same streaming distance).<br>
Blue arrow is streaming distance.

### Example

In this example, we are going to synchronize the Casino Lucky Wheel. We'll do this using the JavaScript API.

Server

```js
import alt from 'alt-server';

// There can only be one lucky wheel on the server
const maxEntitiesInStream = 1;

const luckyWheelGroup = new alt.VirtualEntityGroup(maxEntitiesInStream);

const pos = new alt.Vector3(0, 5, 72);
const streamingDistance = 100;
// Initial stream synced meta
const initialData = {
    // Most likely in your gamemode you will create different types of virtual entities
    type: 'luckyWheel',
};
const entity = new alt.VirtualEntity(luckyWheelGroup, pos, streamingDistance, initialData);

// Spinning wheel every 5 seconds
alt.setInterval(async () => {
    entity.setStreamSyncedMeta('spinStartTime', alt.getNetTime());
    await alt.Utils.wait(2000);
    entity.deleteStreamSyncedMeta('spinStartTime');
}, 5_000);

// We can also set dimension if needed
// entity.dimension = 123;

// Or hide entity from all players
// entity.visible = false;
```

Client

```js
import alt from 'alt-client';

// alt.LocalObject or null
let luckyWheelObject = null;
// alt.Utils.EveryTick or null
let currentSpinTick = null;

const isItLuckyWheel = (object) => {
    // If its not virtual entity ignore it
    if (!(object instanceof alt.VirtualEntity)) return false;

    // Initial stream synced meta we set on server
    if (object.getStreamSyncedMeta('type') !== 'luckyWheel') return false;

    return true;
};

const startSpin = (startSpinTime) => {
    alt.log('Lucky wheel start spin time:', startSpinTime);

    currentSpinTick = new alt.Utils.EveryTick(() => {
        const currentSpinTime = (alt.getNetTime() - startSpinTime);

        // Spin is already over
        if (currentSpinTime > 2000) {
            currentSpinTick.destroy();
            currentSpinTick = null;

            luckyWheelObject.rot = alt.Vector3.zero;
            return;
        }

        let currentNormalized = currentSpinTime / 2000;
        let degrees = currentNormalized * 360;

        luckyWheelObject.rot = new alt.Vector3(0, degrees, 0).toRadians();
    })
}

alt.on('worldObjectStreamIn', (object) => {
    if (!isItLuckyWheel(object)) return;

    alt.log('Lucky wheel stream in');

    // Make sure we don't have object already created
    alt.Utils.assert(luckyWheelObject == null);

    const rot = alt.Vector3.zero;
    luckyWheelObject = new alt.LocalObject('vw_prop_vw_luckywheel_02a', object.pos, rot);

    const spinStartTime = object.getStreamSyncedMeta('spinStartTime');
    if (spinStartTime == null) return;
    startSpin(spinStartTime);
})

alt.on('worldObjectStreamOut', (object) => {
    if (!isItLuckyWheel(object)) return;

    alt.log('Lucky wheel stream out');

    luckyWheelObject?.destroy();
    luckyWheelObject = null;
    currentSpinTick?.destroy();
    currentSpinTick = null;
})

alt.on('streamSyncedMetaChange', (object, key, value) => {
    if (!isItLuckyWheel(object)) return;

    // Make sure we have object created
    alt.Utils.assert(luckyWheelObject != null);

    alt.log('Lucky wheel change', { key: value });

    switch (key) {
        case 'spinStartTime':
            // Value was deleted
            if (value == null) return;

            startSpin(value);
            break;
        case 'type':
            // ignoring it
            break;
        default:
            alt.logError('Lucky wheel unknown stream synced meta change key:', key);
    }
});
```
