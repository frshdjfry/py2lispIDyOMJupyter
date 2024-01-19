#!/bin/bash

# Name of the Docker image
IMAGE_NAME="jupyter-py2lispidyom"

# Path to the Dockerfile (assuming it's in the same directory as this script)
DOCKERFILE_PATH="$(dirname "$0")/Dockerfile"

# Automatically use the current directory as the host directory to mount
HOST_DIR=$(pwd)
# Clone the py2lispIDyOM repository if it's not already cloned
if [ ! -d "$HOST_DIR/py2lispIDyOM/.git" ]; then
    echo "Cloning py2lispIDyOM repository into the current directory..."
    git clone git@github.com:xinyiguan/py2lispIDyOM.git
fi
# Echo paths for user confirmation
echo "Dockerfile Path: $DOCKERFILE_PATH"
echo "Host Directory: $HOST_DIR"

# Build the Docker image
echo "Building Docker image..."
docker build -t $IMAGE_NAME -f $DOCKERFILE_PATH .

# Check if the build was successful
if [ $? -ne 0 ]; then
    echo "Docker build failed. Exiting."
    exit 1
fi

# Run the Docker container with the volume mount
echo "Starting JupyterLab..."
docker run -p 8888:8888 -v $HOST_DIR:/work $IMAGE_NAME
