### Context
* mini project: simple local example to get familiar with HTTP and basic auth
* referencing local.example from [this video] (https://www.youtube.com/watch?v=rhi1eIjSbvk&ab_channel=OktaDev)

### Rundown
* create a directory for running my Caddy server
* create Caddyfile
* host the server on localhost:2016 (this is an arbitrary number, I just chose something pretty high to avoid using a privileged port)
* run the Caddy server (caddy run —watch)
* edit Caddyfile to add basic auth (setting up basic auth)
* check with curl request
    * first you need to turn your username:pw string into base64-encoded string. in terminal: echo -n “<string>” | base64
    * curl localhost:2016 \ -H “Authorization: Basic <base64 string>”
    * this should return the response from the server (e.g. “Hello world! You’re authenticated.”)
* check in browser
    * refresh the page in browser
    * you should be prompted to enter the username and pw
    * then you should see the response from server printed on the page

