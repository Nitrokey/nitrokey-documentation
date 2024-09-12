#!/bin/bash

# Builds the container image based on the Dockerfile
# The resulting image is called: docker.io/nitrokey/sphinx
docker build -t nitrokey/sphinx .
