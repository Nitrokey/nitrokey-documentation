#!/bin/bash

# deactivate
#echo "$(date) [apply_translated_content.sh] DEACTIVATED.." >> /var/www/sphinx/logs_sphinx/webhook.log & exit

# Load Variables and Language Codes
source config.sh


echo "$(date) [apply_translated_content.sh] ($BASHPID) Pulling Repo..." >> /var/www/sphinx/logs_sphinx/webhook.log

cd /var/www/sphinx/sphinx/nitrokey-documentation

# pull new content
git pull

if [ $? -eq 0 ]
then
	echo "$(date) [apply_translated_content.sh] ($BASHPID) Pulling Repo...DONE" >> /var/www/sphinx/logs_sphinx/webhook.log
else
	echo "$(date) [apply_translated_content.sh] ($BASHPID) Pulling Repo...FAILED" >> /var/www/sphinx/logs_sphinx/webhook.log
	echo "Building Docs.nitrokey.com – pulling repo FAILED." | mail -s "[Sphinx] ($BASHPID) Pulling Repo FAILED." $admin_mail_address

fi


# build all language versions
echo "$(date) [apply_translated_content.sh] ($BASHPID) Building language versions." >> /var/www/sphinx/logs_sphinx/webhook.log

for lang in "${languages[@]}"
do
	if [ -d "/var/www/sphinx/www/docs.nitrokey.com_$lang-temp" ]; then
		echo "$(date) [apply_translated_content.sh] ($BASHPID) (SPHINX) Building Language Version $lang SKIPPED. (Directory not empty. Another build process may be running)"
		echo "Building was skipped, as the temporary directory /var/www/sphinx/www/docs.nitrokey.com_$lang-temp already existed. Something may have gone wrong earlier or another build process was running at the same time. The directory should be deleted before the next build." | mail -s "[Sphinx] ($BASHPID) Warning - Building Language $lang." $admin_mail_address

	else
		echo "$(date) [apply_translated_content.sh] ($BASHPID) (SPHINX) Building Language Version $lang..." >> /var/www/sphinx/logs_sphinx/webhook.log
		
		if [ build_mode == "full" ]
		then
			sphinx-build -a -D language="$lang" -b html /var/www/sphinx/sphinx/nitrokey-documentation/ /var/www/sphinx/www/docs.nitrokey.com_$lang-temp
			status=$?
		elif [ build_mode == "incremental" ]
		then
			sphinx-build -D language="$lang" -b html /var/www/sphinx/sphinx/nitrokey-documentation/ /var/www/sphinx/www/docs.nitrokey.com_$lang-temp
			status=$?
		else
			echo "Building Docs.nitrokey.com Language $lang FAILED. Sphinx build mode in config.sh unkown." | mail -s "[Sphinx] ($BASHPID) Building Language $lang FAILED." $admin_mail_address

		fi
			
	
		if [ $status -eq 0 ]
		then
			echo "$(date) [apply_translated_content.sh] ($BASHPID) (SPHINX) Building Language Version $lang...DONE" >> /var/www/sphinx/logs_sphinx/webhook.log
			rm -r  /var/www/sphinx/www/static/$lang
			mv /var/www/sphinx/www/docs.nitrokey.com_$lang-temp /var/www/sphinx/www/static/$lang
		else
			echo echo "FAILED" >> /var/www/sphinx/logs_sphinx/webhook.log
			echo "Building Docs.nitrokey.com Language $lang FAILED. The online version was not altered." | mail -s "[Sphinx] ($BASHPID) Building Language $lang FAILED." $admin_mail_address
		fi
	fi
done


echo "$(date) [apply_translated_content.sh] ($BASHPID) Atempts to buil all languages DONE." >> /var/www/sphinx/logs_sphinx/webhook.log

for lang in "${languages[@]}"
do
	[[ -d "/var/www/sphinx/www/docs.nitrokey.com_$lang-temp" ]] && 	echo "After translated content was build, the temporary directory /var/www/sphinx/www/docs.nitrokey.com_$lang-temp still exists. Something may have gone wrong. The directory should be deleted before the next build with command rm /var/www/sphinx/www/docs.nitrokey.com*-temp -r" | mail -s "[Sphinx] ($BASHPID) Warning - Building Language $lang." $admin_mail_address

done
