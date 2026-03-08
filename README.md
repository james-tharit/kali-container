# kali-container
Kali-rolling container with pre-install useful tools

- start container with `./scripts/kali.sh` or `./scripts/kali.sh` on privacy mode
> Connect anonymously using Tor or Proxychain
 Avoid [DNS Leakage Problem](./dnsleak_curl.md) by using Curl with Sock5 and overrider hostname always!
 `curl --socks5 localhost:9050 --socks5-hostname localhost:9050`

 # Manual
- [How to use Proxychain](./manual/proxychain.md)
- [How to use tor](./manual/tor.md)
- [How to use netcat](./manual/netcat-openbsd.md)
- [How to use nmap](./manual/network_scan.md)