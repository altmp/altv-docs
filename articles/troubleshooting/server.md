# Troubleshoot Server

Sometimes when you are running a server, some issues can occur. Most of these issues are repetitive and easy to solve. Therefore, this article collects the most common errors and their solutions.

## Known issues & solutions

#### Warning: To load an ES module, set "type": "module" in the package.json or use the .mjs extension.

This issue is caused by missing the `type` configuration inside your package.json. To solve this problem you need to add `"type":"module"` in your package.json

#### Failed to load "js-module.dll" Win32 error: 127 (7f)

If you head into your alt:V server directory, you will most likely find a `libnode.dll` file. In order to solve this issue, you need to delete this file.

#### Module outdated, module uses SDK vXX, server requires SDK vXX

You will sometimes get this error especially if there is a new release. Usually, it is enough to update your server by downloading the latest alt:V server files which include the latest `csharp-module.dll` or `js-module.dll`.

#### Error while reading server.toml on line xx, column. Reason: invalid token

This issue mostly occurs when strings are not put in double quotes. For example, the URL of your website is not put in double quotes inside the `server.toml` will cause this issue. To find the issue inside your`server.toml` you should pay attention to the error message which gives you the exact line.

#### Master server connect failed. Invalid token

Inside your `server.toml` you can find a configuration variable called `announce`. If this is set to `true`, you will need a **valid** token. Therefore, you need to request a master list token from the alt:V Master-Bot. To receive a token, you need to send a single message with the content "token" to `Master-Bot#3667` on discord. To obtain a token you have to meet one of the following requirements:

1. You can obtain a token for broadcasting to the master list by waiting 30 days to generate one.
2. You can obtain a token immediately by subscribing as a Bronze Patreon to generate your token. If you would like to go down this route you can visit https://www.patreon.com/altVMP to subscribe.

Keep in mind that you usually do not need a master list announcement while you are in the development stage. You can set the `announce` flag to `false` inside your `server.toml`.

#### Unhandled Exception: Received an unhandled exception from: ...

When you use C# on your server-side, you will encounter this problem sometimes. You can easily solve this problem by updating the alt:V NuGet packages and rebuilding your resource.
