# 资源

资源是alt:V服务器的主要部分之一。 它们处理服务器端和客户端使用的alt:V服务器的数据和游戏脚本。资源表示为alt:V服务器根目录中的`resources/`文件夹的子文件夹。

# resource.toml

一个资源(文件夹)需要至少包含一个`resource.toml`配置文件。 根据使用的资源类型,您在配置文件中指定的属性可能会彼此不同。<br> 
一个资源具有如下文件夹结构:

> [!div class="nohljsln"]
>```
> resources/
>   [RESOURCE_NAME]/
>     resource.toml
>```

请记住,这仅仅是资源正常工作的最低要求。 每种类型都有自定义规范。

# 类型  

目前可用的类型有:

## js  

此资源类型提供了在服务器端和客户端以JavaScript编写游戏脚本的功能。
更多信息请参见:[入门](~/altv-types/docs/articles/index.md)  

## csharp  

此资源类型提供了在服务器端以C#编写游戏脚本,在客户端以JavaScript编写游戏脚本的功能。  
更多信息请参见:[入门](~/coreclr-module/docs/articles/index.md)  

## dlc

此资源类型用于向客户端提供修改后的内容(如车辆、MLO、服装)。您需要一个`stream.toml`来使此类型工作。

stream.toml

           
|                   键                      |                                        描述                                       |  
| :----------------------------------------: | :-----------------------------------------------------------------------------------------------------: |
| 文件     | 要发送到客户端的文件的路径。                             |
| 元     | 元文件和相应的数据文件的路径(格式:[PATH = DATA_FILE_TAG])。      |
| gxt       | gxt文件的路径。|

## asset-pack

此资源类型是为其他资源提供内容(如图片、视频、网页、JSON文件)。 此内容可以通过多种方式提供:

1. Webview:`http://assets/[packName]/filePath`  
2. Javascript: `import '@[packName]/filePath';`  
3. FileAPI:使用`@[packName]`之前的路径。

> [!div class="nohljsln"]
>```
> type = asset-pack
> client-files = [ ... ]
> ```
