# Troubleshoot Server

Sometimes, when you deal with running a server, some issues can occur. Most of these issues are repetitive and easy 
to solve. Therefore, this article collects the most common errors and their solutions.

## Known issues & solutions

### Warning: To load an ES module, set "type": "module" in the package.json or use the .mjs extension.

This issue is caused by missing the type configuration inside your package.json. To solve this problem you need to 
add `"type":"module"` in your package.json

### Failed to load "js-module.dll" Win32 error: 127 (7f) 

If you head into your alt:V server directory, you will most likely find a `libnode.dll` file. In order to solve this 
issue you need to delete this file.

### Module outdated, module uses SDK vXX, server requires SDK vXX

If you use C# on your server side, you will sometimes get this error especially if there is a new release. Usually, 
it is enough to update your server by downloading the latest alt:V server files which includes the latest 
`csharp-module.dll` or `js-module.dll`.

### Error while reading server.cfg on line xx, column. Reason: invalid token

This issue mostly occurs when strings are not set into `" "`. For example, this error occurs when your website 
inside the `server.cfg` is not set inside double quotes. To find the issue inside your `server.cfg` you should pay 
attention onto the error message which gives you the exact line.

### Master server connect failed. Invalid token

The variable `announce` which is set to `true` without a **valid** token inside your `server.cfg` is causing this 
issue. Therefore, you need to request a master list token from the alt:V Master-Bot. To receive a token, you need to 
send single message with the content `token` to `Master-Bot#3667` on discord. Please make sure, that you are a 
member of the alt:V Discord for at least 24 hours.
Keep in mind that you usually do not need a master list announcement while you are in development stage. You can set 
the `announce` flag to `false` inside your `server.cfg`
