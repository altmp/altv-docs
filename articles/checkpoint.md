# Checkpoint API

Since alt:V Update 15 there is a class for creating client side checkpoints. These client side checkpoints are easier to create and use, as they are automatically streamed on client side.

## Usage

[Checkpoint class in JS API reference](https://docs.altv.mp/js/api/alt-client.Checkpoint.html)<br>
[Checkpoint class in C# API reference](https://docs.altv.mp/cs/api/AltV.Net.Client.Elements.Entities.Checkpoint.html)<br>

> [!TIP]
> Checkpoints inherit the [ColShape class](https://docs.altv.mp/js/api/alt-client.Colshape.html), thus colShape events work on it aswell.

### Example

This example changes the Checkpoint Color to green when the local Player enters it. When the local Player is not inside of it, the checkpoint color will be red. 

<img src="https://i.imgur.com/Fb8c07U.png">
<img src="https://i.imgur.com/QQlM132.png">

```js
alt.on('consoleCommand', commandName => {
    if (commandName !== 'addcp') return;

    const iconColor = new alt.RGBA(255, 255, 255, 100);
    const pos = alt.Player.local.pos.sub(0, 0, 1);
    const nextPos = pos.add(2, 1, 0);

    new alt.Checkpoint(2, pos, nextPos, 1, 2, new alt.RGBA(255, 0, 0, 100), iconColor, 100);
});

function handleCheckpointEnterLeave(checkpoint, entity, state) {
    if (entity !== alt.Player.local) return;

    checkpoint.color = state ? new alt.RGBA(0, 255, 0, 100) : new alt.RGBA(255, 0, 0, 100);
}

alt.on('entityEnterColshape', (colShape, entity) => {
    if (!(colShape instanceof alt.Checkpoint)) return;

    handleCheckpointEnterLeave(colShape, entity, true);
});

alt.on('entityLeaveColshape', (colShape, entity) => {
    if (!(colShape instanceof alt.Checkpoint)) return;

    handleCheckpointEnterLeave(colShape, entity, false);
});
```