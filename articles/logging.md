# alt:V中的日志记录

本文将解释alt:V中的日志记录的用法。<br>
它将解释日志记录的概念、不同类型的日志记录以及如何在alt:V中使用日志记录。

## 日志记录的用途

作为程序员,日志记录对调试和显示信息非常重要。<br>
通过将日志记录到控制台,您可以在运行时检查变量的值等,以找到bug或优化代码。

## 关于日志记录需要知道的重要事项

不要在生产环境中过度使用日志记录,因为它会使控制台滞后,并且还会隐藏您放置的重要日志。<br>
最好在生产环境中完全禁用客户端的日志记录,并将服务器上的日志记录设置为最低限度(例如,仅错误)。<br>
另外,不要在日志中放置任何敏感信息,日志会以纯文本格式保存到文件中,因此将密码记录到控制台是一个巨大的安全隐患。

## 何时以及如何使用日志记录

有不同类型的日志记录,应用于不同类型的日志。<br>
您可以在这里看到不同类型日志的表格:

| 类型                                           | 用途                                                                |
| ---------------------------------------------- | -------------------------------------------------------------------- |
| <span style="color: cyan;">`信息`</span>      | 显示有关某事的一般信息                       |
| <span style="color: orange;">`警告`</span> | 显示某事可能出错,但不太重要 | 
| <span style="color: red;">`错误`</span>      | 显示需要立即采取行动的某事出错的情况   |

## 在日志中使用颜色

如果您想让日志消息看起来更好,可以使用不同的颜色代码来强调消息的重要部分。或者为了更好地分组/分类日志。<br> 
颜色代码可以通过在文本中要具有该颜色的部分之前附加颜色代码来使用,例如: `~r~`。<br>
您可以在下表中看到所有颜色代码的列表:

| 颜色代码  | 截图                                  |  
| ----------- | ------------------------------------------- |
| `~k~`       | <img src="https://i.imgur.com/yY2SFRY.png"> |
| `~r~`       | <img src="https://i.imgur.com/baznoxc.png"> |
| `~g~`       | <img src="https://i.imgur.com/l5rR0IK.png"> |
| `~b~`       | <img src="https://i.imgur.com/UxrGn1x.png"> |
| `~y~`       | <img src="https://i.imgur.com/opeovLN.png"> |
| `~m~`       | <img src="https://i.imgur.com/NM1Pjp2.png"> |
| `~c~`       | <img src="https://i.imgur.com/HISQbpP.png"> |
| `~w~`       | <img src="https://i.imgur.com/GCiTxlG.png"> |
| `~lk~`      | <img src="https://i.imgur.com/HGHzOeZ.png"> |
| `~lr~`      | <img src="https://i.imgur.com/UNvRM7X.png"> |
| `~lg~`      | <img src="https://i.imgur.com/VJ0Cv5j.png"> |
| `~lb~`      | <img src="https://i.imgur.com/78TlRwR.png"> |  
| `~ly~`      | <img src="https://i.imgur.com/h45ys47.png"> |
| `~lm~`      | <img src="https://i.imgur.com/ulzEp7v.png"> |
| `~lc~`      | <img src="https://i.imgur.com/5v1Vcjd.png"> |
| `~lw~`      | <img src="https://i.imgur.com/UsjQXdk.png"> |

## 在代码中使用日志

这里您可以找到alt:V提供的不同编程语言中使用日志记录的小例子:

# [Javascript](#tab/tabid-1)

```js
alt.log("~r~Hello ~g~World!");  
alt.logWarning("This is a warning");
alt.logError("This is an error");
```

# [C#](#tab/tabid-2)

```csharp
ColoredMessage coloredMessage = new ColoredMessage();
coloredMessage += TextColor.Red;
coloredMessage += "Hello ";
coloredMessage += TextColor.Green;
coloredMessage += "World!";
Alt.LogColored(coloredMessage);
Alt.LogWarning("This is a warning");
Alt.LogError("This is an error");
Alt.LogInfo("This is an info");
Alt.LogDebug("This is a debug message");
```
