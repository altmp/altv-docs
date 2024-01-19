# Troubleshoot Client

Because not every system is the same, various problems can occur with the alt:V client. The first thing you should check if your system is meeting the Minimum Requirements, after that you should continue with the rest of this article. If nothing in this article helped, you can try to get help in our <a href="https://discord.altv.mp/" target="_blank">Discord</a>.

## Minimum Requirements

Because alt:V is using additional technologies, we have a little bit higher Minimum Requirements, than GTA V itself. If your computer doesn't fulfill this requirements, you can still try to run alt:V but the chances are high that some problems will occur.

> [!div class="nohljsln"]
> ```
> OS:         Windows 10 64 Bit
> Processor:  Intel Core i5 3470 @ 3.2GHz (4 CPUs)/ AMD X8 FX-8350 @ 4GHz > (8 CPUs)
> Memory:     8 GB RAM
> Graphics:   NVIDIA GTX 660 2GB / AMD HD 7870 2GB
> Storage:    SSD for OS and Game
> ```

## Basic Steps (it's recommended to try ALL OF THEM first for any problem)
1. You need to have Singleplayer launched at least once
2. Try Running as Admin
3. Add an exception to your Anti-Virus for alt:V (This Includes Windows Defender).
4. Avast is even blocking alt:V if you whitelist it!
5. Try setting up different [DNS servers](https://developers.google.com/speed/public-dns/docs/using) (you can e.g. use [Cloudflare DNS](https://www.cloudflare.com/learning/dns/what-is-1.1.1.1/), [Google DNS](https://developers.google.com/speed/public-dns), ...).
6. Ensure alt:V is installed in a directory that is not your Desktop, not your GTA:V Directory and the path does not include any special characters.
7. Make sure Visual C++ 2015-2019 Redistributable is installed. <a href="https://aka.ms/vs/16/release/VC_redist.x64.exe" target="_blank">Download link</a>
8. Ensure you've the latest drivers of all your devices, especially your graphics card
9. Only use ASCII Characters in your alt:V Path.
10. Keep the path short to the alt:V directory, i.e. D:/altV
11. Use Windows 10 or higher
12. If the Steam version is stuck on "Load alt:V Client", try killing the Steam process(es). (Also try and remove Steam from autostart.)
13. You must have a clean version of GTA V. Graphics mods like Redux or Natural Vision must not be present in your GTA V installation.
14. If your game is crashing on joining a server try a server without mods (eg Freeroam servers). If its working on such server, contact the server team of the server you are crashing at.
15. Try restarting your PC

## Known Problems & Solutions

#### RageMP is starting
This happens when RageMP was installed in the GTA directory. You can install it afterwards in a separate folder.

1. Go to your GTA directory.
2. Delete all RageMP files and folder from it.

#### Steam Version or Steam is launched
These steps are only for Rockstar Games Launcher and Epic Games Versions.

1. Go to your GTA directory
2. Delete steam_api64.dll from the GTA directory

#### Epic Games launcher is starting
These steps are only for Rockstar Games Launcher and Steam Versions.

1. Go to your GTA directory
2. Delete EOSSDK-Win64-Shipping.dll from the GTA directory

#### Timeout when starting game
1. Go to your alt:V directory
2. Open the altv.toml with your prefered editor (e.g. notepad)
3. Add `gameTimeout = 120` at the bottom, where 120 (seconds) is the maximum waiting time

#### FPS Problems
1. Launch Singleplayer
2. Go to Graphics Settings
3. Set MSAA to Off

#### Interface not responsive
1. Launch Singleplayer
2. Go to "Keyboard / Mouse" settings
3. Change "Mouse Input Method" to "Raw Input"

#### Webview elements jumping around when moving cursor
If you experience this issue and you have a Radeon graphics card, it might be caused by Radeon Boost.

1. Open Radeon settings
2. Disable "Radeon Boost"

#### Webview lagging
This can reduce the webview performance, but may fix input lags:

1. Press "Windows + R" on your Keyboard
2. Enter "ms-settings:display-advancedgraphics" in the window which appeared
3. Click on OK
4. Switch "Hardware-accelerated GPU scheduling" to off

#### Webview not working
If you are stuck under the world after launching alt:V or see a grey world (<a href="https://i.gyazo.com/thumb/1200/493c99558d9424a48282560b8e0160da-png.jpg">Picture</a>), then the webview from alt:V and GTA V aren't rendered on the same GPU. This can be solved by forcing Windows to render altv.exe, cef/altv-webengine.exe and gta5.exe on the same GPU. Here are some examples how this can be achieved:

###### For Laptops preferrably
1. Press "Windows + R" on your Keyboard
2. Enter "ms-settings:display-advancedgraphics" in the window which appeared
3. Click on OK
4. Click "Search" and select "altv.exe", "altv-webengine.exe"and "gta5.exe" one after another
5. Select "Options" and select "High Performance" for both programs

###### NVIDIA Graphics cards
1. Open NVIDIA Control Panel
2. 3D Settings
3. Manage 3D Settings
4. Program Settings
5. Add "altv.exe", "altv-webengine.exe"and "gta5.exe"
6. Select the same graphics card for the Feature "OpenGL rendering GPU" for both programs.

###### AMD Graphics cards
1. Right-Click on Desktop and select AMD Radeon Settings
2. Select System
3. Select Switchable Graphics
4. Add "altv.exe", "altv-webengine.exe"and "gta5.exe" and select "High Performance"
5. More detailed description can be found <a href="https://www.amd.com/en/support/kb/faq/dh-017">here</a>

#### Webview not rendering on Linux
If Webview is not rendering in Linux, you might be missing required libraries in the `/cef` folder. To allow CEF to load properly you must copy the missing libraries from `/libs` to `/cef`. See below a list of files that need to be copied for CEF to work.

(Tested using [Wine-GE](https://github.com/GloriousEggroll/wine-ge-custom/releases) and [Lutris](https://lutris.net/) with GTA:V downloaded from Windows version of Steam)

##### Files to be copied into `/cef` directory

-   libce2.dll
-   icudtl.dat
-   snapshot_blob.bin
-   chrome_elf.dll
-   v8_context_snapshot.bin

#### Signed out from Social Club
If you always get signed out of Social Club when playing alt:V, then monitor folder access from Windows is probably turned on. With these steps you can turn this feature off:

1. Open windows security
2. Select virus & threat protection setting
3. Select controlled folder access
4. Turn it off or whitelist alt:V folder

#### "altv-client.dll can't be loaded"

###### Kaspersky AntiVirus or Kaspersky Internet Security
If you are using Kaspersky AntiVirus or Kaspersky Internet Security, this can cause the "altv-client.dll can't be loaded" error to occur even though all possible exceptions have been taken. The only solution to this problem is to disable the virus scanner. Keeping the alt:V window in focus reduces the chance of the error occurring.

###### Others
Another problem can be that your user don't have enough permission on the alt:V directory.

1. Right click your alt:V folder and select "Properties".
2. Select the tab "Security".
3. Click the Button "Edit..."
4. Select your user in the "Group or user names:" list.
5. Select the Checkbox "Full control" under "Allow".
6. Click the Button "Apply"

#### Mouse is trapped in middle of screen
1. Launch Singleplayer of GTA V.
2. Go to Mouse Settings.
3. Change the mouse setting to another.

#### Something else hooked DirectX context. Try to shutdown programs that can do it... (Riva Tuner, Fraps, etc.)
Close programs like Riva Tuner, Fraps or Streamlabs OBS

#### Failed to fetch updates
This is normally an error that occurs when your connection is interrupted while updating the alt:V client or an AntiVirus is blocking the download. Try disabling your AntiVirus, if that doesn't help try it again later.

#### Your game version is X, but only Y supported at the moment. Update your Game!
You need to update your GTA:V to the latest version. Try verifying game cache or figure out other ways to force update the game.

#### Widevine CDM registration failed
You can ignore this message as it doesn't cause any problems.

#### Client crashes/closes during start
This could mean program or service is blocking alt:V and causing it to crash. You should try to disable all non Microsoft related services.

1. Press "Windows + R" on your Keyboard
2. Enter "msconfig" in the window which appeared
3. Click on OK
4. Select the Tab called "Services"
5. Check the box called "Hide all Microsoft services", located at the bottom of the window.
6. Click the button "Disable all"
7. Scroll and find "Rockstar Games Library Service" and check it.
8. Click the button "Apply"
9. Restart your PC

If alt:V is working, you can recheck some services, until you find the one that is causing the crashes. If you find the service that is causing the problem, please contact us on discord.

#### Services known to cause problems:
NVIDIA Display Container LS

#### alt:V is asking for installation directory when launching from browser
This may happen if an old entry is saved as launch option in your browser.

#### Launcher does not open/crashes while opening
Sometimes a faulty driver can cause some issues in the launcher.
If you have a `C:\Windows\USB Vibration\dr100&110\811EZFRD64.dll` - either rename the file, or remove it.

#### Integrity check of resource failed
It can happen because there is not enough free space on your disk.
If you have enough free space, try the following:
1. Open alt:V Launcher folder
2. Delete cache folder
3. Connect to the server again

###### Firefox
1. Press the Menu Button (Burger Menu)
2. Select "Options"
3. Select "General" on the left side
4. Scroll to "Files and Applications"
5. At "Applications" section select the entry "altv"
6. At "Action" column select "Always ask"
7. The next time you will be asked if you want to use the new entry.

#### Voice system does not work
If you have problems with the speech system, for example, if you change your input or output device, or if you cannot speak. Try these steps.
1. Disable all audio inputs and outputs except the ones you need 
  (Settings -> System -> Sound -> more sound settings -> Right click -> Disable)
2. Uninstall your audio device (Device-Manager -> Input -> Choose your Device) and restart your PC
3. There were problems with Kaspersky or other AV programs. Disable your AV program and try again. It works? Then create an exclusions for alt:V.

## Quick Links

Here you will find a few links that execute predefined actions on your alt:V launcher.\
The detailed information about what was done can be found in the following list:

| Link                                         | Target               | Description                                                         |
|----------------------------------------------|----------------------|---------------------------------------------------------------------|
| [Open game directory](altv://action/game)    | `altv://action/game` | Opens the game directory                                            |
| [Open alt:V directory](altv://action/altv)   | `altv://action/altv` | Opens the alt:V directory                                           |
| [Open logs directory](altv://action/logs)    | `altv://action/logs` | Opens the logs directory                                            |
| [Open configuration file](altv://action/cfg) | `altv://action/cfg`  | Opens the altv.toml                                                 |
| [Create report](altv://action/rep)           | `altv://action/rep`  | Creates a report zip (containing log files) and saves it to desktop |

### Configuration settings

#### textureBudgetPatch

| Link                                                  | Target                                       | Description                       |
|-------------------------------------------------------|----------------------------------------------|-----------------------------------|
| [Enable](altv://action/cfg?textureBudgetPatch=true)   | `altv://action/cfg?textureBudgetPatch=true`  | Enables the texture budget patch  |
| [Disable](altv://action/cfg?textureBudgetPatch=false) | `altv://action/cfg?textureBudgetPatch=false` | Disables the texture budget patch |

#### useSharedTextures

| Link                                                 | Target                                      | Description                         |
|------------------------------------------------------|---------------------------------------------|-------------------------------------|
| [Enable](altv://action/cfg?useSharedTextures=true)   | `altv://action/cfg?useSharedTextures=true`  | Enables the use of shared textures  |
| [Disable](altv://action/cfg?useSharedTextures=false) | `altv://action/cfg?useSharedTextures=false` | Disables the use of shared textures |