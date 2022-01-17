languages=("de" "fr" "es" "nl" "it" "ja" "ru" "el" "bg" "da" "et" "fi" "lv" "lt" "pl" "pt" "ro" "sv" "sk" "sl" "cs" "hu")
components=("documentation-fido2" "documentation-hsm" "documentation-nethsm" "documentation-netbox" "documentation-nitrokey3" "documentation-nitropad" "documentation-nitropc" "documentation-nitrophone" "documentation-pro" "documentation-shared-faq" "documentation-sphinx" "documentation-start" "documentation-storage" "documentation-syntax" "documentation-t430" "documentation-u2f" "documentation-x230" "glossary" "index")


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
		https://translate.nitrokey.com/api/translations/nitrokey-documentation/$component/$lang/autotranslate/
		echo -e "\n$(date) done"
	done
	echo -e "\n$(date) Language $lang passed"
done


