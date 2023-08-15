# build docker image from Dockerfile with tag called "kaliz"

docker build -t kaliz .

# start new kaliz container in interactive mode with shell
docker run --rm -it --network="host" kaliz  
