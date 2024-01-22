# Client mods

In alt:V version 16 we've introduced a mod folder allowing the usage of Reshade & ENB.\
Note that RPF files are not supported in this folder, those still belong into the game directory.

> [!IMPORTANT]
> While we offer the capability to run certain mods through the mod folder, be aware that we do **not** provide support for client-side mods.\
> If you encounter any issues while using them, it's on you to resolve them.

> [!NOTE]
> Mods can be auto-disabled in alt:V during repeated crashes or stress tests for stability.

## Remarks

- We don't support mods, we only provide you a possibility to install them.
- Modifying the game files is entirely at your own risk. Be aware that outdated mods may lead to game instability or crashes.
- Playing GTA:Online with a modified game might get you banned.
- Certain modifications, such as those altering weapons or audio, can be detected by the alt:V server. Using such mods may result in a ban, so always verify with the servers team whether mods are permitted before using them.

## Guide

### Enabling mod support

As first step we have to enable the mod directory support in our [altv.toml](~/articles/configs/client.md), which can be enabled by clicking [here](altv://action/setcfg?enableModDirectory=true).
If the automatic activation doesn't work, follow the those steps to manually enable it:

1. Navigate to your alt:V directory
2. Open the altv.toml file with a text editor
3. Look for the line `enableModDirectory`
   * If it exists, change its value to `true`
   * If it doesn't exist, add `enableModDirectory = true` at the bottom of the file
4. Save the changes to the altv.toml file

### Adding mods

To add new mods simply put their files into the mods folder.
You can open this by clicking [here](altv://action/open?dir=mods) or navigating to your alt:V directory and then the `mods` directory.
If the directory doesn't exist, create it yourself.

> [!IMPORTANT]
> Place the mod and it's related files (e.g. \*.dll, *\.ini, \*.fx and other relevant files) into the mods folder.\
> Remind that RPF files don't belong into this directory, see next step.

### Modifying game files

> [!IMPORTANT]
> Always take a backup of the files you replace.\
> If the mod is outdated after a GTA update it is very likely that the game will crash on start.

If your mod comes with modified game files (usually in the form of *.rpf files), these need to be changed in the GTA directory.\
RPF files in the mods folder are ignored and won't be processed further.