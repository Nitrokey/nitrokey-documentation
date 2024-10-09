#!/bin/bash
export TZ="Europe/Berlin"

# Get the directory where the script is located
SCRIPT_DIR=$(dirname "$(realpath "$0")")
SCRIPT_NAME=$(basename "$0")
LOCK_FILE="$SCRIPT_DIR/build.lock"
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

# Default options
build_all=false
specific_language=""
rebuild=false

# Parse input arguments
for arg in "$@"; do
    case $arg in
    --rebuild)
        rebuild=true
        shift
        ;;
    --all-languages)
        build_all=true
        shift
        ;;
    *)
        specific_language=$arg
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
current_time=$(date +"%Y-%m-%d %H:%M:%S")

if $build_all; then
    log_message="$current_time [$SCRIPT_NAME] Building documentation for all languages"
    echo -e "$log_message" >> "$LOGFILE_PATH/webhook.log"
    for lang in "${PRIORITY_LANGUAGES[@]}"; do
        build_docs $lang
    done
    for lang in "${OTHER_LANGUAGES[@]}"; do
        build_docs $lang
    done
else

    if $specific_language; then

        if [[ " ${PRIORITY_LANGUAGES[@]} " =~ " $specific_language " || " ${OTHER_LANGUAGES[@]} " =~ " $specific_language " ]]; then
            log_message="$current_time [$SCRIPT_NAME] Building documentation for language: $specific_language"
            echo -e "$log_message" >> "$LOGFILE_PATH/webhook.log"
            build_docs $specific_language
        else
            log_message="$current_time [$SCRIPT_NAME] Error: Language '$specific_language' is not in the list of available languages."
            echo -e "$log_message" >> "$LOGFILE_PATH/webhook.log"
            exit 1
        fi

    else

        current_time=$(date +"%Y-%m-%d %H:%M:%S")
        log_message="$current_time [$SCRIPT_NAME] Building documentation for priority languages"
        echo -e "$log_message" >> "$LOGFILE_PATH/webhook.log"

        for lang in "${PRIORITY_LANGUAGES[@]}"; do
            build_docs $lang
        done
    
    fi
fi

current_time=$(date +"%Y-%m-%d %H:%M:%S")

log_message="$current_time [$SCRIPT_NAME] Removing lock file."
echo -e "$log_message" >> "$LOGFILE_PATH/webhook.log"
rm $LOCK_FILE

log_message="$current_time [$SCRIPT_NAME] Build process complete."
echo -e "$log_message" >> "$LOGFILE_PATH/webhook.log"
