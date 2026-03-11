# build podman image from Dockerfile with tag called "kaliz"
podman build -t kali .

# start kali container
podman run --rm -it kali
