#!/bin/bash

# Load Variables
source variables.sh
source environment.sh

# provide access token from https://translate.nitrokey.com/accounts/profile/#api
token=$1


if [ $# -eq 0 ]
  then
	echo "Please provide your Weblate Access Token as first Parameter. Get it from $weblate_url/accounts/profile/#api"
	exit
fi



	echo -e "\n $(date) Starting weblate repository push..."
		curl \
		--data-binary '{
			"operation":"push"
		}' \
		-H "Content-Type: application/json" \
		-H "Authorization: Token $token" \
		"$weblate_api/projects/nitrokey-documentation/repository/"
		echo -e "\n$(date) done"

	
