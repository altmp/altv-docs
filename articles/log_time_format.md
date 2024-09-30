# Timestamp format of logs

You can change how timestamp look and what information they contain. By default it's `%H:%M:%S`. For example you can add `logTimeFormat = "%d.%m.%Y %H:%M:%S"` to [server](~/articles/configs/server.md) config and then all logs will look like this: `[01.10.2024 00:08:22] something`. It's also possible to change timestamp format of client logs in the same way, by changing or adding (if such key does not exist already) to your [client](~/articles/configs/client.md) config

> At the time of writing this key when set in client config only changes format of external console (`useExternalConsole` config key), the in-game console is not affected by this setting

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
