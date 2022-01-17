languages=("de" "fr" "es" "nl" "it" "ja" "ru" "el" "bg" "da" "et" "fi" "lv" "lt" "pl" "pt" "ro" "sv" "sk" "sl" "cs" "hu")
components=("documentation-fido2" "documentation-hsm" "documentation-nethsm" "documentation-netbox" "documentation-nitrokey3" "documentation-nitropad" "documentation-nitropc" "documentation-nitrophone" "documentation-pro" "documentation-shared-faq" "documentation-sphinx" "documentation-start" "documentation-storage" "documentation-string" "documentation-syntax" "documentation-t430" "documentation-u2f" "documentation-x230" "glossary" "index")


# provide access token from https://translate.nitrokey.com/accounts/profile/#api
token=$1

for lang in "${languages[@]}"
do	
	for component in "${components[@]}"
	do
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
	done
done


