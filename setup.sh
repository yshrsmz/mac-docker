#!/bin/sh


# install boot2docker
mkdir ./bin
cd ./bin

# Get boot2docker
curl https://raw.github.com/steeve/boot2docker/master/boot2docker > boot2docker


# Mark it executable
chmod +x boot2docker

# install docker client
curl -o docker http://get.docker.io/builds/Darwin/x86_64/docker-latest

# Mark it executable
chmod +x docker

# Set the environment variable for the docker daemon
export DOCKER_HOST=tcp://

# copy the executable file
sudo cp docker /usr/local/bin/
