# Start Tor Proxy Container
docker run -d --name tor-proxy --restart unless-stopped dperson/torproxy

# build docker image from Dockerfile with tag called "kaliz"
docker build -t kali ../

# (default) start workstation with via Tor proxy
docker run --rm -it --network container:tor-proxy kali