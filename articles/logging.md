# Logging in alt:V

This article will explain the usage of logging in alt:V.<br>
It will explain the concept of logging, the different types of logging and how to use logging in alt:V.

## What is logging used for

As a programmer, logging is very important for debugging and showing information.<br>
By logging to the console, you can check the values of variables etc. at runtime to find your bug or optimize your code.

## Important things to know about logging

Don't use logging in production too much, because it can lag the console and will also hide the important logs you have placed.<br>
It is best to completely disable logging on the client in the production, and setting logging to the bare minimum (e.g. only errors) on the server.<br>
Also don't put any sensitive information into your logs, the logs get saved to a file in plain text, so logging e.g. a password to the console is a big security risk.

## When and how to use logging

There are different types of logging, which should be used for different kinds of logs.<br>
You can see a table of the different types of logs here:

| Type                                           | Usage                                                                |
| ---------------------------------------------- | -------------------------------------------------------------------- |
| <span style="color: cyan;">`Infos`</span>      | To display general information about something                       |
| <span style="color: orange;">`Warnings`</span> | To display something maybe being wrong, but not being very important |
| <span style="color: red;">`Errors`</span>      | To display something going very wrong, which needs immediate action  |

## Using colors in logs

If you want to make your log messages look better, you can use different color codes to highlight important parts of the message. Or to group/categorize your logs better.<br>
The color codes can be used by appending a color code, like this for example: `~r~`, before your part of the text that should have that color.<br>
You can see a list of all color codes in the table below:

| Color code  | Screenshot                                  |
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

## Using logs in your code

Here you can find small examples in the different programming languages alt:V offers on how to use logging:

**JavaScript**
```js
alt.log("~r~Hello ~g~World!");
alt.logWarning("This is a warning");
alt.logError("This is an error");
```

**C#**
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
