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

## Timestamp format of logs

You can change how timestamp look and what information they contain. By default it's `%H:%M:%S`. For example you can add `logTimeFormat = "%d.%m.%Y %H:%M:%S"` to [server](~/articles/configs/server.md) config and then all logs will look like this: `[01.10.2024 00:08:22] something`. It's also possible to change timestamp format of client logs in the same way, by changing or adding (if such key does not exist already) to your [client](~/articles/configs/client.md) config.

> At the time of writing this key when set in client config only changes format of external console (`useExternalConsole` config key), the in-game console is not affected by this setting.

### Specifiers

| Specifier |                                                                                                  Replaced by |          Example         |   |   |
|:---------:|-------------------------------------------------------------------------------------------------------------:|:------------------------:|---|---|
| %a        |                                                                                   Abbreviated weekday name * | Thu                      |   |   |
| %A        |                                                                                         Full weekday name *  | Thursday                 |   |   |
| %b        |                                                                                     Abbreviated month name * | Aug                      |   |   |
| %B        |                                                                                            Full month name * | August                   |   |   |
| %c        |                                                                               Date and time representation * | Thu Aug 23 14:55:02 2001 |   |   |
| %C        |                                                         Year divided by 100 and truncated to integer (00-99) | 20                       |   |   |
| %d        |                                                                        Day of the month, zero-padded (01-31) | 23                       |   |   |
| %D        |                                                                  Short MM/DD/YY date, equivalent to %m/%d/%y | 08/23/01                 |   |   |
| %e        |                                                                       Day of the month, space-padded ( 1-31) | 23                       |   |   |
| %F        |                                                                Short YYYY-MM-DD date, equivalent to %Y-%m-%d | 2001-08-23               |   |   |
| %g        |                                                                     Week-based year, last two digits (00-99) | 01                       |   |   |
| %G        |                                                                                              Week-based year | 2001                     |   |   |
| %h        |                                                                        Abbreviated month name * (same as %b) | Aug                      |   |   |
| %H        |                                                                                   Hour in 24h format (00-23) | 14                       |   |   |
| %I        |                                                                                   Hour in 12h format (01-12) | 02                       |   |   |
| %j        |                                                                                    Day of the year (001-366) | 235                      |   |   |
| %m        |                                                                            Month as a decimal number (01-12) | 08                       |   |   |
| %M        |                                                                                               Minute (00-59) | 55                       |   |   |
| %n        |                                                                                    New-line character ('\n') |                          |   |   |
| %p        |                                                                                         AM or PM designation | PM                       |   |   |
| %r        |                                                                                         12-hour clock time * | 02:55:02 pm              |   |   |
| %R        |                                                                      24-hour HH:MM time, equivalent to %H:%M | 14:55                    |   |   |
| %S        |                                                                                               Second (00-61) | 02                       |   |   |
| %t        |                                                                              Horizontal-tab character ('\t') |                          |   |   |
| %T        |                                                      ISO 8601 time format (HH:MM:SS), equivalent to %H:%M:%S | 14:55:02                 |   |   |
| %u        |                                                            ISO 8601 weekday as number with Monday as 1 (1-7) | 4                        |   |   |
| %U        |                                       Week number with the first Sunday as the first day of week one (00-53) | 33                       |   |   |
| %V        |                                                                                 ISO 8601 week number (00-53) | 34                       |   |   |
| %w        |                                                           Weekday as a decimal number with Sunday as 0 (0-6) | 4                        |   |   |
| %W        |                                       Week number with the first Monday as the first day of week one (00-53) | 34                       |   |   |
| %x        |                                                                                        Date representation * | 08/23/01                 |   |   |
| %X        |                                                                                        Time representation * | 14:55:02                 |   |   |
| %y        |                                                                                Year, last two digits (00-99) | 01                       |   |   |
| %Y        |                                                                                                         Year | 2001                     |   |   |
| %z        | ISO 8601 offset from UTC in timezone (1 minute=1, 1 hour=100)  If timezone cannot be termined, no characters | +100                     |   |   |
| %Z        |                               Timezone name or abbreviation *  If timezone cannot be termined, no characters | CDT                      |   |   |
| %%        |                                                                                                     A % sign | %                        |   |   |

* The specifiers marked with an asterisk (*) are locale-dependent.
Two locale-specific modifiers can also be inserted between the percentage sign (%) and the specifier proper to request an alternative format, where applicable:

| Modifier |                    Meaning                    |                      Applies to                     |   |   |
|:--------:|:---------------------------------------------:|:---------------------------------------------------:|---|---|
| E        | Uses the locale's alternative representation  | %Ec %EC %Ex %EX %Ey %EY                             |   |   |
| O        | Uses the locale's alternative numeric symbols | %Od %Oe %OH %OI %Om %OM %OS %Ou %OU %OV %Ow %OW %Oy |   |   |
