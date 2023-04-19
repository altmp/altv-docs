# 元数据  

元数据可用于在服务器和客户端之间传递特定的值(也称为同步元数据或本地元数据),或在资源之间(全局元数据)绑定到一个实体或相应的一方(服务器或客户端)。  
例如,玩家的用户名可以绑定到它,或者警报器的状态绑定到一辆车(同步元数据)。  
同样,像当前天气这样的数据也可以绑定到资源作为元数据,以便其他资源可以查询这个值(全局元数据)。  
这些主题将在各自的子部分中更详细地讨论。

<iframe width="1280" height="720" src="https://www.youtube-nocookie.com/embed/4oQTVkx5GA0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

# 类型

## 概览  

| 类型                 |  使用对象      | 可用性(设置) | 可用性(获取) | 描述                                                                                                                                   |
|----------------------|---------------|--------------------|--------------------|-----------------------------------------------------------------------------------------------------------------------------------------------|
| 元数据            | 实体,Alt | 客户端和服务器    | 客户端和服务器    | 数据只在设置它的客户端或服务器端可用。             |  
| 本地元数据           | 玩家        | 服务器             | 客户端和服务器    | 数据是设置在玩家身上的。只有设置它的客户端可以获取数据。    |  
| (全局)同步元数据 | 实体,Alt | 服务器             | 客户端和服务器    | 数据可以在每个实体(玩家和车辆)上设置。每个客户端都可以获取数据。    |
| 流同步元数据   | 实体      | 服务器             | 客户端和服务器    | 这与同步元数据类似,但数据仅在实体处于客户端获取数据的流范围内时传输。 |

## 用法  

元数据是使用 alt 类或实体(玩家或车辆)上的 setMeta 方法设置的。  
元数据只在设置它的同一侧可用,并且可以由所有资源获取。

# [JS](#tab/tab1-0)

应用全局元数据

```js
// 使用给定的键和值设置全局元数据(单侧,跨资源)  
alt.setMeta("metaKey", "metaValue");
// 检查元数据是否设置并记录结果
if (alt.hasMeta("metaKey")) {
    alt.log("元数据被设置"); 
} else {
    alt.log("元数据未设置");
}
// 获取并保存元数据的值
const metaValue = alt.getMeta("metaKey");  
// 删除元数据
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

# [TS](#tab/tab1-1)

Meta declaration in the interface (can be added to .ts or .d.ts file)

```ts
declare module "alt-shared" {
  // extending interface by interface merging
  export interface ICustomGlobalMeta {
    metaKey: string
  }
}
```

The usage is the same as in JS:

**Server & Client**

```ts
const metaValue /* string | undefined */  = alt.getMeta("metaKey");
```

# [C#](#tab/tab1-2)

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
    const metaValue = player.getLocalMeta("username");
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

# [TS](#tab/tab2-1)

Meta declaration in the interface (can be added to .ts or .d.ts file)

```ts
declare module "alt-shared" {
  // extending interface by interface merging
  export interface ICustomPlayerLocalMeta {
    username: string
  }
}
```

The usage is the same as in JS:

**Server**

```ts
const metaValue /* string | undefined */ = player.getLocalMeta("username");
```

**Client**

```ts
const metaValue /* string | undefined */ = alt.getLocalMeta("username");
```

# [C#](#tab/tab2-2)

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

# [TS](#tab/tab3-1)

Meta declaration in the interface (can be added to .ts or .d.ts file)

```ts
declare module "alt-shared" {
  // extending interface by interface merging

  export interface ICustomGlobalSyncedMeta {
    globalMetaKey: string
  }

  export interface ICustomPlayerSyncedMeta {
    playerMetaKey: string
  }
}
```

The usage is the same as in JS:

**Server & Client**

```ts
const globalMetaValue /* string | undefined */ = alt.getSyncedMeta("globalMetaKey");
const playerMetaValue /* string | undefined */ = player.getSyncedMeta("playerMetaKey");
```

# [C#](#tab/tab3-2)

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

Listening for stream synced meta changes (basically the same as on the server side)

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

# [TS](#tab/tab4-1)

Meta declaration in the interface (can be added to .ts or .d.ts file)

```ts
declare module "alt-shared" {
  // extending interface by interface merging

  // alt.Player and alt.Vehicle
  export interface ICustomEntityStreamSyncedMeta {
    entityMetaKey: string
  }

  // only alt.Player
  export interface ICustomPlayerStreamSyncedMeta {
    playerMetaKey: number
  }

  // only alt.Vehicle
  export interface ICustomVehicleStreamSyncedMeta {
    vehicleMetaKey: boolean
  }
}
```

The usage is the same as in JS:

**Server & Client**

```ts
const entityMetaValue /* string | undefined */ = entity.getSyncedMeta("entityMetaKey");
const playerMetaValue /* number | undefined */ = player.getSyncedMeta("playerMetaKey");
const vehicleMetaValue /* boolean | undefined */ = vehicle.getSyncedMeta("vehicleMetaKey");
```

# [C#](#tab/tab4-2)

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

// If applicable, the `gameEntityDestroy` event can be used to undo changes that should only exist as long as the entity exists.
alt.on("gameEntityDestroy", (entity) => {
   // Remove meta changes for example 
});

// To avoid duplicating the code in both events we move it to its own function
function setTrackWidth(entity, trackWidth) {
    for (let i = 0; i < entity.wheelsCount; i++) {
        entity.setWheelTrackWidth(i, trackWidth);
    }
}
```
