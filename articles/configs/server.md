# The `server.toml` configuration file

The `server.toml` file is the most important configuration file, it is the main configuration file for your whole server, and will define
important configurations like server name, amount of slots, loaded resources and more.

The current `server.cfg` in `yaml` format is deprecated but will support too.

Here is a list of all configuration options for the `server.toml` and what they are used for:
```toml
# The display name of your server
name = "My server name"
# The binding address of your server (usually 0.0.0.0)
host = "0.0.0.0"
# The port of your server (default 7788)
port = 7788
# The amount of players that can play on your server concurrently
players = 256
# The password required to join your server
password = "mySecretPassword"
# If the server should be visible on the masterlist in the alt:V client
announce = true
# Token to announce the server to the masterlist
token = "superSecretToken"
# The gamemode your server is running
gamemode = "Freeroam"
# The website of your server
website = "example.com"
# The language of your server
language = "English"
# The description of your server
description = "My cool server"
# If the debug mode should be allowed (Debug mode allows debugging functions like reconnect or the CEF debugger)
debug = false
# The stream in distance for entities
streamingDistance = 400
# The migration distance for entities
migrationDistance = 150
# The timeout multiplier (must be >= 1)
timeout = 1
# The delay that is used when the announceRetryErrorAttempts are reached (in ms)
announceRetryErrorDelay = 10000
# Max retries until announceRetryErrorDelay will be used
announceRetryErrorAttempts = 50
# Max players which can connect with the same ip address
duplicatePlayers = 4096

#Can be used to share resources between 2 servers, so you dont need to redownload all the time for live & testserver for example. Projectname should be unique
#sharedProjectName = "altv-shared"

# Define the map bound size
mapBoundsMinX = -10000
mapBoundsMinY = -10000
mapBoundsMaxX = 65536
mapBoundsMaxY = 65536
mapCellAreaSize = 100 #smaller areas uses more ram and less cpu

# Defines the rate (miliseconds) in which colshape calculations should occur
colShapeTickRate = 200

# Defines the used logging streams (console, file, stdconsole) for the server
logStreams = [ "console", "file" ]

# The tags for your server (max. 4)
tags = [
    "Freeroam",
    "Cool"
]

# Should connection queue be enabled for your server.
# ConnectionQueueAdd & ConnectionQueueRemove serverside events are required to accept or decline connections
connectionQueue = false
# Should early auth be used for your server
useEarlyAuth = false
# The url for the early auth login page (only used when useEarlyAuth is true)
earlyAuthUrl = "https://example.com/login"
# Should a CDN be used for your server
useCdn = false
# The url for the CDN page
cdnUrl = "https://cdn.example.com"

# Should alt:V server send all clients player name on connect
sendPlayerNames = true

# Spawn player automatically at 0,0,71 after connect
spawnAfterConnect = true

# An array of all resources that should be loaded
resources = [
    "myResource",
    # Since alt:V 10.0 you can also use resources in subdirectories
    "vehicles/firstVehicle",
    "vehicles/secondVehicle",
    # Since alt:V 15.0 you can even use * wildcard character to use all folders as resources
    "vehicles/*",
]

# An array of all modules that should be loaded
modules = [
    "js-module",
    "csharp-module"
]

# Enable only specific dlc packs
dlc-whitelist = [
    "mpBeach",
    "mpBusiness",
    "patchday27ng"
]

# Obfuscate resource names
hashClientResourceName = true

# extend gta pool sizes
[pools]
"DrawableStore" = 240420

# Profiling entity creation, systems like streaming etc
[worldProfiler]
port = 7797
host = "0.0.0.0"

[threads]
streamer = 1
migration = 1
syncSend = 8
syncReceive = 8

# Settings related to js-module
[js-module]
# "https://nodejs.org/api/cli.html#--enable-source-maps"
source-maps = true
# "https://nodejs.org/api/cli.html#--heap-prof"
heap-profiler = true
# Enable profiler
profiler = true
# "https://nodejs.org/api/cli.html#--experimental-global-webcrypto"
global-webcrypto = true
# "https://nodejs.org/api/cli.html#--experimental-network-imports"
network-imports = true
# Add extra cli arguments to the node environment "https://nodejs.org/api/cli.html"
extra-cli-args = ["--max-old-space-size=8192"]
# Enable node.js inspector
[js-module.inspector]
host = "127.0.0.1"
port = 9229

# Settings related to c#-module
[csharp-module]
# Disable dependency (NuGet) check and download at server startup, this is recommended if you have a bad connection to the NuGet server (e.g china)
disableDependencyDownload= true

# Voice configuration (needs to be set to enable voice chat)
[voice]
# The bitrate of the voice server
bitrate = 64000
# The secret for the external server (only needed when using externalHost)
# The secret must consist of numeric values only
externalSecret = "1234567890"
# The external host address (leave 127.0.0.1, if voice-server is on same machine)
externalHost = "127.0.0.1"
# The external host port
externalPort = 7798
# The external host public address (should be the ip address of your server, not localhost!)
externalPublicHost = "xx.xx.xx.xx"
# The external host public port
externalPublicPort = 7799
```
