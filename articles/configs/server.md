# The `server.cfg` configuration file

The `server.cfg` file is the most important configuration file, it is the main configuration file for your whole server, and will define
important configurations like server name, amount of slots, loaded resources and more.

Here is a list of all configuration options for the `server.cfg` and what they are used for:
```yaml
# The display name of your server
name: "My server name"
# The binding address of your server (usually 0.0.0.0)
host: "0.0.0.0"
# The port of your server (default 7788)
port: 7788
# The amount of players that can play on your server concurrently
players: 256
# The password required to join your server
password: "mySecretPassword"
# If the server should be visible on the masterlist in the alt:V client
announce: true
# The gamemode your server is running
gamemode: "Freeroam"
# The website of your server
website: "example.com"
# The language of your server
language: "English"
# The description of your server
description: "My cool server"
# If the debug mode should be allowed (Debug mode allows debugging functions like reconnect or the CEF debugger)
debug: false
# The stream in distance for entities
streamingDistance: 400
# The migration distance for entities
migrationDistance: 150
# The timeout multiplier (must be >= 1)
timeout: 1
# The delay that is used when the announceRetryErrorAttempts are reached (in ms)
announceRetryErrorDelay: 10000
# Max retries until announceRetryErrorDelay will be used
announceRetryErrorAttempts: 50
# An array of all modules that should be loaded
modules: [
    "js-module",
    "csharp-module"
]
# An array of all resources that should be loaded
resources: [
    "myResource"
]
# Voice configuration (needs to be set to enable voice chat)
voice: {
    # The bitrate of the voice server
    bitrate: 64000,
    # The secret for the external server (only needed when using externalHost)
    externalSecret: "secret123",
    # The external host address (leave 127.0.0.1, if voice-server is on same machine)
    externalHost: "127.0.0.1",
    # The external host port
    externalPort: 7798,
    # The external host public address (should be the ip address of your server, not localhost!)
    externalPublicHost: "xx.xx.xx.xx",
    # The external host public port
    externalPublicPort: 7799
}
# The tags for your server (max. 4)
tags: [
    "Freeroam",
    "Cool"
]
# Should early auth be used for your server
useEarlyAuth: true
# The url for the early auth login page (only used when useEarlyAuth is true)
earlyAuthUrl: "https://example.com/login"
# Should a CDN be used for your server
useCdn: true
# The url for the CDN page
cdnUrl: "https://cdn.example.com"
```
