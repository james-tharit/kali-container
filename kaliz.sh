# build docker image from Dockerfile with tag called "kaliz"

docker build -t kaliz .

# random hostname for our kali instance
hostname=$(cat words.txt | sort -R | head -1)
# start new kaliz container in interactive mode with shell
docker run --rm -it --network="host" --hostname=$hostname --name=$hostname kaliz  
