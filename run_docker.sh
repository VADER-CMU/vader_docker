#!/bin/bash

# Allow the container to connect to the host's X server for GUI applications
xhost +local:root

ARCH=$(uname -m)

if [[ "$ARCH" == "x86_64" ]]; then
  echo "Detected x86_64 architecture. Running vader_img for x86..."
  docker run --privileged --rm -it \
    --name="vader_docker" \
    --network host \
    -e DISPLAY=$DISPLAY \
    -e QT_X11_NO_MITSHM=1 \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    -v "$(pwd)/docker_ws:/home/docker_ws" \
    -v /etc/localtime:/etc/localtime:ro \
    -v /dev:/dev \
    -w /home/docker_ws \
    --gpus all \
    vader_img bash

elif [[ "$ARCH" == "aarch64" ]]; then
  echo "Detected aarch64 (ARM64) architecture. Running vader_img for Orin..."
  docker run --privileged --rm -it \
    --name="vader_docker" \
    --runtime nvidia \
    --network host \
    -e DISPLAY=$DISPLAY \
    -e QT_X11_NO_MITSHM=1 \
    -v $HOME/.Xauthority:/root/.Xauthority:rw \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    -v "$(pwd)/docker_ws:/home/docker_ws" \
    -v /etc/localtime:/etc/localtime:ro \
    -v /dev:/dev \
    -w /home/docker_ws \
    vader_img bash

else
  echo "Error: Unsupported architecture '$ARCH'."
  exit 1
fi
