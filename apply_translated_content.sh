echo "$(date) [apply_translated_content.sh] webhook Weblate triggered. Building language versions." >> /var/www/sphinx/logs_sphinx/webhook.log

cd /var/www/sphinx/sphinx/nitrokey-documentation

# pull new content
git pull

# clean excluded files
git clean -f -d

# building German version
sphinx-build -a -D language='de' -b html /var/www/sphinx/sphinx/nitrokey-documentation/ /var/www/sphinx/www/static/de/
echo "$(date) [apply_translated_content.sh] German DONE." >> /var/www/sphinx/logs_sphinx/webhook.log


# building french version
#sphinx-build -a -D language='fr' -b html /var/www/sphinx/sphinx/nitrokey-documentation/ /var/www/sphinx/www/static/fr/
#echo "$(date) [apply_translated_content.sh] french DONE." >> /var/www/sphinx/logs_sphinx/webhook.log

# building spanish version
#sphinx-build -a -D language='es' -b html /var/www/sphinx/sphinx/nitrokey-documentation/ /var/www/sphinx/www/static/es/
#echo "$(date) [apply_translated_content.sh] spanish DONE." >> /var/www/sphinx/logs_sphinx/webhook.log

