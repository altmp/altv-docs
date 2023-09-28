# External voice server

Depending on the number of players, it may be necessary to run the voice server on an external server, for example, to route network traffic to another network card or to use dedicated resources for the voice server.

This article deals with the setup of the external voice server and the connection to the alt:V server.

## Setup external voice server

First of all, the voice server must be downloaded, the links for this can be found in the [CDN](https://docs.altv.mp/articles/cdn_links.html) article under the topics Windows Server and Linux Server.

After the download, the voice server can be placed on any server (it can also be the same device as the alt:V server).

To configure it create a file named voice.toml, add the following content and adjust it accordingly:

```toml
# IP address of the external voice server used to receive the alt:V servers voice connection
# Can be a private ip or 0.0.0.0 to accept all
host = '0.0.0.0'
# Port used in combination with the ip above
port = 7798
# IP address which is used to receive the clients connections
# Should be a public ip or 0.0.0.0 to accept all
playerHost = '0.0.0.0'
# Port used for the clients connections
playerPort = 7799
# Secret shared between the alt:V server and the external voice server
secret = 1234567890
```

Now you only have to start the voice server and continue with the integration of the alt:V server.

## Integrate external voice server

To integrate the alt:V server only small adjustments to the server.toml are necessary:

```toml
# Define the map bound size
mapBoundsMinX = -10000
mapBoundsMinY = -10000
mapBoundsMaxX = 65536
mapBoundsMaxY = 65536
mapCellAreaSize = 100 #smaller areas uses more ram and less cpu

[voice]
streamingTickRate = 10
# The bitrate of the voice server
bitrate = 64000
# The secret for the external server (only needed when using externalHost)
# The secret must consist of numeric values only
externalSecret = 1234567890
# The external host address (leave 127.0.0.1, if voice-server is on same machine)
externalHost = "127.0.0.1"
# The external host port
externalPort = 7798
# The external host public address (should be the ip address of your server, not localhost!)
externalPublicHost = "xx.xx.xx.xx"
# The external host public port
externalPublicPort = 7799
```
