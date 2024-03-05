# Voice API

alt:V comes with an built-in voice chat. In order to enable it, you need to create `voice` category in your `server.toml`. It can be empty for default voice settings.

For example:
> [!div class="nohljsln"]
> ```toml
> name = "My awesome server"
> 
> [voice]
> ```

## Voice channels

[VoiceChannel class in JS API reference](https://docs.altv.mp/js/api/alt-server.VoiceChannel.html)<br>
[VoiceChannel class in C# API reference](https://docs.altv.mp/cs/api/AltV.Net.Elements.Entities.VoiceChannel.html)<br>

To allow players to hear eachother you need to create a voice channel and add the players that should hear each other there.

If two players are in two different voice channels at the same time, category will be decided by `channel.priority`. If two channels are of same priority, non-spatial (2D) voice is selected.

### VoiceChannel constructor

The VoiceChannel class takes two arguments in it's constructor:
- `isSpatial` - is voice spatial (3D position based voice), setting false is useful for e.g. phone calls where exact position doesnt matter
- `maxDistance` - maximum distance at which player can be heard, set 0 for non-spatial voice


### Audio filters

You can apply audio filters to a voice channel object.

See [Audio filters](audio_filters.md) for more info.

```js
const voice = new alt.VoiceChannel(true, 15);
voice.filter = alt.hash('walkietalkie');
```

### Audio categories

You can set a custom audio category to a voice channel. In order to do that, you need to create an audio filter and set category on it.

See [Audio filters](audio_filters.md), audio category section for more info.

### Example

```js
const globalVoice = new alt.VoiceChannel(true, 15);

alt.on('playerConnect', (player) => {
  globalVoice.addPlayer(player);
});
```
