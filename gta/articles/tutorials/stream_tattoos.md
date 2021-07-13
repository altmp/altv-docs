# Stream Tattoos
This tutorial will show, how to add custom tattoos to your server.
## Suggested tools 
* [Open IV](https://openiv.com/)
* [Template for fast creating](https://github.com/C0kkie/altv_custom_tattoos)


## customtattoos_overlays.xml 
If you have downloaded the template, edit the customtattoos_overlays.xml file.
1. uvpos, scale, rotation change it like you want
2. nameHash: best way is to use the name of the ytd plus _M or _F at the end.
3. txdHash, txtHash: needs to be the ytd filename.
4. gender: needs to be GENDER_MALE or GENDER_FEMALE.
5. zone: needs to be one of the listed below.


## shop_tattoo.meta 
If you have downloaded the template, edit the shop_tattoo.meta file.
1. textLabel: you can add the ytd file name
2. collection: needs to be the same as you can find in customtattoos_overlays.xml
3. preset: will be the nameHash from the customtattoos_overlays.xml item
4. eFaction: needs to be TATTOO_MP_FM (male) or TATTOO_MP_FM_F (female)
5. zone: needs to be one of the listed below.
6. eFacing: needs to be one of the listed below
7. updateGroup: needs to be one of the listed below

## Zonenames 
1. ZONE_TORSO
2. ZONE_HEAD
3. ZONE_LEFT_ARM
4. ZONE_RIGHT_ARM
5. ZONE_LEFT_LEG
6. ZONE_RIGHT_LEG

## eFacing
1. TATTOO_BACK
2. TATTOO_CHEST
3. TATTOO_FRONT
4. TATTOO_FRONT_LEFT
5. TATTOO_FRONT_RIGHT
6. TATTOO_LEFT
7. TATTOO_RIGHT
8. TATTOO_STOMACH

## updateGroup 
You can find a list here: https://github.com/DurtyFree/gta-v-data-dumps/blob/master/pedOverlayUpdateGroups.json

## Important for the ytd files 
1. Image needs to be 512x512
2. Image name needs to match the ytd file name


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
    stream/customtattoos_overlays.xml: PED_OVERLAY_FILE
    stream/shop_tattoo.meta: TATTOO_SHOP_DLC_FILE
}
```

# **Final touch** 
Add the ```custom_tattoos``` to the resource list inside the ```server.cfg``` file.<ref>custom_tattoos stands for the resource name which is represented by your folder name.</ref><br><br>
Resource names **aren't** case sensitive!
