# Stream Weapons
This tutorial show, how to add/replace custom weapons for your server.

## Suggested tools
- [OpenIV](https://openiv.com/)

## Creating the resources
1. Open ```dlc.rpf``` and extract all the ```.meta``` files and models/texture (```.ydr```/```.ytd```)


## <u>Weapons add-on</u>

## Folder structure
```
weapon_tutorial/
├─ stream/
│  ├─ models/
│  │  ├─ w_me_katana.ydr
│  │  ├─ w_me_katana.ytd
│  ├─ weaponkatana.meta
│  ├─ weaponarchetypes.meta
│  ├─ weaponanimations.meta
├─ resource.cfg
├─ stream.cfg
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
	stream/meta/weaponkatana.meta: WEAPONINFO_FILE
	stream/meta/weaponanimations.meta: WEAPON_ANIMATIONS_FILE
	stream/meta/weaponarchetypes.meta: WEAPON_METADATA_FILE
}
```

## <u>Weapons replace</u>
## Folder structure
```
weapon_tutorial/
├─ stream/
│  ├─ models/
│  │  ├─ w_pe_pistol.ydr
│  │  ├─ w_pe_pistol.ytd
├─ resource.cfg
├─ stream.cfg
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

}
```

## <u>Edit weapons damages</u> 
1. For this example i will take the SMG weapon already available in gta.
2. Search the path of the weapon inside gta files (in this example, it's ```mpbiker``` dlc).
3. go to ```common/data/ai``` and open ```weaponminismg.meta```.
4. CTRL+F and search for NetworkPlayerDamageModifier and edit the value.
```
 <InitialRumbleDuration value="0" />
          <InitialRumbleIntensity value="0.000000" />
          <InitialRumbleIntensityTrigger value="0.000000" />
          <RumbleDuration value="0" />
          <RumbleIntensity value="0.000000" />
          <RumbleIntensityTrigger value="0.000000" />
          <RumbleDamageIntensity value="1.000000" />
          <NetworkPlayerDamageModifier value="1.000000" />
          <NetworkPedDamageModifier value="1.000000" />
          <NetworkHeadShotPlayerDamageModifier value="1.000000" />
          <LockOnRange value="11.500000" />
          <WeaponRange value="30.000000" />
          <BulletDirectionOffsetInDegrees value="0.000000" />
          <AiSoundRange value="-1.000000" />
          <AiPotentialBlastEventRange value="-1.000000" />
```
