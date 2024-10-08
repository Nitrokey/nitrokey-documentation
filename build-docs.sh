#!/bin/bash
export TZ="Europe/Berlin"

# Get the directory where the script is located
SCRIPT_DIR=$(dirname "$(realpath "$0")")
SCRIPT_NAME=$(basename "$0")
QUEUE_FILE="$SCRIPT_DIR/build_queue.json"
WEBHOOK_URL="https://docstest-hooks.nitrokey.com/github-push-action.php"

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

# trigger weblate push to ensure having the most up-to-date files
bash trigger_weblatepush.sh $WEBLATE_API_KEY

# get updated translation files
git pull

# bash ./build-container-image.sh

# Default options
build_all=true
build_update=true
specific_language=""
full_build=false
rebuild=false

# Parse input arguments
for arg in "$@"
do
    case $arg in
        --full)
        full_build=true
        shift
        ;;
        --rebuild)
        rebuild=true
        shift
        ;;
        *)
        specific_language=$arg
        build_all=false
        ;;
    esac
done

# Clean the build directory
clean_build() {
    current_time=$(date +"%Y-%m-%d %H:%M:%S")
    log_message="$current_time [$SCRIPT_NAME] Cleaning build directory..."
    echo -e "$log_message" >> "$LOGFILE_PATH/webhook.log"
    rm -rf build dist
    mkdir -p build
    mkdir -p dist
}

# Build documentation for a specific language
build_docs() {
    local lang=$1
    current_time=$(date +"%Y-%m-%d %H:%M:%S")
    log_message="$current_time [$SCRIPT_NAME] Building documentation for language: $lang"
    echo -e "$log_message" >> "$LOGFILE_PATH/webhook.log"

    # Create output and build directories if they don't exist
    mkdir -p dist/$lang
    mkdir -p build/$lang/doctrees

    # Determine sphinx-build options
    sphinx_options="-j auto -b html -D language=$lang -d /docs/build/$lang/doctrees . /docs/dist/$lang"

    # Run the Sphinx build command with the determined options
    docker compose run --rm sphinx sphinx-build $sphinx_options
}

# Clean build directory if --rebuild is specified
if $rebuild; then
    clean_build
fi

# Execute build based on the parsed options
if $build_all; then
    current_time=$(date +"%Y-%m-%d %H:%M:%S")
    log_message="$current_time [$SCRIPT_NAME] Building documentation for priority languages"
    echo -e "$log_message" >> "$LOGFILE_PATH/webhook.log"
    for lang in "${PRIORITY_LANGUAGES[@]}"; do
        build_docs $lang
    done
else
    if [[ " ${PRIORITY_LANGUAGES[@]} " =~ " $specific_language " ]]; then
        build_docs $specific_language
    else
        current_time=$(date +"%Y-%m-%d %H:%M:%S")
        log_message="$current_time [$SCRIPT_NAME] Error: Language '$specific_language' is not in the list of available languages."
        echo -e "$log_message" >> "$LOGFILE_PATH/webhook.log"
        exit 1
    fi
fi

current_time=$(date +"%Y-%m-%d %H:%M:%S")
log_message="$current_time [$SCRIPT_NAME] Build process complete."
echo -e "$log_message" >> "$LOGFILE_PATH/webhook.log"

log_message="$current_time [$SCRIPT_NAME] Checking queued jobs..."
echo -e "$log_message" >> "$LOGFILE_PATH/webhook.log"

# Check if the queue has any builds waiting
if [ -f "$QUEUE_FILE" ]; then

    log_message="$current_time [$SCRIPT_NAME] Queued jobs found. Processing."
    echo -e "$log_message" >> "$LOGFILE_PATH/webhook.log"

    QUEUE=$(jq length "$QUEUE_FILE")  # Check if queue has entries
    if [ "$QUEUE" -gt 0 ]; then
        # Process the next payload in the queue
        NEXT_PAYLOAD=$(jq -r '.[0].payload' "$QUEUE_FILE")
        
        # Remove the processed payload from the queue
        jq '.[1:]' "$QUEUE_FILE" > "$QUEUE_FILE.tmp" && mv "$QUEUE_FILE.tmp" "$QUEUE_FILE"

        # Re-trigger the build using the next payload
        current_time=$(date +"%Y-%m-%d %H:%M:%S")
        log_message="$current_time [$SCRIPT_NAME] Re-triggering build with queued payload..."
        echo -e "$log_message" >> "$LOGFILE_PATH/webhook.log"

        # Send the payload to the PHP script using a POST request
        curl -X POST -H "Content-Type: application/json" -d "$NEXT_PAYLOAD" "$WEBHOOK_URL"

        # Optionally pass the payload to PHP or use it in the bash script
        # bash "$SCRIPT_DIR/build-docs.sh"

        current_time=$(date +"%Y-%m-%d %H:%M:%S")
        if [ $? -eq 0 ]; then
            log_message="$current_time [$SCRIPT_NAME] Payload successfully sent to webhook script."
        else
            log_message="$current_time [$SCRIPT_NAME] Failed to send payload to webhook script."
        fi
        echo -e "$log_message" >> "$LOGFILE_PATH/webhook.log"
    fi
fi
