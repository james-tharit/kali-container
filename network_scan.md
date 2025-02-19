# Network Scan

## Useful Nmap Commands
Nmap is a powerful tool for network discovery and security auditing. [Official Nmap Document](https://nmap.org/docs.html)

## Basic Scans

*   `nmap <target>`: Performs a basic scan of the target, identifying open ports and services.
*   `nmap -sS <target>`: Performs a SYN scan, a stealthy scan that doesn't complete the TCP handshake.
*   `nmap -sT <target>`: Performs a TCP connect scan, a more reliable scan that completes the TCP handshake.
*   `nmap -sU <target>`: Performs a UDP scan, useful for identifying UDP services.
*   `nmap -A <target>`: Performs an aggressive scan, including OS detection, version detection, and script scanning.

## Host Discovery

*   `nmap -sn <target>`: Performs a ping scan to identify live hosts on a network.
*   `nmap -PR <target>`: Performs an ARP scan to identify live hosts on a local network.

## Port Scanning

*   `nmap -p <port> <target>`: Scans a specific port.
*   `nmap -p <port range> <target>`: Scans a range of ports.
*   `nmap -p- <target>`: Scans all ports.
*   `nmap --top-ports <number> <target>`: Scans the most common ports.

## Version Detection

*   `nmap -sV <target>`: Performs version detection to identify the software and versions running on open ports.

## OS Detection

*   `nmap -O <target>`: Attempts to identify the operating system of the target.

## Script Scanning

*   `nmap --script <script name> <target>`: Runs a specific Nmap script.
*   `nmap --script <script category> <target>`: Runs all scripts in a specific category.

## Output Options

*   `nmap -oN <filename> <target>`: Saves the output to a normal file.
*   `nmap -oX <filename> <target>`: Saves the output to an XML file.
*   `nmap -oG <filename> <target>`: Saves the output to a grepable file.

## Examples

*   `nmap -sS -sV -O -p- 192.168.1.1`: Performs a stealth scan, version detection, OS detection, and scans all ports on the target IP address.
*   `nmap -sn 192.168.1.0/24`: Performs a ping scan to discover live hosts on the 192.168.1.0/24 network.
*   `nmap --script http-enum 192.168.1.10`: Runs the http-enum script to enumerate web server information on the target IP address.

## Additional Tips

*   Use the `-v` option for verbose output.
*   Use the `-T<number>` option to adjust the timing of the scan.
*   Use the `--help` option to see all available options.

**Remember to use Nmap responsibly and ethically. Only scan networks and systems that you have permission to scan.**