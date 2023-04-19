# RmlUi 简介

本文介绍了 RmlUi 是什么及使用它的好处。

## RmlUi 是什么

RmlUi 是一个[开源](https://github.com/mikke89/RmlUi),轻量级的 C++ 库,支持 XHTML1 和 CSS2。  
由于直接在 alt:V 客户端实现以及较低的功能集,RmlUi 的性能要高得多,可以每帧更新。  
由于只支持 CSS2,因此不是所有 css 函数都可用。  
这可能意味着为 CEF WebView 编写的现有 CSS 代码可能与 RmlUi 不兼容,可能需要定制。  
更多信息可以在 [RmlUi 文档](https://mikke89.github.io/RmlUiDoc/pages/rcss.html) 中找到。

## 与 CEF WebView 的比较  

**优点**  

- 资源消耗更低  
- 由 alt:V 客户端直接控制,导致:  
- 性能更高  
- 更高的更新频率  

**缺点**  

- 由于 XHTML1 和 CSS2 标准,功能较少  
- 不支持 UI 框架(例如 VueJS、React、Angular 等)  

## 何时使用 RmlUi

由于功能较少和不支持 UI 框架,只建议在简单的网站或受益于更高更新频率的网站使用 RmlUi。  
例如,显示[姓名标签](nametags.md)(相对于各实体定位),需要很高的更新频率,使用 CEF WebView 无法实现。

## 文档  

特定编程语言的文档可以在各自的模块文档下找到:

- JavaScript
  - [RmlDocument](http://docs.altv.mp/js/api/alt-client.RmlDocument.html)
  - [RmlElement](http://docs.altv.mp/js/api/alt-client.RmlElement.html)
- C#
  - [RmlDocument](http://docs.altv.mp/cs/api/AltV.Net.Client.Elements.Entities.RmlDocument.html)
  - [RmlElement](http://docs.altv.mp/cs/api/AltV.Net.Client.Elements.Entities.RmlElement.html)
