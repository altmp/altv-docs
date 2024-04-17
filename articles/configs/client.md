# The client configuration

After you downloaded and installed the alt:V Multiplayer client, you can find the `altv.toml` file in the installation folder. This file contains the settings of the client. Per default this file only contains the branch and the path to your GTA:V installation. After the first launch of alt:V there are more settings available in the `altv.toml`. However, there are more settings that you can apply. Most of these settings can also be applied in the main menu under `Settings` but some of them need to be set up directly in this file.

## List of possible client configurations

| Key                       | Type                  | Default Value        | Description                                                                                                                                                                                                                               |
| ---                       | ---                   | ---                  |-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|   name                    |   string              |   alt:V nickname     | Your name that is displayed on a server.                                                                                                                                                                                                  |
|   branch                  |   string              |   release            | The [branch](~/articles/branches.md) on which the client will work.                                                                                                                                                                       | 
|   debug                   |   boolean (true/false)|   false              | Activates the debug mode. For example, an active debug mode allows you to use the `reconnect` command in the F8 console.                                                                    |
|   gtapath                 |   string              |   -                  | Path to your GTA5 directory. Usually, it is set up automatically thought the installation process.                                                                                                                                        |
|   lang                    |   string              |   en                 | Language of your client.                                                                                                                                                                                                                  |
|   lastip                  |   string              |   0.0.0.0 (IPv4)     | The ip of the last server you played on.                                                                                                                                                                                                  |
|   netgraph                |   boolean(true/false) |   false              | Shows a netgraph on the bottom left.                                                                                                                                                                                                      |
|   streamerMode            |   boolean(true/false) |   false              | Enables or disables the [streamer mode](~/articles/streamermode.md).                                                                                                                                                                      |
|   textureBudgetPatch      |   boolean(true/false) |   true               | Enable or disable the texture budget patch                                                                                                                                                                                                |
|   useSharedTextures       |   boolean(true/false) |   true               | Enable or disable the shared textures (Hardware Acceleration for CEF)                                                                                                                                                                     |
|   useExternalConsole      |   boolean(true/false) |   false              | Enables or disables the external console (console popout).                                                                                                                                                                                |
|   voiceActivationKey      |   number              |   78 (N)             | Sets the key for Push-to-talk. You can get the key code [here](https://keycode.info/).                                                                                                                                                    |
|   voiceActivationEnabled  |   boolean(true/false) |   false              | Enables or disables the voice activity input mode.                                                                                                                                                                                        |
|   voiceInputSensitivity   |   number              |   20                 | If voiceActivationEnabled is enabled, this option will set the required sensitivity.                                                                                                                                                      |
|   voiceEnabled            |   boolean(true/false) |   true               | Enables or disables the voice system for the client.                                                                                                                                                                                      |
|   voiceAutoInputVolume    |   boolean(true/false) |   true               | Enables or disables the automatic determination of the input volume.                                                                                                                                                                      |
|   voiceInputVolume        |   number              |   100                | Sets the input volume (Range: 0 - 200).                                                                                                                                                                                                   |
|   voiceNoiseSuppression   |   boolean(true/false) |   true               | Enables or disables the noise suppression.                                                                                                                                                                                                |
|   voiceVolume             |   number              |   100                | Sets the output volume (Range: 0 - 200).                                                                                                                                                                                                  |
|   earlyAuthTestURL        |   string              |   -                  | URL to your early auth website. Only usable in rc & dev branch.                                                                                                                                                                           |
|   gameTimeout             |   number              |   60                 | Maximum time (in seconds) the launcher should wait for GTA V to start.                                                                                                                                                                    |
|   logsToKeep              |   number              |   10                 | How many client & launcher logs should be kept until rotation starts.                                                                                                                                                                     |
|   heapSize                |   number              |   1024               | The default memory size for the texture/asset VRAM budget limit (auto calculated from your pc specs)                                                                                                                                      |
|   linuxCompatibility      |   boolean(true/false) |   false              | Enable or disables Linux/MacOS related settings (See Discord #general [Linux](https://discord.com/channels/371265202378899476/988474811258908702) & [MacOS](https://discord.com/channels/371265202378899476/1105208952091840612) Threads) |
|   discordRichPresence     |   boolean(true/false) |   true               | Enable or Disable the Discord Rich Presence ("Now Playing" alt:V in Discord user profile)                                                                                                                                                 |
|   enableModDirectory      |   boolean(true/false) |   false              | Enables the mod directory. See [here](~/articles/troubleshooting/client-mods.md) for more info.                                                                                                                                           |
|   cachePath      |   string |   "cache" directory in client folder             | Changes location of the cache directory where server assets (interiors, scripts, etc.) are being downloaded to.                                                                                                                                           |
## Example altv.toml file

```toml
branch = "release"
debug = false
gtapath = "C:\\Program Files (x86)\\Steam\\steamapps\\common\\Grand Theft Auto V"
lang = "en"
lastip = "127.0.0.1:7788"
name = "exampleName"
netgraph = false
streamerMode = false
useExternalConsole = false
voiceActivationEnabled = false
voiceActivationKey = 78
voiceAutoInputVolume = false
voiceEnabled = false
voiceInputSensitivity = 20
voiceInputVolume = false
voiceNoiseSuppression = false
voiceVolume = false
```
