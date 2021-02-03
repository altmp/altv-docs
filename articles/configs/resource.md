# The `resource.cfg` configuration file

The `resource.cfg` configuration file is needed for every resource you have, it has to be located in the main directory of your resource.<br>
It has some configuration options for your resource like the type of your resource and its dependencies.

Here is a list of all configuration options for the `resource.cfg` and what they are used for:
```yaml
# The serverside type of your resource (the correct module for that type has to be loaded)
type: "js"
# The clientside type of your resource (the correct module for that type has to be loaded)
client-type: "js"
# The main serverside file that will get loaded when the server starts
main: "server.js"
# The main clientside file that will get loaded when the client starts
client-main: "client.js"
# The files that the client has access to (The client-main file does not have to be included here)
client-files: [
    "myFile.js",
    # You can also use glob patterns to give access to a whole directory
    "client/*"
]
# The required permissions to play on the server (these have to be accepted, otherwise the player can't join)
required-permissions: [
    "Screen Capture"
]
# The optional permissions to play on the server (these permissions can be declined by the user)
optional-permissions: [
    "WebRTC"
]
# The dependencies of this resource (All dependencies get loaded before the resource)
deps: [
    "myOtherResource"
]
```
