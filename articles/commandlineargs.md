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
|   --port [port]               |   Specifies the port which the should bind to ([port] needs to be replaced with port)   |   |
|   --convert-config-format     |   Converts all ".cfg" config files to ".toml" format   |   |
|   --help                      |   Displays help text for all cli arguments    |   |

## Client launch options

| Key       |             Description             |
| ------    | :-------------------------------: |
|   -noupdate                 |   Skips alt:V updates (only works on the dev [branch](https://docs.altv.mp/articles/branches.html#dev-development)) |
|   -connecturl [url]         |   Directly connects to specfied url ([url] needs to be replaced with the connectionurl)   |
|   -debug                    |   Enables debug mode   |
|   -branch [branch]          |   Sets the branch to use ([branch] needs to be replaced with release, rc or dev)   |
|   -skipprocessconfirmation  |   Skips the confirmation message for closing an already running GTA V / alt:V instance   |

## Server Commands

| Key       |             Description             |
| ------    | :-------------------------------: |
|   start [resourcename]    |   Starts a server resource by name    |
|   stop [resourcename]     |   Stops a server resource by name     |
|   restart [resourcename]  |   Restarts a server resource by name  |
