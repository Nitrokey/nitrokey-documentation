#!/bin/bash

# deactivate
#echo "$(date) [apply_translated_content.sh] DEACTIVATED.." >> /var/www/sphinx/logs_sphinx/webhook.log & exit

# Load Variables and Language Codes
source /var/www/sphinx/sphinx/nitrokey-documentation/config.sh

if [ $? -ne 0 ]
then
	echo "Building Docs.nitrokey.com – [apply_translated_content.sh] config.sh not loaded correctly." | mail -s "[Sphinx] ($BASHPID) Error Loading Config File." $admin_mail_address
	echo "$(date) [apply_translated_content.sh] ($BASHPID) Error loading config.sh" >> /var/www/sphinx/logs_sphinx/webhook.log
	exit
fi


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
echo "$(date) [apply_translated_content.sh] ($BASHPID) Building language versions (mode $build_mode)." >> /var/www/sphinx/logs_sphinx/webhook.log

for lang in "${languages[@]}"
do
	echo "$(date) [apply_translated_content.sh] ($BASHPID) (SPHINX) Building Language Version $lang..." >> /var/www/sphinx/logs_sphinx/webhook.log
	if [ $build_mode == "full" ]
	then
		if [ -d "/var/www/sphinx/www/docs.nitrokey.com_$lang-temp" ]
		then
			echo "$(date) [apply_translated_content.sh] ($BASHPID) (SPHINX) Building Language Version $lang SKIPPED. (Directory not empty. Another build process may be running)"  >> /var/www/sphinx/logs_sphinx/webhook.log
			echo "Building was skipped, as the temporary directory /var/www/sphinx/www/docs.nitrokey.com_$lang-temp already existed. Something may have gone wrong earlier or another build process was running at the same time. The directory should be deleted before the next build." | mail -s "[Sphinx] ($BASHPID) Warning - Building Language $lang." $admin_mail_address

		else
			sphinx-build -a -D language="$lang" -b html /var/www/sphinx/sphinx/nitrokey-documentation/ /var/www/sphinx/sphinx/sphinx_build_temp/$lang-temp
			status=$?
		fi
	elif [ $build_mode == "incremental" ]
	then
		sphinx-build -D language="$lang" -b html /var/www/sphinx/sphinx/nitrokey-documentation/ /var/www/sphinx/sphinx/sphinx_build_temp/$lang-temp
		status=$?
	else
		echo "Building Docs.nitrokey.com Language $lang FAILED. Sphinx build mode in config.sh unkown." | mail -s "[Sphinx] ($BASHPID) Building Language $lang FAILED." $admin_mail_address
	fi
		

	if [ $status -eq 0 ]
	then
		echo "$(date) [apply_translated_content.sh] ($BASHPID) (SPHINX) Building Language Version $lang...DONE" >> /var/www/sphinx/logs_sphinx/webhook.log
		
		if [ $build_mode == "full" ]
		then
			rm -r /var/www/sphinx/www/static/$lang
			mv /var/www/sphinx/sphinx/sphinx_build_temp/$lang-temp /var/www/sphinx/www/static/$lang
		elif [ $build_mode == "incremental" ]
		then
			# small downtime
			cp /var/www/sphinx/sphinx/sphinx_build_temp/$lang-temp /var/www/sphinx/www/static/ -r
			rm -r  /var/www/sphinx/www/static/$lang
			mv /var/www/sphinx/www/static/$lang-temp  /var/www/sphinx/www/static/$lang
		fi

	else
		echo "$(date) [apply_translated_content.sh] ($BASHPID) (SPHINX) Building Language Version $lang...FAILED" >> /var/www/sphinx/logs_sphinx/webhook.log
		echo "Building Docs.nitrokey.com Language $lang FAILED. The online version was not altered." | mail -s "[Sphinx] ($BASHPID) Building Language $lang FAILED." $admin_mail_address
	fi
done


echo "$(date) [apply_translated_content.sh] ($BASHPID) Atempts to buil all languages DONE." >> /var/www/sphinx/logs_sphinx/webhook.log
