# 故障排除客户端

由于不是每台系统都相同,alt:V客户端可能会出现各种问题。首先,您应该检查您的系统是否满足最低要求,之后应继续阅读本文的其余部分。如果本文中的内容未能帮助您,您可以尝试在我们的<a href="https://discord.altv.mp/" target="_blank">Discord</a> 中寻求帮助。

## 最低要求 

由于alt:V使用额外的技术,我们的最低要求略高于GTA V本身。如果您的电脑不满足这些要求,您仍然可以尝试运行alt:V,但很有可能出现一些问题。

> [!div class="nohljsln"]
> ```
> 操作系统:Windows 10 64位
> 处理器:Intel Core i5 3470 @ 3.2GHz(4核CPU)/ AMD X8 FX-8350 @ 4GHz(8核CPU)
> 内存:8 GB RAM 
> 图形:NVIDIA GTX 660 2GB / AMD HD 7870 2GB 
> 存储:SSD用于OS和游戏
> ```

## 基本步骤(建议首先尝试所有步骤解决任何问题)
1. 您需要至少启动一次单人游戏
2. 尝试以管理员身份运行 
3. 为alt:V添加防病毒例外(这包括Windows Defender)。
4. Avast甚至会阻止alt:V,即使您将其添加到白名单!
5. 尝试设置不同的[DNS服务器](https://developers.google.com/speed/public-dns/docs/using)(您可以使用[Cloudflare DNS](https://www.cloudflare.com/learning/dns/what-is-1.1.1.1/)、[Google DNS](https://developers.google.com/speed/public-dns)等)。
6. 确保alt:V安装在非桌面、非GTA:V目录和路径中不包含任何特殊字符的目录中。 
7. 确保已安装Visual C++ 2015-2019 可再分发包。<a href="https://aka.ms/vs/16/release/VC_redist.x64.exe" target="_blank">下载链接</a>
8. 确保您的所有设备(尤其是显卡)都具有最新驱动程序 
9. alt:V路径中仅使用ASCII字符。
10. alt:V目录的路径要短,例如D:/altV 
11. 使用Windows 10或更高版本 
12. 如果Steam版本卡在“加载alt:V客户端”上,请尝试结束Steam进程。(也尝试禁用Steam自动启动。) 
13. 您必须使用GTA V的干净版本。像Redux或Natural Vision之类的图像mod不能存在于您的GTA V安装中。 
14. 如果在加入服务器时游戏崩溃,请尝试不带mod的服务器(例如自由漫游服务器)。如果在这样的服务器上正常工作,请联系崩溃服务器的服务器团队。 
15. 尝试重启您的PC  

## 已知问题和解决方法

#### RageMP启动
这会发生当RageMP安装在GTA目录中。您可以随后在单独的文件夹中安装它。

1. 转到GTA目录。  
2. 从其中删除所有RageMP文件和文件夹。  

#### Steam版本或Steam启动  
这些步骤仅用于Rockstar Games Launcher和Epic Games版本。

1. 转到GTA目录
2. 从GTA目录中删除steam_api64.dll  

#### Epic Games启动器启动  
这些步骤仅用于Rockstar Games Launcher和Steam版本。  

1. 转到GTA目录  
2. 从GTA目录中删除EOSSDK-Win64-Shipping.dll  

#### 启动游戏时超时
1. 转到alt:V目录  
2. 使用首选编辑器(例如记事本)打开altv.toml  
3. 在底部添加`gameTimeout = 120`,其中120(秒)是最大等待时间  

#### FPS问题  
1. 启动单人游戏  
2. 转到图形设置  
3. 将MSAA设置为关闭  

#### 界面无响应  
1. 启动单人游戏  
2. 转到"键盘/鼠标"设置  
3. 将"鼠标输入方法"更改为"原始输入"   

#### 网页视图滞后
这可以减少网页视图的性能,但可能可以修复输入滞后:

1. 在键盘上按"Windows + R"  
2. 在出现的窗口中输入"ms-settings:display-advancedgraphics"  
3. 点击"确定"  
4. 将"硬件加速的GPU调度"切换为关闭  

#### 网页视图不起作用
如果在启动alt:V后卡在世界下方或看到灰色世界(<a href="https://i.gyazo.com/thumb/1200/493c99558d9424a48282560b8e0160da-png.jpg">图片</a>),则alt:V和GTA V的网页视图未在同一GPU上呈现。这可以通过强制Windows在同一GPU上呈现altv.exe、cef/altv-webengine.exe和gta5.exe来解决。下面是可以实现这一目的的一些示例:

###### 笔记本电脑优先
1. 在键盘上按"Windows + R"  
2. 在出现的窗口中输入"ms-settings:display-advancedgraphics"  
3. 点击"确定"  
4. 点击"搜索"并选择"altv.exe"、"altv-webengine.exe"和"gta5.exe",一个接一个地选择  
5. 选择"选项"并为两个程序选择"高性能"  

###### NVIDIA显卡  
1. 打开NVIDIA控制面板  
2. 3D设置  
3. 管理3D设置  
4. 程序设置  
5. 添加"altv.exe"、"altv-webengine.exe"和"gta5.exe"  
6. 为这两个程序的"OpenGL渲染GPU"功能选择相同的显卡。   

###### AMD显卡
1. 右键单击桌面并选择AMD Radeon 设置  
2. 选择系统  
3. 选择可切换图形  
4. 添加"altv.exe"、"altv-webengine.exe"和"gta5.exe",并选择"高性能"  
5. 可以在<a href="https://www.amd.com/en/support/kb/faq/dh-017">这里</a>找到更详细的描述  

#### Linux上网页视图不呈现  
如果Linux上网页视图不呈现,您可能在`/cef`文件夹中缺少必需的库。要允许CEF正确加载,必须从`/libs`复制丢失的库到`/cef`。以下是CEF工作所需复制的文件列表。  

(使用[Wine-GE](https://github.com/GloriousEggroll/wine-ge-custom/releases)和[Lutris](https://lutris.net/)与从Windows版本的Steam下载的GTA:V测试)

##### 需要复制到`/cef`目录的文件

-   libce2.dll  
-   icudtl.dat  
-   snapshot_blob.bin
-   chrome_elf.dll
-   v8_context_snapshot.bin

#### 从Social Club注销  
如果在玩alt:V时总是从Social Club注销,那么Windows的文件夹访问监视器可能已打开。通过以下步骤可以关闭此功能:

1. 打开Windows安全性  
2. 选择病毒和威胁防护设置  
3. 选择受控文件夹访问  
4. 将其关闭或将alt:V文件夹列入白名单  

#### "altv-client.dll无法加载"  

###### 卡巴斯基防病毒或卡巴斯基互联网安全
如果使用卡巴斯基防病毒或卡巴斯基互联网安全软件,即使已采取所有可能的免责声明,也会导致出现"altv-client.dll无法加载"错误。解决此问题的唯一方法是禁用病毒扫描程序。保持alt:V窗口焦点可以减少错误发生的机会。

###### 其他
另一个问题可能是您的用户对alt:V目录没有足够的权限。

1. 右键单击alt:V文件夹并选择"属性"。  
2. 选择"安全"选项卡。  
3. 点击"编辑..."按钮。  
4. 在"组或用户名:"列表中选择您的用户。  
5. 在"允许"下选择"完全控制"复选框。  
6. 点击"应用"按钮。  

#### 鼠标困在屏幕中间
1. 启动GTA V单人模式。  
2. 转到鼠标设置。  
3. 将鼠标设置改为其他设置。  

#### 其他内容挂钩了DirectX上下文。尝试关闭可以做到这一点的程序...(Riva Tuner、Fraps等等)  
关闭Riva Tuner、Fraps或Streamlabs OBS等程序  

#### 未能获取更新  
这通常是在更新alt:V客户端或防病毒软件阻止下载时连接中断导致的错误。尝试禁用您的防病毒软件,如果这不起作用,请稍后再试。  

#### 您的游戏版本是X,但目前只支持Y。更新您的游戏!  
您需要将GTA:V更新到最新版本。尝试验证游戏缓存或找出其他方法强制更新游戏。  

#### Widevine CDM注册失败 
您可以忽略此消息,因为它不会造成任何问题。

#### 客户端在启动时崩溃/关闭
这可能意味着某个程序或服务正在阻止alt:V并导致其崩溃。您应尝试禁用所有与Microsoft无关的服务。

1. 在键盘上按"Windows + R" 
2. 在出现的窗口中输入"msconfig"
3. 点击"确定" 
4. 选择"服务"标签
5. 选中位于窗口底部的"隐藏所有Microsoft服务"框。
6. 点击"禁用所有"按钮
7. 滚动并找到"Rockstar Games Library Service",并选中它。 
8. 点击"应用"按钮
9. 重启您的电脑

如果alt:V正在工作,您可以重新选中某些服务,直到找到导致崩溃的服务。如果找到导致问题的服务,请在Discord上联系我们。

#### 已知会导致问题的服务:
NVIDIA Display Container LS

#### 从浏览器启动alt:V时要求安装目录  
如果浏览器中的启动选项中保存了旧条目,则可能会发生这种情况。

#### 启动器无法打开/打开时崩溃
有时故障驱动程序会导致启动器中的一些问题。
如果您有`C:\Windows\USB Vibration\dr100&110\811EZFRD64.dll` - 可以重命名该文件或删除它。

#### 资源的完整性检查失败
这可能是因为您的磁盘空间不足。  
如果您有足够的可用空间,请尝试以下操作:
1. 打开alt:V启动器文件夹  
2. 删除缓存文件夹  
3. 重新连接到服务器  

###### Firefox  
1. 按菜单按钮(汉堡菜单)  
2. 选择"选项"  
3. 在左侧选择"常规"  
4. 滚动到"文件和应用程序"  
5. 在"应用程序"部分选择"altv"条目  
6. 在"操作"列中选择"总是询问"  
7. 下次启动时,将询问您是否要使用新条目。
