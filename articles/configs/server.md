# `server.toml` 配置文件
`server.toml` 文件是最重要的配置文件,它是整个服务器的主要配置文件,并将定义 
像服务器名称、插槽数量、加载的资源等重要配置。  当前的 `server.cfg` YAML 格式已被弃用,但仍支持。这里是 `server.toml` 的所有配置选项及其用途的列表: 
```toml
# 您的服务器显示名称 
name = "我的服务器名称"
# 您的服务器绑定地址(通常为 0.0.0.0)
host = "0.0.0.0" 
# 您的服务器端口(默认为 7788)
port = 7788 
# 可以同时在您的服务器上游戏的玩家数量 
players = 256 
# 连接您的服务器所需的密码 
password = "我的机密密码"
# 服务器是否在alt:V客户端的主列表中可见 
announce = true 
# 为主列表宣布服务器的令牌
token = "令牌" 
# 您的服务器正在运行的游戏模式 
gamemode = "自由"
# 您的服务器网站 
website = "example.com"
# 您的服务器语言 
language = "英语" 
# 您的服务器描述 
description = "我有趣的服务器"
# 是否应允许调试模式(调试模式允许调试功能,如重新连接或CEF调试器)
debug = false 
# 实体的流媒体距离 
streamingDistance = 400 
# 实体的迁移距离 
migrationDistance = 150 
# 超时倍数(必须≥1) 
timeout = 1 
# 到达 announceRetryErrorAttempts 时使用的延迟(以毫秒为单位) 
announceRetryErrorDelay = 10000 
# announceRetryErrorDelay 将使用之前的最大重试次数 
announceRetryErrorAttempts = 50
# 可以使用相同 IP 地址连接的最大玩家数 
duplicatePlayers = 4096# 定义地图边界大小 
mapBoundsMinX = 10000#值被视为负 
mapBoundsMinY = 10000#值被视为负 
mapBoundsMaxX = 65536
mapBoundsMaxY = 65536 
mapCellAreaSize = 100#较小的区域使用更多的内存和较少的 CPU  # 定义应该发生 colshape 计算的速率(毫秒)(dev/13.0-dev32 和更高版本)
colShapeTickRate = 200  # 定义服务器应使用的日志流(控制台、文件、stdconsole)(dev/13.0-dev32 和更高版本) 
logStreams = [ "console", "file" ]# 定义用于实体计算(如 colshapes、streaming 等)的工作线程数。良好的值为 CPU 数*2 
entityWorkerCount = 8# 您的服务器的标签(最多 4 个)
tags = [
    "自由",
    "有趣"
]  # 您的服务器是否应启用连接队列。 
# 需要接受或拒绝连接的 ConnectionQueueAdd 和 ConnectionQueueRemove服务器端事件 
connectionQueue = false
# 您的服务器是否应使用早期身份验证
useEarlyAuth = false
# 早期身份验证登录页面的 URL(仅在 useEarlyAuth 为 true 时使用)
earlyAuthUrl = "https://example.com/login"
# 您的服务器是否应使用 CDN
useCdn = false
# CDN 页面的 URL
cdnUrl = "https://cdn.example.com"

# alt:V 服务器是否应在连接时发送所有客户端的玩家名称
sendPlayerNames = true

# 在玩家连接后 自动将玩家生成至 0,0,71
spawnAfterConnect = true

# 应加载的所有资源的数组
resources = [
    "myResource",
    # 从 alt:V 10.0 开始,您还可以使用子目录中的资源 
    "vehicles/firstVehicle",
    "vehicles/secondVehicle"
]
# 应加载的所有模块的数组
modules = [
    "js-module",
    "csharp-module"
]

# 实体创建、流媒体系统等的分析  
[worldProfiler]  
port = 7797
host = "0.0.0.0"

# 与 js-module 相关的设置
[js-module]
# "https://nodejs.org/api/cli.html#--enable-source-maps"
source-maps = true  
# "https://nodejs.org/api/cli.html#--heap-prof"
heap-profiler = true
# 启用分析器
profiler = true
# "https://nodejs.org/api/cli.html#--experimental-global-webcrypto"
global-webcrypto = true
# "https://nodejs.org/api/cli.html#--experimental-network-imports"
network-imports = true
# 将额外的 CLI 参数添加到节点环境"https://nodejs.org/api/cli.html"
extra-cli-args = ["--inspect=127.0.0.1:9229", "--max-old-space-size=8192"]
# 启用 Node.js 检查器  
[js-module.inspector]
host = "127.0.0.1"
port = 9229

# 与csharp-module 相关的设置  
[csharp-module] 
# 在服务器启动时禁用依赖项(NuGet)检查和下载,如果您与NuGet服务器的连接很差(例如中国),这是很推荐的  
disableDependencyDownload= true  

# 语音配置(需要设置才能启用语音聊天)
[voice]
# 语音服务器的比特率  
bitrate = 64000
# 外部服务器的密码(仅在使用 externalHost 时需要)
# 密码必须仅由数字组成  
externalSecret = "1234567890"
# 外部主机地址(如果语音服务器在同一台机器上,请留空 127.0.0.1)
externalHost = "127.0.0.1"  
# 外部主机端口
externalPort = 7798
# 外部公共主机地址(应为您的服务器的 IP 地址,而不是 localhost!)
externalPublicHost = "xx.xx.xx.xx"
# 外部公共主机端口  
externalPublicPort = 7799
