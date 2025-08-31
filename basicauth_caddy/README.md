### Context
* mini project: simple local example to get familiar with HTTP and basic auth
* referencing local.example from [this video](https://www.youtube.com/watch?v=rhi1eIjSbvk&ab_channel=OktaDev)

### Final Rundown of how I did it
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

### Notes

* a plain HTML file can’t do basic auth by itself. you need something on the server side to send the 401 + WWW-Authenticate, then serve your HTML file after credentials are checked.
    * this something — is just a porgram that listens on a port (e.g. 8080), that knows how to: 1. accept client requests, 2. decide what to do with that request, 3. send back an HTTP response
    * e.g. a web server program (Nginx), a simple app server (Node.js with Express)
        * web server program VS app server
            * web server program: 
                * general-purpose, prebuilt
                * specialized piece of software built mainly for serving static files and handling common web tasks
                * doesn’t know about your app’s business logic, just knows how to deliver files
                * uses: quick demos, static websites
            * app server:  
                * you decide everything — routes, logic, what headers to send, how to authenticate
* my action: using Caddy (Nginx is also poss but I think Caddy is faster / more lightweight)
    *  getting started docs
        * config with JSON file:
            * understanding the curl:
                * you POST your JSON config file (caddy.json) to caddy’s admin api (at localhost:2019/load). this tells caddy: replace your active config with this JSON.
            * understanding the ports:
                * port 2019 is caddy’s admin API port. you talk to this to configure Caddy (e.g. GET /config, POST /load)
                * port 2015 is the example site’s HTTP port, that you chose in the JSON config file. so when you visit localhost:2015, you’re hitting the site you defined in the config, not the admin API.
        * config with Caddyfile instead:
            * 1. create Caddyfile in directory
            * 2. run ‘caddy adapt’ — this uses a config adapter to convert the Caddyfile to Caddy's native JSON structure

