#!/usr/bin/env bash
# Script to build and run UN1CA in Docker

# Exit on error
set -e

# Build the Docker image
echo "Building Docker image 'unica-builder'..."
docker build -t unica-builder .

# Run the Docker container interactively
# We mount the current directory to /UN1CA inside the container
echo "Starting Docker container..."
docker run -it --rm \
    -v "$(pwd):/UN1CA" \
    --name unica-build-env \
    unica-builder
