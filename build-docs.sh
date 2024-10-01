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
