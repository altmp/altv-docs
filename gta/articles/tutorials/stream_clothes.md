# Stream Clothes
This tutorial show, how to add custom clothes for MP Character on your server.

## Suggested tools 
* [alt:V clothes tool updated by DurtyFree](https://github.com/DurtyFree/altv-cloth-tool/releases/latest)
* [OpenIV](https://openiv.com)
* [Clothes Menu for testing your resource](https://github.com/Nicoo34/Clothes-Menu)


## Creating the resources 
Be sure you have the latest updated Clothes tool, check the link before in the ```Suggested tools``` category

## Tool tutorial 
1. ```First step```: select the gender for your clothes.
2. ```Second step```: imported Clothes appear on the left corner.
3. ```Third step```: when you have select all clothes you want to add, just click on ```"Build Project"```.
4. ```Fourth step```: be sure that's alt:V resource is ticked, if it's not for alt:V, you can tick others options.
5. ```Fifth step```: give a name to your clothes collection, and create a folder for your exported resource
6. ```Sixth step```: add the resource name in your ```server.cfg``` and your resource folder into the ```server resource folder```


![First step](./../../images/tutorials/first.png)
![Second step](./../../images/tutorials/second.png)

<gallery>
Tutorial clothes firstl.webp| First steps
Tutorial_clothes_second.png| Last Steps
</gallery>

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
  stream/ped_male.rpf/*
  stream/ped_female.rpf/*
]
meta: {
  stream/mp_m_freemode_01_mp_m_ClothesTutorial.meta: SHOP_PED_APPAREL_META_FILE
  stream/mp_f_freemode_01_mp_f_ClothesTutorial.meta: SHOP_PED_APPAREL_META_FILE
}
```

## Folder structure 
```
clotheResource/
├─ stream/
│  ├─ ped_male.rpf/
│  │  ├─ mp_m_freemode_01_mp_m_ClothesTutorial/
│  │  │  ├─ accs_000_u.ydd
│  │  │  ├─ accs_diff_000_a_uni.ytd
│  │  ├─ mp_m_freemode_01_mp_m_ClothesTutorial.ymt
│  ├─ ped_female.rpf/
│  │  ├─ mp_f_freemode_01_mp_f_ClothesTutorial/
│  │  │  ├─ jbib_000_u.ydd
│  │  │  ├─ jbib_diff_000_a_uni.ytd
│  │  ├─ mp_f_freemode_01_mp_f_ClothesTutorial.ymt
│  ├─ mp_m_freemode_01_mp_m_ClothesTutorial.meta
│  ├─ mp_f_freemode_01_mp_f_ClothesTutorial.meta
├─ resource.cfg
├─ stream.cfg
```

With this tutorial you can add every clothes you want for your server, GTA5 main characters clothes will not work with this tutorial, same for NPC add-on.
If you have any trouble with your resource, you can ask on the discord modding channel.
