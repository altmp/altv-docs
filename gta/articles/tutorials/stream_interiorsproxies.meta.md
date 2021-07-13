# Stream Interiorproxies.meta Files
This Tutorial will show you, how to stream interiorproxies.meta on your Server. For this tutorial we will use [GTA IV Burgershot by Smallo](https://www.gta5-mods.com/maps/gtaiv-burgershot-interior-sp-and-fivem).

This Tutorial will answer the known "why are players invisible in my MLO" question.

# Suggested tools
* [OpenIV](https://openiv.com/)
* [Codewalker](https://www.gta5-mods.com/tools/codewalker-gtav-interactive-3d-map)

# Adding the MLO to the Server
Download the MLO from the link above and add it as a resource to your Server. You can find the tutorial for streaming MLO's here: [MLOs]([Tutorial:Stream)
# Creating the Resource
1. Open ```dlc.rpf``` or any other ```*.rpf``` archive with one of the suggested tools from the downloaded resource and search for a file with the ending: ```milo_.ymap```
2. Copy the filename up to ```milo_``` to your clipboard.
3. Create a resourcefolder with the following structure below.
4. Create a ```interiorproxies.meta``` file inside the stream folder in your resourcefolder. You can see below at ```interiorproxies.meta``` how the file should look.

## **Folder Structure**
```
i-streamer/
|-> stream/
|    |-> interiorproxies.meta
|-> resource.cfg
\-> stream.cfg
```

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
  stream/*
]

meta: {
  stream/interiorproxies.meta: INTERIOR_PROXY_ORDER_FILE
}
```

## **interiorproxies.meta**
You can add every ```milo_``` as a ```<Item>``` into ```proxies```

```xml
<?xml version="1.0" encoding="UTF-8"?>
<SInteriorOrderData>
    <startFrom value="2000"/>
    <proxies>
	<Item>vespucci_burgershot_milo_</Item>
    </proxies>
</SInteriorOrderData>
```
Add the ```i-streamer``` (folder name is your resource name) for the ```server.cfg``` file.
