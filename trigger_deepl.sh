#!/bin/bash

# Load Variables
source variables.sh
source environment.sh

# provide access token from https://translate.nitrokey.com/accounts/profile/#api
token=$1


if [ $# -eq 0 ]
  then
	echo "Please provide your Weblate Access Token as first Parameter. Get it from https://translate.nitrokey.com/accounts/profile/#api"
	exit
fi



for lang in "${languages[@]}"

do
	echo -e "\n $(date) Starting deepl Translation for language $lang..."
	for component in "${components[@]}"
	do
		echo -e "$(date) Starting to translate $lang for component $component"
		curl \
		--data-binary '{
			"mode":"translate",
			"auto_source":"mt",
			"engines":["deepl"],
			"filter_type":"nottranslated",
			"threshold":"80"
		}' \
		-H "Content-Type: application/json" \
		-H "Authorization: Token $token" \
		"$weblate_api/translations/nitrokey-test/$component/$lang/autotranslate/"
		echo -e "\n$(date) done"
	done
	echo -e "\n$(date) Language $lang passed"
done
