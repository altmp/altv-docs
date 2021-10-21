# Resources

Resources are one of the main parts of the alt:V server. They handle the data and gamescripts for server- and clientside used by the alt:V server.<br>
Resources a represented as a subfolder of the `resources/` folder in the alt:V server root.

# resource.cfg

A resource (folder) is required to contain at minimum a `resource.cfg` configuration file. Depending on which resource type you are using, the properties you specify in the config file may differ between each other.<br>
A resource has a folder structure like this:

> [!div class="nohljsln"]
>```
> resources/
>   [RESOURCE_NAME]/
>     resource.cfg
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

This resource type is for providing modded content (eg Vehicles, MLOs, Clothes) to the client. You need a `stream.cfg` to get this type to work.

stream.cfg

|                   Key                      |                                        Description                                                      |
| :----------------------------------------: | :-----------------------------------------------------------------------------------------------------: |
| files     | Path to the files that are send to the client.                             |
| meta      | Path to the meta files and the corresponding Data files (Format: [PATH: DATA_FILE_TAG]).      |
| gxt       | Path to the gtx files. |

## asset-pack

This resource type is to provide content to other resources (eg Pictures, Videos, WebPages, JSON files). This content can be provided througt multiple ways:

1. Webview: `http://assets/[packName]/filePath`
2. Javascript: `import '@[packName]/filePath';`
3. FileAPI: With `@[packName]` before the path.

> [!div class="nohljsln"]
>```
> type: asset-pack
> client-files: [ ... ]
> ```
