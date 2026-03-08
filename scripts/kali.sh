# build docker image from Dockerfile with tag called "kaliz"
docker build -t kali ../

# start workstation with host network
docker run --rm -it --network="host" kali
