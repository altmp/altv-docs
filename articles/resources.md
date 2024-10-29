# Resources

Resources are one of the main parts of the alt:V server. They handle the data and gamescripts for server- and clientside used by the alt:V server.<br>
Resources are represented as a subfolder of the `resources/` folder in the alt:V server root.

# resource.toml

A resource (folder) is required to contain at minimum a `resource.toml` configuration file (except rpf resources, see rpf section below for more info). Depending on which resource type you are using, the properties you specify in the config file may differ between each other.<br>
A resource has a folder structure like this:

> [!div class="nohljsln"]
>```
> resources/
>   [RESOURCE_NAME]/
>     resource.toml
>```

Keep in mind that this is only the minimum requirement for a resource to work. Each type has custom specifications.

# Types

The following types are currently available:

## js

This resource type is providing the ability to write gamescript in JavaScript on server- and clientside.
For more information see: [Getting Started](~/altv-types/docs/articles/index.md)

## csharp

This resource type is providing the ability to write gamescript in C# on serverside and JavaScript on clientside.
For more information see: [Getting Started](~/coreclr-module/docs/articles/index.md)

## dlc

This resource type is for providing modded content (eg Vehicles, MLOs, Clothes) to the client. You need a `stream.toml` to get this type to work.

Since v15 this resource type also allows to replace GTA base files. See `overrides` below.

stream.toml

|                   Key                      |                                        Description                                                      |
| :----------------------------------------: | :-----------------------------------------------------------------------------------------------------: |
| files     | Path to the files that are send to the client.                             |
| meta      | Path to the meta files and the corresponding Data files (Format: [PATH = DATA_FILE_TAG]).      |
| gxt       | Path to the gxt files. |
| overrides | Game file mount path and path to the replacement (Format: [MOUNT_PATH = REPLACEMENT_PATH]) |

### Replacements

To override a file you need to first it's full mount path. Mount path is specified in format `group:/path/to/file`. See [list of mounts](https://gist.githubusercontent.com/martonp96/59f731446c7f17db3f400c2be458c4a4/raw/38b73edc0a61cbd24383d75a41c515718aafded6/gistfile1.txt). 

Example replacement:

File structure:
> [!div class="nohljsln"]
>```
> resources/
>   [RESOURCE_NAME]/
>     replaces/
>       water_empty.xml
>     resource.toml
>```

stream.toml 
> [!div class="nohljsln"]
>```
> [overrides]
> 'commoncrc:/data/levels/gta5/water.xml' = 'replaces/water_empty.xml'
> ```

## asset-pack

This resource type is to provide content to other resources (eg Pictures, Videos, WebPages, JSON files). This content can be provided througt multiple ways:

1. Webview: `http://assets/[packName]/filePath`
2. Javascript: `import '@[packName]/filePath';`
3. FileAPI: With `@[packName]` before the path.

> [!div class="nohljsln"]
>```
> type = 'asset-pack'
> client-files = [ ... ]
> ```

## rpf

This resource type allows you to load .rpf DLC directly. All .rpf archives are loaded before game start, and therefore can load anything what normal singleplayer DLC can.

resource.toml

| Key      | Description           |
| :------: | :-------------------: |
| type     | `rpf`                 |
| main     | Path to the .rpf file |

To simplify loading process, you can load rpf DLCs without creating `resource.toml`. Just create a resource folder and put a `dlc.rpf` file in it.

Example:
- Download https://www.gta5-mods.com/maps/community-mission-row-pd/download/75282
- Create `server/resources/nice_police_mlo` folder
- Copy `/RageMP and SP/mrpd/dlc.rpf` to `nice_police_mlo` folder
- Add `nice_police_mlo` to resources list in server.toml
