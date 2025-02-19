# build docker image from Dockerfile with tag called "kaliz"

podman build -t kaliz .

# random hostname for our kali instance
hostname=$(cat words.txt | sort -R | head -1)
# start new kaliz container in interactive mode with shell
podman run --rm -it --network="host" -u root --cap-add=ALL --hostname=$hostname --name=$hostname kaliz  
