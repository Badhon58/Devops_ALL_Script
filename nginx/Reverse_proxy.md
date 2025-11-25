-> Reverse Proxy : A reverse proxy is a server that sits in front of web server and forwards 
client(e.g. web browser) requests to those web servers.
-> Reverse proxy are typically implements to help increase security, preformance, and 
reliability.
Benefits of Reverse Proxy -
Load Balancing -> A popular website that gets millions of users every day may not be able to 
handle all of its incoming site traffic with a single origin server. Instead, the site can be 
distributed among a pool of different servers, all handling requests for the same site
-> A reverse proxy can provide a load ballancing solution which will distribute the 
incomming trafic evenly among the different servers to prevent any single server from 
becoming overloaded.
-> Protection from attacks - With a reverse proxy in place, a web site or service never 
needs to reveal the IP address of their origin server (s). This makes it much harder for 
attackers to leaverage a trageted attack agains them such as DOS attack, CDN attack and more
tail -f /var/log/nginx/access.log
-> nginx -v

