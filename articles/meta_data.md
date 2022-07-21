# Meta data

Meta data can be used to pass specific values between server & client (also called synced meta or local meta) or between
resources (global meta) and bind them to an entity or the respective side (server or client).
For example, the username of a player can be bound to it or the status of a siren to a vehicle (synced metas).
Likewise, data such as the current weather can also be bound to a resource as a meta so that other resources can query
this value (global meta).
These topics will be discussed in more detail in the respective subsections.

# Types

## Overview

| Type                 | Used on       | Availability (Set) | Availability (Get) | Description                                                                                                                                   |
|----------------------|---------------|--------------------|--------------------|-----------------------------------------------------------------------------------------------------------------------------------------------|
| Meta                 | Entities, Alt | Client & Server    | Client & Server    | The data is only available on the client or server side, depending on where it has been set.                                                  |
| Local Meta           | Player        | Server             | Client & Server    | The data is settable has to be set on a player. Only the client it has been set to can fetch the data.                                        | 
| (Global) Synced Meta | Entities, Alt | Server             | Client & Server    | The data is settable on every entity (player & vehicle). Every client can fetch the data.                                                     |
| Stream Synced Meta   | Entities      | Server             | Client & Server    | This is similar to the synced meta, but the data gets only transferred when the entity is in streaming range of the client fetching the data. |

## Usage

A meta is set by using the method setMeta on the class alt or an entity (player or vehicle).
The meta is only available on the same side that it has been set and can be fetched by all resources.

# [JS](#tab/tab1-0)

Applying a global meta

```js
// Set a global meta (single-sided, cross-resource) with a given key and value
alt.setMeta("metaKey", "metaValue");
// Check if the meta is set and log the result
if (alt.hasMeta("metaKey")) {
    alt.log("Meta is set");
} else {
    alt.log("Meta isn't set");
}
// Fetch and save the value of the meta
const metaValue = alt.getMeta("metaKey");
// Delete the meta
alt.deleteMeta("metaKey");
```

Applying a global meta bound to a entity

```js
alt.on("playerConnect", (player) => {
    // Set a player meta (single-sided, cross-resource) with a given key and value
    player.setMeta("username", player.name);
    // Check if the meta is set and log the result
    if (player.hasMeta("username")) {
        alt.log("Meta is set");
    } else {
        alt.log("Meta isn't set");
    }
    // Fetch and save the value of the meta
    const metaValue = player.getMeta("username");
    // Delete the meta
    player.deleteMeta("metaKey");
});
```

Listening for global meta changes

```js
alt.on("globalMetaChange", (key, newValue, oldValue) => {
    // This event gets called when a meta changes which is applied to alt
    // You can also check it yourself by using the alt.hasMeta & alt.getMeta methods
    if (alt.hasMeta("metaKey")) {
        const metaValue = alt.getMeta("metaKey");
        // <Do something with the value>
    }
});
```

# [C#](#tab/tab1-1)

Applying a global meta

```cs
// Set a global meta (single-sided, cross-resource) with a given key and value
Alt.SetMetaData("metaKey", "metaValue");
// Check if the meta is set and log the result
if (Alt.HasMetaData("metaKey"))
{
    Alt.Log("Meta is set");
}
else
{
    Alt.Log("Meta isn't set");
}
// Fetch and save the value of the meta
// When using C# it is required to pass the type of the meta value
var valueIsFetched = Alt.GetMetaData<string>("metaKey", out var metaData);
// Delete the meta
Alt.DeleteMetaData("metaKey");
```

Applying a global meta bound to a entity

```cs
Alt.OnPlayerConnect += (player, reason) =>
{
    // Set a player meta (single-sided, cross-resource) with a given key and value
    player.SetMetaData("username", player.Name);
    // Check if the meta is set and log the result
    if (player.HasMetaData("username"))
    {
        Alt.Log("Meta is set");
    }
    else
    {
        Alt.Log("Meta isn't set");
    }
    // Fetch and save the value of the meta
    // When using C# it is required to pass the type of the meta value
    var valueIsFetched = player.GetMetaData<string>("username", out var metaData);
    // Delete the meta
    player.DeleteMetaData("metaKey");
};
```

