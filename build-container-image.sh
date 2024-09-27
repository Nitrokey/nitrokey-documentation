#!/bin/bash
export TZ="Europe/Berlin"

# Get the directory where the script is located
SCRIPT_DIR=$(dirname "$(realpath "$0")")
SCRIPT_NAME=$(basename "$0")

# Change to the script's directory
cd "$SCRIPT_DIR" || exit 1

# Load the environment variables
if [ -f "$SCRIPT_DIR/.env" ]; then
    source "$SCRIPT_DIR/.env"
else
    current_time=$(date +"%Y-%m-%d %H:%M:%S")
    log_message="$current_time [$SCRIPT_NAME] Environment file not found!"
    echo -e "$log_message" >> "$LOGFILE_PATH/webhook.log"
    exit 1
fi

log_message="$current_time [$SCRIPT_NAME] Building Sphinx docker container image"
echo -e "$log_message" >> "$LOGFILE_PATH/webhook.log"

# Builds the container image based on the Dockerfile
# The resulting image is called: docker.io/nitrokey/sphinx
docker build -t nitrokey/sphinx .
log_message="$current_time [$SCRIPT_NAME] Done"
