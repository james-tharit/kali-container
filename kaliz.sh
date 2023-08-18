# build docker image from Dockerfile with tag called "kaliz"

docker build -t kaliz .

hostname=$(cat words.txt | shuf | head -1)
# start new kaliz container in interactive mode with shell
docker run --rm -it --network="host" --hostname=$hostname --name=$hostname kaliz  
