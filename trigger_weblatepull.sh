#!/bin/bash

# Load Variables
source config.sh

# provide access token from https://translate.nitrokey.com/accounts/profile/#api
token=$1


if [ $# -eq 0 ]
  then
	echo "Please provide your Weblate Access Token as first Parameter. Get it from https://translate.nitrokey.com/accounts/profile/#api"
	exit
fi



	echo -e "\n $(date) Starting weblate repository pull..."
		curl \
		--data-binary '{
			"operation":"pull"
		}' \
		-H "Content-Type: application/json" \
		-H "Authorization: Token $token" \
		https://translate.nitrokey.com/api/projects/nitrokey-documentation/repository/
		echo -e "\n$(date) done"

	
