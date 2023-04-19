# 14.0 版本发布 

> [!WARNING]
> 此更新是最新的。

> [!TIP]  
> 此更新于2023年3月31日发布。

> [!div class="nohljsln"] 
>```yaml
>- 14.1:  
>   - 修复玩家人数错误
>- 14.2:  
>   - 修复一些 cef 核心修复
>- 14.3:
>   - 修复 cef 性能问题
>- 14.4:  
>   - 修复一些主服务器问题
>- 14.5:  
>   - 主服务器修复
>- 14.6:
>   - 主服务器修复
>- 14.7:  
>   - 主服务器修复
>- 14.8:  
>   - 主服务器修复 
>- 14.9:
>   - 主服务器修复
>- 14.10: 
>   - 主服务器修复
>- 14.11:
>   - CI 更改
>- 14.13:
>   - 流式模式修复
>- 14.14:
>   - 大量实体冻结修复   
>   - 车主变更时的车辆传送修复
>   - 车辆角速度抖动修复  
>   - 死亡尸体同步修复
>- 14.15:
>   - 还原车辆角速度抖动修复
>- 14.16:
>   - 车辆角速度抖动修复
>```

## 客户端

### <span style="color: red;">重大变更</span>

> [!div class="nohljsln"] 
> ```yaml
>- 如果通过本地设置,则禁用布料同步  
> ```

### Added

> [!div class="nohljsln"]
yaml
>- 在 CEF 下渲染 RMLUI  
>- RMLUI 更新到 5.0  
>- RMLUI 抗锯齿  
>- RMLUI 后备字体
>- getPedBonePos 方法
>- 语音键绑定的侧面鼠标按钮
>- 下载资源时显示下载速度  
>- 服务器权限翻译
>- 第一次启动时按 Enter 提交昵称
>- 客户端控制台布局的适应性  
>- 暂停菜单 ped 活动时的 cef 支持  
>- CEF 更新到 v103  
>- 全新 UI  
>- clear 控制台命令  
>- rmlui 的 ime 支持
>- 在启动程序中如果 gta:v 启动失败,显示错误消息  
>- 安装时选择语言  
>- debug、branch 和 skipprocessconfirmation cli 参数
>- 安装程序和卸载程序重构  
>- 启动程序全面重构  
> ```

### 修复

> [!div class="nohljsln"]
> ``` yaml
> - 重新连接后两次显示断开模态
> - 连接拒绝后的错误菜单  
> - 在 FileDialog 上冻结的网页视图
> - 光标类型在网页视图销毁后未重置  
> - 崩溃转储位置文件夹
> - iframe 输入中的光标不可见
> - iframe 滚动  
> - rmlui 剪贴板  
> - 在资源停止时未销毁的对象和 blips  
> - 车辆布局元数据  
> - alt + f4 在车辆停止后立即停止车辆  
> - 资源重新启动后按 ESC 时崩溃  
> - 启动程序快捷方式是系统范围的  
> - 服务器网址总是小写  
> - 网页视图中的输入未触发聚焦和失焦事件  
> - GTA 声音选项未保存  
> - 如果使用数据网址,网页视图保持未聚焦  
> - 在暂停菜单中克隆 ped 使所有 UI 消失  
> - 测试 ProbeAgainstWater 本地测试  
> ```

## 服务端

### 添加

> [!div class="nohljsln"]
> ```yaml
> - "全部" 作为语言设置
> ```

## JS Module

### 添加
> [!div class="nohljsln"]
> ```yaml
> - (服务器)在使用已弃用方法时显示源路径
> - (服务器)自动修复带有特殊字符的路径
> - (服务器)部分 TextEncoder 和 TextDecoder
> - (服务器)将 nodeJS 更新到 18.13.1
> - (服务器)在 weapondamage 事件中可以修改损害值
> - (客户端)将 v8 更新到 10.2
> - 允许发出类型数组
> ```

### 修复
> [!div class="nohljsln"]
> ```yaml
> - (客户端)webview、audio、websocket 和 rml geteventhandler 返回已删除的响应  
> - (客户端)如果实体无效,则在车辆处理中崩溃  
> - (客户端)内部错误。使用例如 toLocaleString 时出现 Icu 错误
> ```

## C# Module

### <span style="color: red;">破坏性变更</span>

> [!div class="nohljsln"]
> ```yaml
> - OnRemove() 方法替换为 OnDestroy()
> ```

### 添加
> [!div class="nohljsln"]
> ```yaml
> - alt:V 自定义 .NET 项目模板
> - (客户端)添加所有缺少的车辆属性
> ```

### Fixed
> [!div class="nohljsln"]
> ```yaml
> - (客户端) weapondata 使用属性
> ```

### 重构
> [!div class="nohljsln"]
> ```yaml
> - 将 Remove() 方法标记为已弃用,并添加 Destroy() 方法以实现一致的 alt:V api  
> ```
