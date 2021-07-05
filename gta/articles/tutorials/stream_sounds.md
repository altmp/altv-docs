# Stream Sounds
This tutorial show, how to replace default sound for your server.

## Suggested tools 
- [OpenIV](https://openiv.com/)
#

## Creating the resources
1. Get any custom sound on mods website.
2. If they are in a ```dlc.rpf```, open it with the suggested tools and find ```.awc``` files.
3. Now follow the Folder structure below.

## Folder Structure

```
soundtutorial/
├─ stream/
│  ├─ x64/
│  │  ├─ audio/
│  │  │  ├─ sfx/
│  │  │  │  ├─ resident/
│  │  │  │  │  ├─ example_sirens.awc
│  │  │  │  ├─ animals/
│  │  │  │  │  ├─ example_animal.awc
│  │  │  │  ├─ weapons_player/
│  │  │  │  │  ├─ example_smg_sound.awc
├─ resource.cfg
├─ stream.cfg
```

## **Resource.cfg**

```
type: dlc,
main: stream.cfg,

client-files: [
  stream/*
]
```

## **Stream.cfg**

```
files: [
]

meta: {
  	stream/x64/audio/sfx/resident: AUDIO_WAVEPACK
  	stream/x64/audio/sfx/weapons_player: AUDIO_WAVEPACK
	stream/x64/audio/sfx/animals: AUDIO_WAVEPACK
}
```

You will need to enter the correct name of each basic sound resource in gta (resident, weapons_player, animals etc....)
