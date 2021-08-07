# Stream MLOs
This tutorial will show, how to add custom MLO to your server. For this tutorial we will use [GTA IV Burgershot by Smallo](https://www.gta5-mods.com/maps/gtaiv-burgershot-interior-sp-and-fivem).

## Suggested tools 
* [Open IV](https://openiv.com/)
* [Codewalker](https://www.gta5-mods.com/tools/codewalker-gtav-interactive-3d-map)
#
## Creating the resources 
1. Open ```dlc.rpf``` or any other ```*.rpf``` archive with one of suggested tools 
2. Extract the archive like below. Place all ```ybn```, ```ydd```, ```ydr``` and other assets in one folder to load them all with one wildcard (you can split it in subfolders). You also need to describe each meta file. You can drag and drop the files.

## **Folder Structure**
```
burgershot/
|-> stream/
|    |-> basev/
|    |    |-> hi@vb_03_0.ybn
|    |    |-> vb_03_0.ybn
|    |    |-> vb_03_bld2_e_slod_children.ydd
|    |    |-> vb_03_bld2.ydr
|    |    \-> vb_03_vb_emissive_slod_children.ydd
|    |-> collisions/
|    |    \-> BurgerShot.ybn
|    |-> models/
|    |    |-> ab_burger.ydr
|    |    |-> ab_burger_divider.ydr
|    |    |-> ab_burger_frames.ydr
|    |    |-> ab_burger_frames3.ydr
|    |    |-> ab_burger_glassa.ydr
|    |    |-> ab_burger_glassb.ydr
|    |    |-> ab_burger_glassc.ydr
|    |    |-> ab_burger_glu.ydr
|    |    |-> ab_burger_glu2.ydr
|    |    |-> ab_burger_glu4.ydr
|    |    |-> ab_burger_glue2.ydr
|    |    |-> ab_burger_lod.ydr
|    |    |-> ab_burger_lod2.ydr
|    |    |-> ab_burger_main.ydr
|    |    |-> ab_burger_mat1.ydr
|    |    |-> ab_burger_mat2.ydr
|    |    |-> ab_burger_seat1c.ydr
|    |    |-> ab_burger_seat2l.ydr
|    |    |-> ab_burger_skirt.ydr
|    |    |-> ab_burger_wina.ydr
|    |    |-> ab_burger_winb.ydr
|    |    |-> ab_burger_winc.ydr
|    |    |-> ab_burgerbits.ydr
|    |    |-> ab_dinerbench.ydr
|    |    |-> ab_dinerchair.ydr
|    |    |-> ab_dinertable.ydr
|    |    |-> ab_vent_ceiling.ydr
|    |    |-> bm_burger_shelf2.ydr
|    |    |-> bm_burger_shelf_cb.ydr
|    |    |-> bm_chipfryer.ydr
|    |    |-> bm_ff_sink1.ydr
|    |    |-> bm_ff_table02.ydr
|    |    |-> bm_ff_table03.ydr
|    |    |-> bm_ff_table1.ydr
|    |    |-> bm_ff_table4.ydr
|    |    |-> bm_flappy_bin.ydr
|    |    |-> bm_frozen_dispence.ydr
|    |    |-> bm_griddle_small.ydr
|    |    |-> bm_handtowels.ydr
|    |    |-> bm_heater_lamp.ydr
|    |    |-> bm_heater_lamp2.ydr
|    |    |-> bm_pos_fastfood2.ydr
|    |    |-> bm_soda_dispence2.ydr
|    |    |-> bm_soda_dispense1.ydr
|    |    |-> burger_emissiv_ind5.ydr
|    |    |-> burger_occ2.ydr
|    |    |-> burger_occ3.ydr
|    |    |-> burger_occlusion.ydr
|    |    |-> cj_bs_07.ydr
|    |    |-> cj_bs_08.ydr
|    |    |-> cj_bs_1.ydr
|    |    |-> cj_bs_2.ydr
|    |    |-> cj_bs_3.ydr
|    |    |-> cj_bs_4.ydr
|    |    |-> cj_bs_door_l.ydr
|    |    |-> cj_bs_door_r.ydr
|    |    |-> cj_int_door_24.ydr
|    |    |-> gz_bs_chipfryer.ydr
|    |    |-> gz_burger_cook03.ydr
|    |    |-> gz_burger_cook1.ydr
|    |    |-> gz_burger_cook2.ydr
|    |    |-> gz_burgerlights.ydr
|    |    |-> gz_burgerlights2.ydr
|    |    |-> ind1_bs_halllight.ydr
|    |    |-> ind1_burgercounter.ydr
|    |    |-> ind1_toilet_signs.ydr
|    |    |-> ind1_toiletglue.ydr
|    |    |-> ind1_toiletgraf.ydr
|    |    |-> ind1_toiletpipes.ydr
|    |    |-> ind1_toiletshit.ydr
|    |    |-> ind1_toiletsink.ydr
|    |    |-> ind1_toiletsinkfilth.ydr
|    |    \-> ind_1_bsfridge.ydr
|    |-> textures/
|    |    |-> ab_burgerprops.ytd
|    |    |-> bm_kitch_chrome.ytd
|    |    |-> cj_bs_post.ytd
|    |    |-> r1_burger_lod.ytd
|    |    |-> retail1_burgershot.ytd
|    |    |-> bm_fastffood_kitch.ytd
|    |    |-> burgerstand.ytd
|    |    |-> r1_burger_lod2.ytd
|    |    \-> retail1_burgershot1.ytd
|    |-> _manifest.ymf
|    |-> fastfood.ytyp
|    |-> hei_vb_03.ymap
|    |-> hei_vb_03_strm_0.ymap
|    |-> indust_1.ytyp
|    |-> int_door.ytyp
|    |-> props_ab.ytyp
|    |-> vb_03.ymap
|    |-> vb_03_strm_0.ymap
|    |-> vb_occl_01.ymap
|    \-> vespucci_burgershot_milo_.ymap
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
}
```

Add the ```burgershot``` (folder name is your resource name) for the ```server.cfg``` file.