#!/bin/bash

languages=("de" "fr" "es" "nl" "it" "ja" "ru" "el" "zh_CN")
admin_mail_address="ben@dotplex.com"

echo "$(date) [apply_translated_content.sh] Pulling Repo..." >> /var/www/sphinx/logs_sphinx/webhook.log

cd /var/www/sphinx/sphinx/nitrokey-documentation

# pull new content
git pull

if [ $? -eq 0 ]
then
	echo "$(date) [apply_translated_content.sh] Pulling Repo...DONE" >> /var/www/sphinx/logs_sphinx/webhook.log
else
	echo "$(date) [apply_translated_content.sh] Pulling Repo...FAILED" >> /var/www/sphinx/logs_sphinx/webhook.log
	echo "Building Docs.nitrokey.com – pulling repo FAILED." | mail -s "[Sphinx] Pulling Repo FAILED." $admin_mail_address

fi


# build all language versions
echo "$(date) [apply_translated_content.sh] Building language versions." >> /var/www/sphinx/logs_sphinx/webhook.log

for lang in "${languages[@]}"
do
	echo "$(date) [apply_translated_content.sh] (SPHINX) Building Language Version $lang..." >> /var/www/sphinx/logs_sphinx/webhook.log

	sphinx-build -a -D language='$lang' -b html /var/www/sphinx/sphinx/nitrokey-documentation/ /var/www/sphinx/www/docs.nitrokey.com_$lang-temp
	status=$?

	if [ $status -eq 0 ]
	then
		echo "$(date) [apply_translated_content.sh] (SPHINX) Building Language Version $lang...DONE" >> /var/www/sphinx/logs_sphinx/webhook.log
		rm -r  /var/www/sphinx/www/static/$lang
		mv /var/www/sphinx/www/docs.nitrokey.com_$lang-temp /var/www/sphinx/www/static/$lang
	else
		echo echo "FAILED" >> /var/www/sphinx/logs_sphinx/webhook.log
		echo "Building Docs.nitrokey.com Language $lang FAILED. The online version was as not altered." | mail -s "[Sphinx] Building Language $lang FAILED." $admin_mail_address
	fi
done


echo "$(date) [apply_translated_content.sh] Atempts to buil all languages DONE." >> /var/www/sphinx/logs_sphinx/webhook.log
