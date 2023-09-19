# Audio API

In alt:V there's an API that allows server developers to play sounds (remote or local) or audio streams (remote) in world through GTA sound system. This allows to play sounds with spatial and environmental effects without need to load them via modding.

The system also supports custom filters (see [Voice docs](voice.md)) and GTA audio categories.

## Usage

[Audio class in JS API reference](https://docs.altv.mp/js/api/alt-client.Audio.html)<br>
[AudioOutputWorld class in JS API reference](https://docs.altv.mp/js/api/alt-client.AudioOutputWorld.html)<br>
[AudioOutputAttached class in JS API reference](https://docs.altv.mp/js/api/alt-client.AudioOutputAttached.html)<br>
[AudioOutputFrontend class in JS API reference](https://docs.altv.mp/js/api/alt-client.AudioOutputFrontend.html)<br>

[Audio class in C# API reference](https://docs.altv.mp/cs/api/AltV.Net.Client.Elements.Entities.Audio.html)<br>
[AudioOutputWorld class in C# API reference](https://docs.altv.mp/cs/api/AltV.Net.Client.Elements.Entities.AudioOutputWorld.html)<br>
[AudioOutputAttached class in C# API reference](https://docs.altv.mp/cs/api/AltV.Net.Client.Elements.Entities.AudioOutputAttached.html)<br>
[AudioOutputFrontend class in C# API reference](https://docs.altv.mp/cs/api/AltV.Net.Client.Elements.Entities.AudioOutputFrontend.html)<br>

In order to use Audio API you need to create Audio instance and add one or multiple audio outputs to it.

### Audio outputs

There are three types of audio outputs in alt:V API:

- `AudioOutputWorld` - outputs audio on a specified world coordinates
- `AudioOutputAttached` - outputs audio from specified entity
- `AudioOutputFrontend` - outputs audio on a local player (non-spatial, no environmental effects)

By default all outputs use `radio` audio category.

### Audio constructor

Constructor of the Audio class accepts three arguments:

- `source` - path to the audio file, supports:
  - `/path/to/file` - path to file in current resource
  - `@assetname/path/to/file` - path to file in [asset pack](resources.md#asset-pack)
  - `https://example.com/path/to/file` - path to a remote file

- `volume` - volume of the audio, value between 0 and 1
- `radio` - whether the file is an endless audio stream (e.g. web radio)

### Audio filters

You can apply audio filters to an audio output object.
See [Audio filters](audio_filters.md) for more info.

```js
const output = new alt.AudioOutputAttached(alt.Player.local);
output.filter = alt.hash('walkietalkie');
```

## Example

```js
const output = new alt.AudioOutputAttached(alt.Player.local);
// const output = new alt.AudioOutputFrontend();
// const output = new alt.AudioOutputWorld(new alt.Vector3(0, 0, 71));

const audio = new alt.Audio("https://upload.wikimedia.org/wikipedia/commons/c/c8/Example.ogg");

audio.on("inited", () => { alt.log(`inited`); });
audio.on("streamStarted", () => { alt.log(`streamStarted`); });
audio.on("streamEnded", () => { alt.log(`streamEnded`); });
audio.on("streamPaused", () => { alt.log(`streamPaused`); });
audio.on("streamReset", () => { alt.log(`streamReset`); });
audio.on("streamSeek ", (time) => { alt.log(`streamSeek: ${time}`); });
audio.on("volumeChange ", (vol) => { alt.log(`volumeChange: ${vol}`); });
audio.on("error", (code, message) => { alt.log(`error: ${code} | ${message}`); });

audio.addOutput(output);
audio.play();
```


> [!WARNING]
> Don't forget to destroy both Audio and all unused AudioOutputs after you're done with your sound!

# Audio categories

GTA has an audio category system, which defines basic audio parameters like volume, distance, etc. Audio categories are located in `categories.dat22.rel` file.

While it's possible to stream your own category file (`audio:/config/categories.dat22.rel`, see [Replacements docs](resources.md#replacements) for more info), you can modify existing categories (e.g. unused ones) on runtime using AudioCategory API.

[AudioCategory class in JS API reference](https://docs.altv.mp/js/api/alt-client.AudioCategory.html)<br>
[AudioCategory class in C# API reference](https://docs.altv.mp/cs/api/AltV.Net.Client.Elements.Data.AudioCategory.html)<br>

## Examples

Change volume of all `radio` sounds.
```js
const category = alt.AudioCategory.getForName("radio");
category.volume = 10;
```

Repurpose unused category to use in your own sounds, for example to have a radio like audio category that is much louder.

Audio categories starting with `video_editor_*` are in most cases unused and can be used for this.

```js
const radio = alt.AudioCategory.getForName("radio"); // Using the game radio audio category as source
const category = alt.AudioCategory.getForName("video_editor_weapons_guns_bullet_impacts"); // This will be our target 'custom' audio category

category.volume = 1000;
category.distanceRolloffScale = radio.distanceRolloffScale;
category.plateauRolloffScale = radio.plateauRolloffScale;
category.occlusionDamping = radio.occlusionDamping;
category.environmentalFilterDamping = radio.environmentalFilterDamping;
category.sourceReverbDamping = radio.sourceReverbDamping;
category.distanceReverbDamping = radio.distanceReverbDamping;
category.interiorReverbDamping = radio.interiorReverbDamping;
category.environmentalLoudness = radio.environmentalLoudness;
category.underwaterWetLevel = radio.underwaterWetLevel;
category.stonedWetLevel = radio.stonedWetLevel;
category.pitch = radio.pitch;
category.lowPassFilterCutoff = radio.lowPassFilterCutoff;
category.highPassFilterCutoff = radio.highPassFilterCutoff;

// Lets use our 'custom' audio category to play audio
const output = new alt.AudioOutputFrontend("video_editor_weapons_guns_bullet_impacts");
const audio = new alt.Audio("https://upload.wikimedia.org/wikipedia/commons/c/c8/Example.ogg");
audio.addOutput(output);
audio.play();
```

You can find list of all available categories in [AudioCategories enum](https://docs.altv.mp/js/api/alt-client.AudioCategories.html)

See [Audio filters](audio_filters.md) for alt:V Voice examples using audio categories.