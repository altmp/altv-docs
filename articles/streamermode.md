# 流媒体模式

流媒体模式的理念是隐藏选定的网页视图(通常用于HUD和界面),使其不被OBS等录制和流媒体软件记录。该软件需要在"游戏捕获"模式下记录GTA V,此模式不会记录覆盖物。

## 如何激活流媒体模式?

打开alt:V文件夹,使用Notepad++或记事本打开altv.toml文件,在文件末尾添加`streamerMode = true`。如果已存在带有`streamerMode`的行,请将参数`false`修改为`true`。重启游戏,现在流媒体模式已启用。

## 如何在流媒体模式下脚本?

要创建在流媒体模式下不呈现的网页视图,需要将网页视图构造函数的参数overlay设置为`true`。如果未指定参数,overlay参数的默认值为`false`。

这里您可以看到一个示例,说明如何在流媒体模式下隐藏网页视图以避免流媒体软件录制:

```js
let webview = new alt.WebView("https://altv.mp", true); 
```