Listening for entity meta changes

```cs
Alt.OnMetaDataChange += (entity, key, value) =>
{
    // This event gets called when a meta changes which is applied to a entity
    // You can also check it yourself by using the entity.HasMetaData & entity.GetMetaData methods
    if (entity.HasMetaData("metaKey")) {
        var valueIsFetched = entity.GetMetaData<string>("metaKey", out var metaValue);
        // <Do something with the value>
    }
};
```
---

## Local Meta

A local meta is always set to a player instance and can only be modified on server-side.
This data is accessible from all resources, but on the client side only from the respective player on which the meta was
set.

# [JS](#tab/tab2-0)

**Server**

Applying a local meta bound to a entity

```js
alt.on("playerConnect", (player) => {
    // Set a player local meta (set by server, synced to server & client, cross-resource) with a given key and value
    player.setLocalMeta("username", player.name);
    // Check if the local meta is set and log the result
    if (player.hasLocalMeta("username")) {
        alt.log("Meta is set");
    } else {
        alt.log("Meta isn't set");
    }
    // Fetch and save the value of the local meta
    const metaValue = player.getMeta("username");
    // Delete the meta (only available on server)
    player.deleteLocalMeta("username");
});
```

Listening for local meta changes

```js
alt.on("localMetaChange", (player, key, oldValue, newValue) => {
    // This event gets called when a local meta changes
    // You can also check it yourself by using the player.hasLocalMeta & player.getLocalMeta methods
    if (player.hasLocalMeta("metaKey")) {
        const metaValue = player.getLocalMeta("metaKey");
        // <Do something with the value>
    }
});
```

**Client**

Checking if a local meta is set

```js
alt.on("spawned", () => {
    // Check if the local meta is set
    if (alt.hasLocalMeta("username")) {
        alt.log("Meta is set");
    } else {
        alt.log("Meta isn't set");
        return;
    }
    // Fetch and save the value of the local meta
    const metaValue = alt.getLocalMeta("username");
});
```

Listening for local meta changes

```js
alt.on("localMetaChange", (key, oldValue, newValue) => {
    // This event gets called when a local meta changes
    // You can also check it yourself by using the alt.hasLocalMeta & alt.getLocalMeta methods
    if (alt.hasLocalMeta("metaKey")) {
        const metaValue = alt.getLocalMeta("metaKey");
        // <Do something with the value>
    }
});
```

# [C#](#tab/tab2-1)

**Server**

Applying a local meta bound to a entity

```cs
Alt.OnPlayerConnect += (player, reason) =>
{
    // Set a player local meta (set by server, synced to server & client, cross-resource) with a given key and value
    player.SetLocalMetaData("username", player.Name);
    // Check if the local meta is set and log the result
    if (player.HasLocalMetaData("username"))
    {
        Alt.Log("Meta is set");
    }
    else
    {
        Alt.Log("Meta isn't set");
    }
    // Fetch and save the value of the local meta
    // When using C# it is required to pass the type of the meta value
    var valueIsFetched = player.GetLocalMetaData<string>("username", out var metaData);
    // Delete the meta
    player.DeleteLocalMetaData("username");
};
```
---

## Synced Meta

A synced meta is distributed to all resources & clients and can be used in the following ways:

- Global (applied to alt)
- Bound to an entity (applied to a player or vehicle)

# [JS](#tab/tab3-0)

**Server**

Applying a global synced meta

```js
// Set a global synced meta (server & client, cross-resource) with a given key and value
alt.setSyncedMeta("metaKey", "metaValue");
// Check if the meta is set and log the result
if (alt.hasSyncedMeta("metaKey")) {
    alt.log("Meta is set");
} else {
    alt.log("Meta isn't set");
}
// Fetch and save the value of the meta
const metaValue = alt.getSyncedMeta("metaKey");
// Delete the meta
alt.deleteSyncedMeta("metaKey");
```

