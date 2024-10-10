#!/bin/bash

# Define your list of languages
LANGUAGES=("de" "es" "fr" "ru" "nl" "it" "ja" "el" "bg" "da" "et" "fi" "lv" "lt" "pl" "pt" "ro" "sv" "sk" "sl" "cs" "hu" "zh_CN")

# Path to your .po files directory
PO_FILES_DIR="/Users/brueckner/www/nitrokey/documentation/docs-test-repo/locales"

# Loop through each language
for lang in "${LANGUAGES[@]}"; do
    # Find and remove all occurrences of '#, fuzzy' in .po files for each language, safely handling spaces
    find "$PO_FILES_DIR/$lang" -name "*.po" -print0 | xargs -0 sed -i '' '/^#, fuzzy$/d'
    echo "Processed language: $lang"
done

echo "All fuzzy markers removed."
