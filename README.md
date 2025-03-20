# VADER Docker

This includes a dockerfile that builds the image for VADER's PC. More specifically, it:

* Shares the docker_ws folder to `/home/docker_ws` inside the docker container,
* Shares the host GPUs and devices,
* And sets up displays so that windows are launched in the host's display.

# Usage

## Initial build

Make sure you have docker and the docker service is enabled.

Go into vader_docker and run build_docker.sh. Wait for the build to complete.

## Launching the container

If you get the error where GPUs are not found during `run_docker.sh`, try running `docker context use default`.

Run `run_docker.sh` which should create a container and give you a terminal. The displays are set up so that the docker container can launch windows in the host's displays.

For additional terminals, run `terminal_docker.sh` in new terminals. These should attach to the same container.

## Verify

Get two docker terminals, run `roscore` in one of them and run `rviz` in the other. The RViz window should pop up.

Make sure you can call `nvidia-smi` (if you have a nvidia driver on the host machine) and can use the GPU.

Verify that whatever in the `docker_ws` folder is mirrored successfully to the container.

