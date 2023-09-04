# Direct Connect Protocol

This protocol can be used to connect to an alt:V server over the browser.

Protocol format:

`altv://connect/ADDRESS?password=PASSWORD` or `altv://connect/ADDRESS`

- ADDRESS is [urlencoded](https://www.urlencoder.org/) connection address, exactly like used in "Direct connect" window
- PASSWORD (optional) is [urlencoded](https://www.urlencoder.org/) password

Example: 

- `my.cdn.server:80` -> `altv://connect/my.cdn.server%3A80`
- `http://my.cdn.server` -> `altv://connect/http%3A%2F%2Fmy.cdn.server`
- `[::1]:1234` with password `test` -> `altv://connect/%5B%3A%3A1%5D%3A1234?password=test`
