# 客户端配置

下载并安装 alt:V 多人游戏客户端后,您可以在安装文件夹中找到 `altv.toml` 文件。此文件包含客户端的设置。默认情况下,此文件只包含分支和指向您的 GTA:V 安装路径的路径。第一次启动 alt:V 后,`altv.toml` 中会有更多可用设置。但是,还有更多设置可以应用。大多数这些设置也可以在主菜单下的"设置"中应用,但其中一些设置需要直接在此文件中设置。

## 可能的客户端配置列表  

| 键                       |  类型                 |  默认值               |  描述                     |
| ---                       | ---                    | ---                  | ---                        |
|   name                    |   string               |   alt:V 昵称         | 在服务器上显示的您的名称。               |  
|   branch                  |   string               |   release            | 客户端将运行的[分支](~/articles/branches.md)。 |
|   build                   |   number               |   789                | 客户端将使用此分支的构建(通常由客户端自动生成)。   |
|   debug                   |   boolean (true/false) |   false              | 激活调试模式。例如,活动的调试模式启用调试控制台(通过 F8 访问)并允许您在控制台中使用 `reconnect` 命令。  |
|   gtapath                 |   string               |   -                  | 指向您的 GTA5 目录的路径。通常,它是通过安装过程自动设置的。 |  
|   lang                    |   string               |   en                 | 您客户端的语言。      |  
|   lastip                  |   string               |   0.0.0.0 (IPv4)     | 您最后玩的服务器的 IP 地址。 | 
|   netgraph                |   boolean(true/false)  |   false              | 在左下角显示网格图。   |
|   streamerMode            |   boolean(true/false)  |   false              | 启用或禁用[流媒体模式](~/articles/streamermode.md)。 | 
|   useExternalConsole      |   boolean(true/false)  |   false              | 启用或禁用外部控制台(控制台弹出)。  |
|   voiceActivationKey      |   number               |   78 (N)             | 设置按下说话键。您可以在[这里](https://keycode.info/)获取键代码。|
|   voiceActivationEnabled  |   boolean(true/false)  |   false              | 启用或禁用语音活动输入模式。     |
|   voiceInputSensitivity   |   number               |   20                 | 如果启用 voiceActivationEnabled,此选项将设置所需的敏感度。   |
|   voiceEnabled            |   boolean(true/false)  |   true               | 为客户端启用或禁用语音系统。     |
|   voiceAutoInputVolume    |   boolean(true/false)  |   true               | 启用或禁用自动确定输入音量。     |
|   voiceInputVolume        |   number               |   100                | 设置输入音量(范围:0 - 200)。  |  
|   voiceNoiseSuppression   |   boolean(true/false)  |   true               | 启用或禁用噪音抑制。         |
|   voiceVolume             |   number               |   100                | 设置输出音量(范围:0 - 200)。 |
|   earlyAuthTestURL        |   string               |   -                  | 指向您的提前认证网站的 URL。仅在 rc 和 dev 分支中可用。 |
|   gameTimeout             |   number               |   60                 | 启动器应等待 GTA V 启动的最大时间(以秒为单位)。   |

## 示例文件 altv.toml 

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
