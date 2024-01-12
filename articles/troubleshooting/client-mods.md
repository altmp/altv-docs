# Client mods

In alt:V version 16, we've introduced a mod folder, allowing the use of Reshade & ENB mods. Note that RPF files are not supported in this folder.

> [!WARNING]
> While we offer the capability to run certain mods through the mod folder, be aware that we do not provide support for these mods.
> If you encounter any issues while using them, you will be responsible for resolving them.
> We do not develop these mods and are not familiar with their internal workings, making it impossible for us to diagnose or address any related problems.

> [!INFO]
> Mods can be auto-disabled in alt:V during repeated crashes or stress tests for stability.

## Activate the mod support

To enable mod support in alt:V, follow these steps:

1. Navigate to your alt:V directory on your computer. 
2. Open the [altv.toml](~/articles/configs/client.md) file with a text editor.
3. Look for the line enableModDirectory.
  * If it exists, change its value to true.
  * If it doesn't exist, add enableModDirectory = true at the bottom of the file.
4. Save the changes to the altv.toml file.

Once you've made these changes, mod support will be activated, allowing you to use the mods from the dedicated mod folder.

## Enable mods

Activating mods in alt:V is straightforward. Follow these steps to get started:

1. Inside your alt:V directory, create a new folder and name it mods.
2. Place all the mod files into this mods folder. For mods like Reshade and ENB, this includes all related files such as \*.dll, \*.ini, \*.fx, and any other relevant files or directories associated with the mods.