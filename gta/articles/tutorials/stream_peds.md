# Streaming PEDs 
This tutorial shows, how to add/replace custom peds on your server.

## Suggested tools
* [OpenIV](https://openiv.com/)
#
## Creating the resources
1. Open <code>dlc.rpf</code>( or archive ) and extract all **.ydd**/**.ytd**/**.ymt**/**.ytf** files.

**Note**: If you downloaded retextured ped ( archive contains only **.ytd** files), you could take others from OpenIV, just go to the package where you want to extract your **.ytd** (from archive) and extract files with the same name as your **.ytd file** from the archive (except **.ytd**).


### **<u>Peds add-on/replace</u>**

## **Folder structure**
```
peds_tutorial/
├─ stream/
│  ├─ models/
│  │  ├─ yourmodelname.ydd
│  │  ├─ yourmodelname.ytd
│  │  ├─ yourmodelname.ymt
│  │  ├─ yourmodelname.ytf
│  ├─ anynameofmeta.meta
├─ resource.cfg
├─ stream.cfg
```

**Note**: You could divide metafiles and your ped models into subfolders as you wish. The only rule is to pass the right paths to metafiles and subfolders should be inside the stream folder.

**Note**: You could rename the model if you don’t want to replace others (default or DLC), just change the number on the ending of the filename.

### Anynameofmeta.meta
If your archive doesn’t provide metadata, take one of the following.
[Male](https://pastebin.com/8ggPMs2x) / [Female](https://pastebin.com/9fpzKfq8)

To make this work you should change: 
```
    <Name>yourmodelname</Name>
```
**Note**: You can mix models in one meta file, just paste new ```<Item>``` block into ```<InitDatas>``` and change model name ( or other stuff ) in meta file.

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
   stream/*
],
meta: {
   stream/anynameofmeta.meta: PED_METADATA_FILE
}
```
