#!/bin/bash

# Load environment variables from config.env
if [ -f ./.env ]; then
  source ./.env
else
  echo "Environment file not found!"
  exit 1
fi

# provide access token from https://translate.nitrokey.com/accounts/profile/#api
token=$1


if [ $# -eq 0 ]
  then
	echo "Please provide your Weblate Access Token as first Parameter. Get it from $WEBLATE_URL/accounts/profile/#api"
	exit
fi



	echo -e "\n $(date) Starting weblate repository push..."
		curl \
		--data-binary '{
			"operation":"push"
		}' \
		-H "Content-Type: application/json" \
		-H "Authorization: Token $token" \
		"$WEBLATE_API/projects/$WEBLATE_PROJECT/repository/"
		echo -e "\n$(date) done"

	
