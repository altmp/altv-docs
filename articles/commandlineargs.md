# Command-line Arguments

Command line arguments means you'll likely need to pass them to individual '.exe' or compiled server or client versions.

`<exe or file> --option1 --option2 --option3`

## Server launch options

| Key   |             Description             |             Notes             |
| ------ | :-------------------------------: | :-------------------------------: |
|   --config [path]             |   Path to server config file ([path] needs to be replaced with config path)   |   |
|   --logfile [path]            |   Path to log file, will only output one log file to specific path instead of putting them into the log folder ([path] needs to be replaced with log path)         |   Has higher priority then --logfolder   |
|   --logfolder [path]          |   Path to log folder ([path] needs to be replaced with log folder path)   |   	Has lower priority then --logfile   |
|   --no-logfile                |   Disables the logging to log files   |   |
|   --extra-res-folder [path]   |   Path to additional resource folder ([path] needs to be replaced with the the additional resource folder path)   |   |
|   --justpack                  |   Creates packages and a resources.json for cdn download in the root folder   |   |
|   --host [host]               |   Specifies the host which the server should bind to ([host] needs to be replaced with the host)   |   |
|   --port [port]               |   	Specifies the port which the should bind to ([port] needs to be replaced with port)   |   |

## Client launch options

| Key       |             Description             |
| ------    | :-------------------------------: |
|   -sandbox            |   Starts client into sandbox mode (Note: currently broken)                                |
|   -noupdate           |   Skips alt:V updates                                                                     |
|   -connecturl [url]   |   Directly connects to specfied url ([url] needs to be replaced with the connectionurl)   |

## Server Commands

| Key       |             Description             |
| ------    | :-------------------------------: |
|   start [resourcename]    |   Starts a server resource by name    |
|   stop [resourcename]     |   Stops a server resource by name     |
|   restart [resourcename]  |   Restarts a server resource by name  |

## Client Commands

| Key       |             Description             |
| ------    | :-------------------------------: |
|   netgraph 0/1            |   Shows a netgraph on the minimap for fps and network informations    |
|   reconnect [password]    |   Reconnect to a server if debug is true                              |
|   quit                    |   Closing the game                                                    |
|   heap                    |   Shows V8 Engine allocation information                              |
|   timers                  |   Shows how many timers a resource is using                           |
|   debugvehs               |   Shows streamed vehicles information                                 |