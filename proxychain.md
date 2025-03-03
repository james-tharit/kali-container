# Use proxychain to increase Anonymity
ProxyChains is a Unix-like program that allows you to force any TCP connection made by any given application to go through a proxy, or a chain of proxies.

## Add new proxy server in `proxychains.conf`
```
...
[ProxyList]
# add proxy here ...
# meanwile

# defaults set to "tor"
socks5 	127.0.0.1 9050
socks5 98.178.72.21 10919
...
...
```

## Usage
wrap proxychain with network command
```sh
proxychains curl ifconfig.me/ip
```