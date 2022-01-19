# Player connection queue

This article will explain the player connection queue added in the 9.0 update.

## What is a connection queue

Due to the current underlying networking, each player in the queue will actually occupy a slot and increase the player count.
When the player queue is activated, the playerConnect event is triggered once the connection has been accepted.
The connection queue will place the players attempting to connect to the server in a queue. You can then accept or decline the upcoming connection at any moment.

## Usage

### Config

You have to set / add the following field in your server.cfg
```json
connectionQueue: 'true'
```

### Player queue events

The connectionQueueRemove event is triggered when you accept / decline the connection or when the player disconnects by canceling the connection.

| Event Name                 | Description                                                   |
| --------------------- | ------------------------------------------------------------------ |
| connectionQueueAdd    | Event triggered once a player is added to the connection queue     |
| connectionQueueRemove | Event triggered once a player is removed from the connection queue |

### ConnectionInfo

You have access to a connection info class instance as the first parameter of the ``connectionQueueAdd`` and ``connectionQueueRemove`` events.

Connection info functions

| Function Name                  | Description                                                          |
| ------------------------------ | -------------------------------------------------------------------- |
| connectionInfo.accept()        | Accept the player connection to the server.                          |
| connectionInfo.decline(reason) | Decline the player connection to the server with an optional reason. |

Connection info properties

| Property Name               | Description                                           |
| --------------------------- | ----------------------------------------------------- |
| connectionInfo.name         | Player name.                                          |
| connectionInfo.socialID     | Player socialID.                                      |
| connectionInfo.ip           | Player IP adress.                                     |
| connectionInfo.hwidHash     | Player hwidHash.                                      |
| connectionInfo.hwidExHash   | Player hwidExHash.                                    |
| connectionInfo.authToken    | Player auth token if early auth was used.             |
| connectionInfo.isDebug      | Wether or not the player client is in debug mode.     |
| connectionInfo.branch       | Player client branch.                                 |
| connectionInfo.build        | Player client build.                                  |
| connectionInfo.cdnUrl       | CDN url if used.                                      |
| connectionInfo.passwordHash | Password hash entered in the server connection modal. |

### Script usage

# [Javascript](#tab/tabid-1)

```js
async function getDataFromDatabase() {
    return new Promise(resolve => setTimeout(resolve(true), 5000));
}

async function processPlayerInQueue(connectionInfo) {
    if (await getDataFromDatabase());
        connectionInfo.accept();
}

alt.on('connectionQueueAdd', processPlayerInQueue);
alt.on('connectionQueueRemove', (connectionInfo) => {
    console.log("Player removed from the queue, even if I accept the connection now it's handled!");
});
```

# [Typescript](#tab/tabid-2)

```ts
async function getDataFromDatabase(): Promise<true> {
    return new Promise(resolve => setTimeout(resolve(true), 5000));
}

async function processPlayerInQueue(connectionInfo: alt.ConnectionInfo): Promise<void> {
    if (await getDataFromDatabase());
        connectionInfo.accept();
}

alt.on('connectionQueueAdd', processPlayerInQueue);
alt.on('connectionQueueRemove', (connectionInfo: alt.ConnectionInfo) => {
    console.log("Player removed from the queue, even if I accept the connection now it's handled!");
});
```

# [C#](#tab/tabid-3)

```csharp
```