Applying a global synced meta bound to a entity

```js
alt.on("playerConnect", (player) => {
    // Set a synced meta (server & client, cross-resource) with a given key and value 
    player.setSyncedMeta("metaKey", "metaValue");
    // Check if the meta is set and log the result
    if (player.hasSyncedMeta("metaKey")) {
        alt.log("Meta is set");
    } else {
        alt.log("Meta isn't set");
    }
    // Fetch and save the value of the meta
    const metaValue = player.getSyncedMeta("metaKey");
});
```

Listening for synced meta changes

```js
alt.on("syncedMetaChange", (entity, key, newValue, oldValue) => {
    // This event gets called when a synced meta changes which is applied to an entity  
    // You can also check it yourself by using the entity.hasSyncedMeta(key) method
    if (entity.hasSyncedMeta("metaKey")) {
        const metaValue = entity.getSyncedMeta("metaKey");
        // <Do something with the value>
    }
});
```

**Client**

Checking if global synced meta is set

```js
alt.on("spawned", () => {
    // Check if the global synced meta is set
    if (alt.hasSyncedMeta("metaKey")) {
        alt.log("Meta is set");
    } else {
        alt.log("Meta isn't set");
    }
    // Fetch and save the value of the meta
    const metaValue = alt.getSyncedMeta("metaKey");
});
```

Listening for global synced meta changes

```js
alt.on("globalSyncedMetaChange", (key, oldValue, newValue) => {
    // This event gets called when a synced meta changes which is applied to alt
    // You can also check it yourself by using the alt.hasSyncedMeta(key) method
    if (alt.hasSyncedMeta("metaKey")) {
        const metaValue = alt.getSyncedMeta("metaKey");
        // <Do something with the value>
    }
});
```

Listening for synced meta changes

```js
alt.on("syncedMetaChange", (entity, key, oldValue, newValue) => {
    // This event gets called when a synced meta changes which is applied to an entity  
    // You can also check it yourself by using the entity.hasSyncedMeta(key) method
    if (entity.hasSyncedMeta("metaKey")) {
        const metaValue = entity.getSyncedMeta("metaKey");
        // <Do something with the value>
    }
});
```

# [C#](#tab/tab3-1)

**Server**

Applying a global meta

```cs
Alt.OnPlayerConnect += (player, reason) =>
{
    // Set a player local meta (set by server, synced to server & client, cross-resource) with a given key and value
    player.SetLocalMetaData("username", player.Name);
    // Check if the local meta is set and log the result
    if (player.HasLocalMetaData("username"))
    {
        Alt.Log("Meta is set");
    }
    else
    {
        Alt.Log("Meta isn't set");
    }
    // Fetch and save the value of the local meta
    // When using C# it is required to pass the type of the meta value
    var valueIsFetched = player.GetLocalMetaData<string>("username", out var metaData);
    // Delete the meta
    player.DeleteMetaData("username");
};
```
---

## Stream Synced Meta

A synced meta is distributed to all resources & clients and can be used bound to an entity.
It is basically the same as a synced meta, but only gets send to clients in the streaming range of the entity.

# [JS](#tab/tab4-0)

**Server**

Applying a stream synced meta bound to a entity

```js
alt.on("playerConnect", (player) => {
    // Set a stream synced meta (server & client, cross-resource) with a given key and value 
    player.setStreamSyncedMeta("metaKey", "metaValue");
    // Check if the meta is set and log the result
    if (player.hasStreamSyncedMeta("metaKey")) {
        alt.log("Meta is set");
    } else {
        alt.log("Meta isn't set");
    }
    // Fetch and save the value of the meta
    const metaValue = player.getStreamSyncedMeta("metaKey");
    // Delete the meta
    player.deleteStreamSyncedMeta("metaKey");
});
```

