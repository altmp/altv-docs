# Permissions System

Permissions are set on a resource-by-resource basis and have to be accepted by the user joining the server

## Permission Types
| Permission   |             Description             |
| ------ | :-------------------------------: |
|   Screen Capture      |   This allows a screenshot to be taken of the alt:V process (just GTA) and any webview    |
|   WebRTC              |   This allows peer-to-peer RTC inside JS                                                  |
|   Clipboard Access    |   This allows to copy content to users clipboard                                          |

## Required vs Option Permissions

Permissions can be either be optional or required. When they are optional, this will still allow the player to join the server if they don't agree to it however you will no longer have access to the features for which the permission covers. Required permissions behave differently in the fact that if the user does not accept them then they will be unable to access the server.

```
required-permissions: [
    Screen Capture
    WebRTC
    Clipboard Access
]

optional-permissions: [
    Screen Capture
    WebRTC
    Clipboard Access
]
```

> [!TIP]
> To check if a user has approved the respective permission the method [alt.getPermissionState](https://docs.altv.mp/js/api/alt-client.html#_altmp_altv_types_alt_client_getPermissionState) can be used.
