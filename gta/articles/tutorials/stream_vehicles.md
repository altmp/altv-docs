# Stream Vehicles
This tutorial will show, how to add custom vehicles to your server.

For this tutorial we will use [https://www.gta5-mods.com/vehicles/pfister-meteor-add-on Meteor by Vanillaworks-Team].
## Suggested tools ##
* [OpenIV](https://openiv.com/)
* [Codewalker](https://www.gta5-mods.com/tools/codewalker-gtav-interactive-3d-map)
* [Template for fast creating](https://github.com/Carbon-Open-Source-Factory/addon_vehicle_template)

## Creating the resources
1. Open ```dlc.rpf``` or any other ```*.rpf``` archive with one of suggested tools.
2. You can drag and drop the files to extract the archive like below.
3. Place all ```ytd```, ```yft```, ```ydd``` and other assets in one folder to load them all with one wildcard (you can split it in subfolders).<ref>The safe maximum size of a .ytd / ytf file is 16 MB.</ref>
4. You also need to describe each meta file.<ref>.meta files are XML files. It's required to not break the XML formatting, otherwise it will cause problems. They're easily openable with every texteditor around.</ref>


## Folder Structure

![](./../../images/stream_vehicles/Stream_Vehicles-FolderStructure.png)


## **resource.cfg**
```
type: dlc,
main: stream.cfg,
client-files: [
	stream/*
]
```

## **stream.cfg**
```
files: [
	stream/assets/*
]
meta: {
	stream/vehicles.meta: VEHICLE_METADATA_FILE
	stream/carvariations.meta: VEHICLE_VARIATION_FILE
	stream/handling.meta: HANDLING_FILE
	stream/carcols.meta: CARCOLS_FILE
	stream/audio/sfx/dlc_meteor: AUDIO_WAVEPACK
	stream/audio/meteor_game.dat: AUDIO_GAMEDATA
	stream/audio/meteor_sounds.dat: AUDIO_SOUNDDATA
	stream/audio/meteor_amp.dat: AUDIO_SYNTHDATA
}
```

# Final touch
Add the ```meteor``` to the resource list inside the ```server.cfg``` file.<ref>meteor stands for the resource name which is represented by your folder name.</ref><br><br>
Resource names <strong>aren't</strong> case sensitive!


### Tips
1. Additional Data files can be found [https://wiki.altv.mp/wiki/GTA:Data_files here], which may be needed for other mods.<br>
2. If you're interested of displaying the actual vehicle name. You can do so by adding an entry into the stream.cfg<ref>0x12345 stands for the [https://wiki.altv.mp/wiki/Scripting:Joaat JOAAT Hash] of the gameNameEntry inside the vehicle.meta, replaced with the actual "vehicle name".</ref> <br>

```
meta: {
	...
}
gxt: {
	0x12345 : "vehicle name"
}
```

## Sample file
Virus Scan: https://www.virustotal.com/gui/url/8bdb9b4319493b298ae5a38631e253d478c79e58476ebd55a599dad3f6cb555c/detection

File: https://www.mediafire.com/file/i09jha5h3gy8kt5/car_lowbike.zip/file
