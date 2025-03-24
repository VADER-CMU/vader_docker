xhost +local:root
docker run --privileged --rm -it \
    --name="vader_docker" \
    --env="DISPLAY=$DISPLAY" --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --volume="$XAUTH:$XAUTH" \
    --network host \
    -v "$(pwd)/docker_ws:/home/docker_ws" \
    -v "/etc/localtime:/etc/localtime:ro" \
    -v "/dev:/dev" -v "/etc/timezone:/etc/timezone:ro" \
    --gpus all \
    -w /home/docker_ws \
    vader_img bash