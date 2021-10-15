# Master list API

The master list api allow you to fetch data from the alt:V master list service.

## Information

* GET only
* Return JSON Object
* If abused you can be banned from using the API

## API Links

|                   URL                      |                                        Description                                                      |
| :----------------------------------------: | :-----------------------------------------------------------------------------------------------------: |
| https://api.altv.mp/servers                | Statistics - Player Count across all servers & The amount of servers online                             |
| https://api.altv.mp/servers/list           | Servers - All information known about all servers (Name, Description, IP, Language, Website, Etc.)      |
| https://api.altv.mp/server/MASTERLIST_ID   | Specific Server - Filters server list for a specific one. Uses "id" which is unique to the server token |
| https://api.altv.mp/avg/MASTERLIST_ID/TIME | Averages - Returns averages data about the specified server (TIME = 1d, 7d, 31d)                        |
| https://api.altv.mp/max/MASTERLIST_ID/TIME | Maximum - Returns maximum data about the specified server (TIME = 1d, 7d, 31d)                          |

## Response example
### Statistics

```json
{ "ServersCount": 64, "playersCount": 1582 }
```

### Server list
it's a fragment of API's response.
```json
[
    {
        "id":"ceaac3d1cc22761223beac38386f5ab2",
        "maxPlayers":128,
        "players":0,
        "name":"Simple Freeroam Server | by PlebMasters.de",
        "locked":false,
        "host":"116.203.227.203",
        "port":7791,
        "gameMode":"Freeroam",
        "website":"discord.gg/86uqkqc",
        "language":"en",
        "description":"A simple game mode to test the performance of alt:V, but also to move freely around the map without any rules.",
        "verified":false,
        "promoted":false,
        "useEarlyAuth":false,
        "earlyAuthUrl":"",
        "useCdn":false,
        "cdnUrl":"",
        "useVoiceChat":false,
        "tags":
            [
                "No Rules",
                "All Weapons",
                "All Vehicles"
            ],
        "bannerUrl":null,
        "branch":"release",
        "build":1181,
        "lastUpdate":1596840894273
    }
]
```

### Specific server
```json
{
    "active":true,
    "info":{
        "id":"ceaac3d1cc22761223beac38386f5ab2",
        "maxPlayers":128,
        "players":0,
        "name":"Simple Freeroam Server | by PlebMasters.de",
        "locked":false,
        "host":"144.91.81.134",
        "port":7791,
        "gameMode":"Freeroam",
        "website":"discord.gg/86uqkqc",
        "language":"en",
        "description":"A simple game mode to test the performance of alt:V, but also to move freely around the map without any rules.",
        "verified":false,
        "promoted":false,
        "useEarlyAuth":false,
        "earlyAuthUrl":"",
        "useCdn":false,
        "cdnUrl":"",
        "useVoiceChat":false,
        "tags":[
            "No Rules",
            "All Weapons",
            "All Vehicles",
            "Enabled Cayo Perico"
        ],
        "bannerUrl":null,
        "branch":"release",
        "build":-1,
        "version":"2.8",
        "lastUpdate":1612571971068
    }
}
```

### Average / Maximum
```json
[
    { "t":1612562230,"c":4 },
    { "t":1612562280,"c":4 },
    { "t":1612562341,"c":4 }
]
```
Description: t = Timestamp in UTC, c = Player Count.

# altstats.net - alt:V Stats API (Unofficial)

altstats.net - alt:V Stats is a alternative server list, developed and supported by members of the altMP Team. It has additional statistics about servers like player count for the last 24 hours, 7 days or month and you have a server specific API.

Features like showing the player count for the last month are premium features, you need to pay for them to enable them. 
## Information

* GET only
* Return JSON Object
* If abused you can be banned from using the API
* API can change anytime without notice

## API Links

|                     URL                         |                           Description                           |
| :---------------------------------------------: | :-------------------------------------------------------------: |
| https://api.altstats.net/api/v1/master          | Count - Shows the server and player count for the last 24 hours |
| https://api.altstats.net/api/v1/server          | Servers - Basic information about all known servers             |
| https://api.altstats.net/api/v1/server/serverID | Specific Server - Lists you all information about a server      |

## Response example
### Count
```json
[
  {
    "ServerCount": 72,
    "PlayerCount": 958,
    "TimeStamp": "2021-01-01T12:15:00.464Z"
  },
  {
    "ServerCount": 73,
    "PlayerCount": 945,
    "TimeStamp": "2021-01-01T12:10:00.465Z"
  },
  {
    "others": "..."
  }
]
```

### Servers
```json
[
  {
    "others": "..."
  },
  {
    "id": 330,
    "name": "Simple Freeroam Server | by PlebMasters.de",
    "locked": 0,
    "playerCount": 1,
    "slots": 128,
    "gameMode": "Freeroam",
    "language": {
      "full": "English",
      "short": "gb"
    },
    "official": 0,
    "verified": 0,
    "promoted": 0,
    "tags": [
      "No Rules",
      "All Weapons",
      "All Vehicles",
      "Enabled Cayo Perico"
    ]
  },
  {
    "others": "..."
  }
]
```

### Specific server
```json
{
  "Id": 330,
  "FoundAt": "2020-01-01T12:41:21.433Z",
  "LastActivity": "2021-01-01T12:00:19.364Z",
  "Visible": true,
  "ServerId": "ceaac3d1cc22761223beac38386f5ab2",
  "Players": 1,
  "Name": "Simple Freeroam Server | by PlebMasters.de",
  "Locked": false,
  "Ip": "144.91.81.134",
  "Port": 7791,
  "MaxPlayers": 128,
  "Ping": 0,
  "Website": "discord.gg/86uqkqc",
  "Language": "English",
  "Description": "A simple game mode to test the performance of alt:V, but also to move freely around the map without any rules.",
  "LastUpdate": 1609502415186,
  "IsOfficial": false,
  "PlayerRecord": 34,
  "PlayerRecordDate": "2020-07-01T14:15:07.388Z",
  "LastFetchOnline": true,
  "LanguageShort": "gb",
  "GameMode": "Freeroam",
  "Branch": "release",
  "Build": -1,
  "CdnUrl": "",
  "EarlyAuthUrl": "",
  "Verified": false,
  "UseCdn": false,
  "UseEarlyAuth": false,
  "BannerUrl": null,
  "Promoted": false,
  "Tags": [
    "No Rules",
    "All Weapons",
    "All Vehicles",
    "Enabled Cayo Perico"
  ],
  "UseVoiceChat": false,
  "Level": 3,
  "Version": "2.2"
}
```