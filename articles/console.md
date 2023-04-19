# 客户端控制台

alt:V集成了客户端控制台,可以通过键"F8"打开。它显示了客户端的[alt.log()](https://docs.altv.mp/js/api/alt-client.html#_altmp_altv_types_alt_client_log)输出、一些额外信息,并有一个用于输入命令的输入字段,客户端脚本可以通过[控制台命令事件](https://docs.altv.mp/js/api/alt-client.IClientEvent.html#altmp_altv_types_alt_client_IClientEvent_consoleCommand)访问。但是,还有一些默认命令,列在下面,其中一些需要启用客户端的调试模式。<br>
如果打开了控制台,游戏控制将被禁用,这可以通过[alt.gameControlsEnabled()](https://docs.altv.mp/js/api/alt-client.html#_altmp_altv_types_alt_client_gameControlsEnabled)检查。  


# 默认命令

|       命令         |               需要调试            |            说明           |
| :-------------------: | :-----------------------------------: |:-------------------------------: |
| netgraph [0/1]                            | 否            |   在小地图上显示fps和网络信息网格图。             |   
| quit                                      | 否            |   关闭游戏。                                    |
| heap                                      | 否            |   在控制台中显示"堆基准信息"。                    |
| heapspaces                                | 否            |   在控制台中显示"堆空间信息"。                    |
| timers                                    | 否            |   在控制台中显示"计时器基准信息"。                |
| reconnect [password]                      | 是            |   重新连接到同一服务器,密码是服务器密码,可选。     |
| external_console [0/1]                    | 否            |   在额外窗口中打开控制台。                       |
| voiceVolume [0-200]                       | 否            |   设置输出音量。                                |  
| voiceInputVolume [0-200]                  | 否            |   设置输入音量。                                |
| js-module                                 | 否            |   显示有关js模块的信息。                         |
| debugvehs                                 | 否            |   在控制台中显示"流入服务器的车辆信息"。          |
| rmldebug                                  | 是            |   显示RMLUI调试窗口                             |
| connect [ip:port or url] [password?]      | 是            |   连接到服务器。                                |
| clear                                     | 否            |   清除控制台。                                  |
