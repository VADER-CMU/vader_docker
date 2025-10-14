#!/bin/bash

# Navigate to the parent directory where the 'vader_docker' directory is located
cd ../

# Detect the machine's hardware architecture
ARCH=$(uname -m)

# Check the architecture and choose the correct Dockerfile to build the image
if [[ "$ARCH" == "x86_64" ]]; then
  echo "Detected x86_64 architecture. Building with Dockerfile.x86..."
  docker build -f ./vader_docker/Dockerfile.x86 ./vader_docker/ -t vader_img

elif [[ "$ARCH" == "aarch64" ]] || [[ "$ARCH" == "arm64" ]]; then
  echo "Detected aarch64 (ARM64) architecture. Building with Dockerfile.orin..."
  docker build -f ./vader_docker/Dockerfile.orin ./vader_docker/ -t vader_img

else
  echo "Error: Unsupported architecture '$ARCH'. No compatible Dockerfile found."
  exit 1
fi

echo "Docker build process finished."