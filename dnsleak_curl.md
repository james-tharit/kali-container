## Always use --socks5-hostname when using curl with a SOCKS5 proxy for anonymity.
```sh
curl --socks5 localhost:9050 --socks5-hostname localhost:9050 https://check.torproject.org/api/ip
```

# Understanding the Problem: DNS Leaks

**Standard DNS Resolution**: When you type a website address (e.g., example.com) into your browser or command-line tool, your computer needs to translate that human-readable name into an IP address (e.g., 93.184.216.34). This translation is done by a DNS (Domain Name System) server.
**The Leak**: Without `--socks5-hostname`, when you use a SOCKS5 proxy, curl (or other applications) might resolve the domain name before sending the request through the proxy. This means your DNS request goes directly to your configured DNS server, revealing the website you're trying to visit to your ISP or whoever controls that DNS server, even though your subsequent traffic goes through Tor.

# How --socks5-hostname Prevents Leaks

**Proxy-Side Resolution**: The `--socks5-hostname` option tells curl to send the domain name to the SOCKS5 proxy (Tor in this case) and have the proxy perform the DNS resolution.
**Tor's Role**: When using Tor, the Tor network will then perform the DNS lookup, ensuring that the DNS request is also routed through the Tor network. This hides your DNS requests from your local network and ISP.
**End-to-End Anonymity**: By ensuring both the DNS resolution and the subsequent network traffic go through Tor, you achieve a higher level of anonymity.

# Practical Example

## Without --socks5-hostname (vulnerable to DNS leaks):
**note that in socks5 service on local is Tor**
```sh
curl --socks5 localhost:9050 https://check.torproject.org/api/ip
With --socks5-hostname (DNS leaks prevented):
```



