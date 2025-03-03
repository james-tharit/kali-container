# Tor and torsocks

Tor protects your privacy on the internet by hiding the connection between your Internet address and the services you use.

## Installation

Install Tor and torsocks using the following command:

```sh
sudo apt update
sudo apt install tor
```

## Running Tor
When installed via apt, Tor is typically configured to run as a system service. On older systems, or systems without systemd, you can manage it using the service command:

Start Tor:
```sh
service tor start
```


Stop Tor:
```sh
service tor stop
```


Restart Tor:
```sh
service tor restart
```

Check Tor status:
```sh
sudo service tor status
```

Check for the Tor process:
```sh
ps aux | grep tor
```

## Using torsocks
Once Tor is running, you can use torsocks to route your command-line traffic through the Tor network. Simply prefix your command with torsocks:

```sh
torsocks curl https://check.torproject.org/api/ip
torsocks wget <...>
torsocks ssh <...>
```
## torsocks Configuration
The default configuration for torsocks is usually sufficient. It uses the default Tor SOCKS5 proxy at 127.0.0.1:9050.

## Configuration file: /etc/tor/torsocks.conf
You can modify this file to customize torsocks settings.
Key configuration options:

**Socks5Proxy**: Specifies the SOCKS5 proxy address and port.
**isolate_destination**: Forces each connection to use a new Tor circuit.
Example /etc/tor/torsocks.conf snippet:
```
Socks5Proxy 127.0.0.1:9050
isolate_destination 1
```
Verifying Traffic Through Tor

Use curl to check your IP through Tor:
```sh
torsocks curl  https://check.torproject.org/api/ip
```

If the returned IP is different from your public IP, torsocks is working.

## Important Notes
ICMP Limitations: torsocks does not work with ICMP. ping will fail.
Application Compatibility: Some applications may not work correctly with torsocks.







