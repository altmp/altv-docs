# Audio filters

alt:V Audio and Voice APIs support custom filters. Filters should be created on client side and allow server developers to add effects such as distortion, compressor, echo etc.

## Usage

[AudioFilter class in JS API reference](https://docs.altv.mp/js/api/alt-client.AudioFilter.html)<br>

### Audio categories

You can set audio category on a filter. The category will only have effect for voice channels.

There are three default audio categories intended for voice provided by alt:V:
- `altv_voice_proximity`
- `altv_voice_megaphone`
- `altv_voice_whisper`

#### Example

```js
const walkieTalkieFilter = new AudioFilter('walkietalkie')
walkieTalkieFilter.addBqfEffect(0, 1400, 0, 0.86, 0, 0, 1);
walkieTalkieFilter.addBqfEffect(1, 900, 0, 0.83, 0, 0, 2);
walkieTalkieFilter.addDistortionEffect(0, -2.95, -0.05, -0.08, 0.5, 3);

const megaphoneFilter = new AudioFilter('megaphone');
megaphoneFilter.addBqfEffect(0, 2000, 0, 1, 0, 0, 1);
megaphoneFilter.addBqfEffect(1, 1000, 0, 0.86, 0, 0, 2);
megaphoneFilter.addDistortionEffect(0, -2.95, -0.05, -0.08, 0.25, 3);
megaphoneFilter.addCompressor2Effect(5, -15, 3, 10, 200, 4);
megaphoneFilter.audioCategory = 'altv_voice_megaphone';

const whisperFilter = new AudioFilter('whisper');
whisperFilter.audioCategory = 'altv_voice_whisper';
```

### Controlling volume
In case default volume of specific audio categories is too quiet, you can edit audio categories.

See [Audio category](https://docs.altv.mp/articles/audio.html#examples) for more info.