# Custom Launcher

You may want to brand your server experience from starting the game to playing on the server, if you want to make a own custom launcher and it's required to join your server, you need to open source it and the server isn't allowed to be listed on masterlist. As an alternative to creating your own launcher, it is possible to customize the official launcher. In this article you will be able to get information, how to get the official custom launcher, what you can modify and how you can modify it.

# How to get the official custom launcher?

You must support alt:V as a [Diamond Altruist on Patreon](https://www.patreon.com/altVMP/), there is currently no other way.

# What can be modified in the official custom launcher?

These features can currently be used, more may be added in the future:

* Splash screen can be replaced with own Logo
* Icon can be replaced with own Logo
* Your servers will be displayed on the home screen of alt:V
* You can add a custom RSS feed with news from your project
* Own download link for your launcher hosted on alt:V CDN.

# How can I modify the official custom launcher?

After getting [Diamond Altruist on Patreon](https://www.patreon.com/altVMP/), connect your Discord Account with Patreon. If the linking process is finished, contact a member of the Public Relations Team. You need to provide us following things, so we can setup the launcher for you:

## ICO file as Icon

A single ICO file can store multiple resolutions. You can create such files with various software (eg [ICOconverter.com](https://www.icoconverter.com/)) we need following settings:

## Sizes

* 16 pixels
* 32 pixels
* 48 pixels
* 256 pixels

## Bit depth

32 bits (16.7M colors & alpha transparency)<br>
A reference icon ICO file can be found [here](~/altv-docs-gta-assets/images/customlauncher/icon.ico).

## BMP file as splash screen

The splash screen must have a size of 300x400. And is shown when alt:V is starting GTA V and is making updates.<br>
A reference splash screen BMP file can be found [here](~/altv-docs-gta-assets/images/customlauncher/splash.bmp).

## JSON file as manifest

A file named `manifest.json` must be provided with following information:

1. *branch* - Used branch for the alt:V server (release, rc, dev)
2. *name* - Your project name (for more infomations you can take look at the screenshot below)
3. *rss* - The url to your rss feed for news
4. *servers* - List of servers you want to show on the home page
    1. *name* - Name of the server
    2. *url* - Connect url to the server (https://cdn.example.com/ or host:port)
    3. *id* - Masterlist id of your server (can be found [here](~/articles/master_list_api.md))

## Example file

> [!div class="nohljsln"]
>```json
>{
>  "branch": "release",
>  "name": "Your Project Name",
>  "rss": "https://example.com/rss",
>  "servers": [
>    {
>      "name": "Your server name",
>      "url": "ConnectUrl",
>      "id": "ServerId"
>    }
>  ]
>}
>```

## Preview

![Impression of the alt:V custom launcher.](~/altv-docs-gta-assets/images/customlauncher/impression.png)
