# Direct Connect Protocol

This protocol can be used, to connect to an alt:V server over the browser.

## CDN off
If your server doesn't use the cdn function, you need to use the IP-Address and the port of the server.

`altv://connect/${IP_ADDRESS}:${PORT}?password=${PASSWORD}` or a example `altv://connect/127.0.0.1:7788?password=xyz`

## CDN on

If you are using the cdn function, you need to use the direct connect url to the cdn.

`altv://connect/http://{CDN_URL}?password=${PASSWORD}` or a example `altv://connect/http://connect.example.com?password=xyz`