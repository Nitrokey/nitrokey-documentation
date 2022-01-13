languages=("de" "fr" "es" "nl" "it" "ja" "ru" "el" "bg" "da" "et" "fi" "lv" "lt" "pl" "pt" "ro" "sv" "sk" "sl" "cs" "hu")

for lang in "${languages[@]}"
do
	https://translate.nitrokey.com/api/translations/nitrokey-documentation/documentation-fido2/$lang/autotranslate
	https://translate.nitrokey.com/api/translations/nitrokey-documentation/documentation-hsm/$lang/autotranslate
	https://translate.nitrokey.com/api/translations/nitrokey-documentation/documentation-nethsm/$lang/autotranslate
	https://translate.nitrokey.com/api/translations/nitrokey-documentation/documentation-nextbox/$lang/autotranslate
	https://translate.nitrokey.com/api/translations/nitrokey-documentation/documentation-nitrokey3/$lang/autotranslate
	https://translate.nitrokey.com/api/translations/nitrokey-documentation/documentation-nitropad/$lang/autotranslate
	https://translate.nitrokey.com/api/translations/nitrokey-documentation/documentation-nitropc/$lang/autotranslate
	https://translate.nitrokey.com/api/translations/nitrokey-documentation/documentation-nitrophone/$lang/autotranslate
	https://translate.nitrokey.com/api/translations/nitrokey-documentation/documentation-pro/$lang/autotranslate
	https://translate.nitrokey.com/api/translations/nitrokey-documentation/documentation-shared-faqs/$lang/autotranslate
	https://translate.nitrokey.com/api/translations/nitrokey-documentation/documentation-sphinx/$lang/autotranslate
	https://translate.nitrokey.com/api/translations/nitrokey-documentation/documentation-start/$lang/autotranslate
	https://translate.nitrokey.com/api/translations/nitrokey-documentation/documentation-storage/$lang/autotranslate
	https://translate.nitrokey.com/api/translations/nitrokey-documentation/documentation-string/$lang/autotranslate
	https://translate.nitrokey.com/api/translations/nitrokey-documentation/documentation-syntax/$lang/autotranslate
	https://translate.nitrokey.com/api/translations/nitrokey-documentation/documentation-t430/$lang/autotranslate
	https://translate.nitrokey.com/api/translations/nitrokey-documentation/documentation-to-be-integrated/$lang/autotranslate
	https://translate.nitrokey.com/api/translations/nitrokey-documentation/documentation-u2f/$lang/autotranslate
	https://translate.nitrokey.com/api/translations/nitrokey-documentation/documentation-x230/$lang/autotranslate
	https://translate.nitrokey.com/api/translations/nitrokey-documentation/glossary/$lang/autotranslate
	https://translate.nitrokey.com/api/translations/nitrokey-documentation/index/$lang/autotranslate
done



# curl -H "Authorization: Token QsCSCNtGoe0OIoR6HtMcdo66cLIGXAtxZJljiWzw" https://translate.nitrokey.com/api/translations/nitrokey-documentation/documentation-fido2/et/autotranslate
# wlc --key QsCSCNtGoe0OIoR6HtMcdo66cLIGXAtxZJljiWzw --url https://translate.nitrokey.com/api/ list-projects