Listening for stream synced meta changes

```js
alt.on("streamSyncedMetaChange", (entity, key, newValue, oldValue) => {
    // This event gets called when a stream synced meta changes which is applied to an entity  
    // You can also check it yourself by using the entity.hasStreamSyncedMeta(key) method
    if (entity.hasStreamSyncedMeta("metaKey")) {
        const metaValue = entity.getStreamSyncedMeta("metaKey");
        // <Do something with the value>
    }
});
```

**Client**

Checking if stream synced meta is set

```js
alt.on("spawned", () => {
    // Check if the global synced meta is set
    if (alt.hasSyncedMeta("metaKey")) {
        alt.log("Meta is set");
    } else {
        alt.log("Meta isn't set");
    }
    // Fetch and save the value of the meta
    const metaValue = alt.getSyncedMeta("metaKey");
});
```

Listening for stream synced meta changes

```js
alt.on("streamSyncedMetaChange", (entity, key, oldValue, newValue) => {
    // This event gets called when a synced meta changes which is applied to an entity  
    // You can also check it yourself by using the entity.hasSyncedMeta(key) method
    if (entity.hasSyncedMeta("metaKey")) {
        const metaValue = entity.getSyncedMeta("metaKey");
        // <Do something with the value>
    }
});
```

# [C#](#tab/tab4-1)

**Server**

Applying a stream synced meta bound to a entity

```cs
Alt.OnPlayerConnect += (player, reason) =>
{
    // Set a stream synced meta (set by server, synced to server & client, cross-resource) with a given key and value
    player.SetStreamSyncedMetaData("username", player.Name);
    // Check if the stream synced meta is set and log the result
    if (player.HasStreamSyncedMetaData("username"))
    {
        Alt.Log("Meta is set");
    }
    else
    {
        Alt.Log("Meta isn't set");
    }
    // Fetch and save the value of the stream synced meta
    // When using C# it is required to pass the type of the meta value
    var valueIsFetched = player.GetStreamSyncedMetaData<string>("username", out var metaData);
    // Delete the meta
    player.DeleteStreamSyncedMetaData("username");
};
```
---

## Remarks

> [!WARNING] 
> The meta change events are only called if the (new) data is not yet known to the client.
> If this data is already known, it must be queried & processed independently, for example via the gameEntityCreate event.

Let's take the example case of a **streamSyncedMeta** with the key `trackWidth`, which sets the track width of a vehicle.

The event `streamSyncedMetaChange` is only called here if the client does not yet know this value.\
If you now leave the streaming range and then return to it, the vehicle is created, but no 'streamSyncedMetaChange' event is triggered.\
To ensure that the values are always applied, the `gameEntityCreate` event must also be used.

Here is an example:

# [Server](#tab/tab5-0)

```js
const vehicle = new alt.Vehicle("t20", 0, 0, 72, 0, 0, 0);
vehicle.setStreamSyncedMeta("trackWidth", 0.85);
```

# [Client](#tab/tab5-1)

```js
// This is called when the meta is communicated to the client for the first time
alt.on("streamSyncedMetaChange", (entity, key, newValue, oldValue) => {
    if (key === "trackWidth") setTrackWidth(entity, newValue);
});

// This is called as soon as the vehicle is created on the client
// Here we check if the vehicle has the meta and if so process it
alt.on("gameEntityCreate", (entity) => {
    if (entity.hasStreamSyncedMeta("trackWidth")) {
        const trackWidth = entity.getStreamSyncedMeta("trackWidth");
        setTrackWidth(entity, trackWidth);
    }
});

// To avoid duplicating the code in both events we move it to its own function
function setTrackWidth(entity, trackWidth) {
    for (let i = 0; i < entity.wheelsCount; i++) {
        entity.setWheelTrackWidth(i, trackWidth);
    }
}
```