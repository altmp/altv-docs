# Audio filters

alt:V Audio and Voice APIs support custom filters. Filters should be created on client and allow server developers to add such effects as distortion, compressor, echo etc.

## Usage

[AudioFilter class in JS API reference](https://docs.altv.mp/js/api/alt-client.AudioFilter.html)<br>

### Audio categories

You can set audio category on a filter. The category will only have effect for voice channels.

There are three default audio categories intended for voice provided by alt:V:
- `altv_voice_proximity`
- `altv_voice_megaphone`
- `altv_voice_whisper`

## Example

```js
const filter = new AudioFilter('walkietalkie')
filter.addBqfEffect(0, 1400, 0, 0.86, 0, 0, 1);
filter.addBqfEffect(1, 900, 0, 0.83, 0, 0, 2);
filter.addDistortionEffect(0, -2.95, -0.05, -0.08, 0.5, 3);

const filter2 = new AudioFilter('megaphone');
filter2.addBqfEffect(0, 2000, 0, 1, 0, 0, 1);
filter2.addBqfEffect(1, 1000, 0, 0.86, 0, 0, 2);
filter2.addDistortionEffect(0, -2.95, -0.05, -0.08, 0.25, 3);
filter2.addCompressor2Effect(5, -15, 3, 10, 200, 4);
filter2.audioCategory = 'altv_voice_megaphone';

const filter3 = new AudioFilter('whisper');
filter3.audioCategory = 'altv_voice_whisper';
```