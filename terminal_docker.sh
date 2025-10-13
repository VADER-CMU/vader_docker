#!/bin/bash

xhost +local:docker
docker exec -it -w /home/docker_ws vader_docker bash 
