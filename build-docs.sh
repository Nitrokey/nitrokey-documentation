#!/bin/bash

# Load environment variables from config.env
if [ -f ./.env ]; then
  source ./.env
else
  echo "Environment file not found!"
  exit 1
fi

# trigger weblate push to ensure having the most up-to-date files
bash trigger_weblatepush.sh $WEBLATE_API_KEY

# get updated translation files
git pull

bash ./build-container-image.sh

# Default options
build_all=true
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
    echo "Cleaning build directory..."
    rm -rf build dist
    mkdir -p build
    mkdir -p dist
}

# Build documentation for a specific language
build_docs() {
    local lang=$1
    echo "Building documentation for language: $lang"

    # Create output and build directories if they don't exist
    mkdir -p dist/$lang
    mkdir -p build/$lang/doctrees

    # Determine sphinx-build options
    sphinx_options="-j auto -b html -D language="$lang" -d /docs/build/$lang/doctrees . /docs/dist/$lang"
    if $full_build; then
        sphinx_options="-a $sphinx_options"
    fi

    # Run the Sphinx build command with the determined options
    docker run --rm \
        -v $(pwd)/dist/$lang:/docs/dist/$lang \
        -v $(pwd)/build/$lang/doctrees:/docs/build/$lang/doctrees \
        docker.io/nitrokey/sphinx \
        sphinx-build $sphinx_options
}

# Clean build directory if --rebuild is specified
if $rebuild; then
    clean_build
fi

# Execute build based on the parsed options
if $build_all; then
    echo "Building documentation for all languages..."
    for lang in "${LANGUAGES[@]}"; do
        build_docs $lang
    done
else
    if [[ " ${LANGUAGES[@]} " =~ " $specific_language " ]]; then
        build_docs $specific_language
    else
        echo "Error: Language '$specific_language' is not in the list of available languages."
        exit 1
    fi
fi

echo "Build process completed."
