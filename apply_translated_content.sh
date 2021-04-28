echo "$(date) [apply_translated_content.sh] webhook Weblate triggered. Building language versions." >> /var/www/sphinx/logs_sphinx/webhook.log

cd /var/www/sphinx/sphinx/nitrokey-documentation

# pull new content
git pull

# clean excluded files
# git clean -f -d

# building German version
sphinx-build -a -D language='de' -b html /var/www/sphinx/sphinx/nitrokey-documentation/ /var/www/sphinx/www/docs.nitrokey.com_de_temp
rm -r  /var/www/sphinx/www/static/de/
mv /var/www/sphinx/www/docs.nitrokey.com_de_temp /var/www/sphinx/www/static/de

echo "$(date) [apply_translated_content.sh] German DONE." >> /var/www/sphinx/logs_sphinx/webhook.log

