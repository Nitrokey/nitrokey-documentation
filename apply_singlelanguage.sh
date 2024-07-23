#!/bin/bash

lang=$1 
	echo "$(date) [apply_translated_content.sh] (SPHINX) Building Language Version $lang..." >> /var/www/sphinx/logs_sphinx/webhook.log
	
	# Remove old lang-temp directory to purge removed content
	rm -r /var/www/sphinx/sphinx/sphinx_build_temp/$lang-temp

	sphinx-build -a -D language="$lang" /var/www/sphinx/sphinx/nitrokey-documentation/  /var/www/sphinx/sphinx/sphinx_build_temp/$lang-temp
	status=$?

	if [ $status -eq 0 ]
	then
		echo "$(date) [apply_translated_content.sh] (SPHINX) Building Language Version $lang...DONE" >> /var/www/sphinx/logs_sphinx/webhook.log
		rm -r  /var/www/sphinx/www/static/$lang
		cp -r /var/www/sphinx/sphinx/sphinx_build_temp/$lang-temp /var/www/sphinx/www/static/$lang
	else
		echo "FAILED" >> /var/www/sphinx/logs_sphinx/webhook.log
	fi

