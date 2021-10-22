# Client Console

alt:V has a Client Console integrated which can be opened with the key "F8". It shows the output of clientside [alt.log()](https://docs.altv.mp/js/api/alt-client.html#_altmp_altv_types_alt_client_log), some additional informations and has an inputfield for commands, which can be accessed from a clientside script with the [consoleCommand Event](https://docs.altv.mp/js/api/alt-client.IClientEvent.html#_altmp_altv_types_alt_client_IClientEvent_consoleCommand). But there are also some default Commands which are listed below, some of them need the debug mode of the client enabled.<br>
If the console is opened the Game Controls are disabled, which can be checked with [alt.gameControlsEnabled()](https://docs.altv.mp/js/api/alt-client.html#_altmp_altv_types_alt_client_gameControlsEnabled).


# Default Commands

|       Command         |               Debug needed            |            Description           |
| :-------------------: | :-----------------------------------: |:-------------------------------: |
| netgraph [0/1]            | No            |   Shows a netgraph on the minimap for fps and network informations.               |
| quit                      | No            |   Closes the game.                                                                |
| heap                      | No            |   Shows "Heap benchmark infos" in console.                                        |
| timers                    | No            |   Shows "Timers benchmark infos" in console.                                      |
| reconnect [password]      | Yes           |   Reconnects to the same server, password is the server password and optional.    |
| external_console [0/1]    | No            |   Open console in a extra window.                                                 |
| voiceVolume [0-200]       | No            |   Sets the output volume.                                                         |
| voiceInputVolume [0-200]  | No            |   Sets the input volume.                                                          |
| js-module                 | No            |   Shows informations about the js module.                                         |
| debugvehs                 | No            |   Shows "Streamed in server vehicles info" in console.                            |
