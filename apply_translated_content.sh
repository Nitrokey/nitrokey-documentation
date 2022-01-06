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


# building French version
sphinx-build -a -D language='fr' -b html /var/www/sphinx/sphinx/nitrokey-documentation/ /var/www/sphinx/www/docs.nitrokey.com_fr_temp
rm -r  /var/www/sphinx/www/static/fr
mv /var/www/sphinx/www/docs.nitrokey.com_fr_temp /var/www/sphinx/www/static/fr
echo "$(date) [apply_translated_content.sh] French DONE." >> /var/www/sphinx/logs_sphinx/webhook.log

# building Spanish version
sphinx-build -a -D language='es' -b html /var/www/sphinx/sphinx/nitrokey-documentation/ /var/www/sphinx/www/docs.nitrokey.com_es_temp
rm -r  /var/www/sphinx/www/static/es
mv /var/www/sphinx/www/docs.nitrokey.com_es_temp /var/www/sphinx/www/static/es
echo "$(date) [apply_translated_content.sh] Spanish DONE." >> /var/www/sphinx/logs_sphinx/webhook.log

# building Dutch version
sphinx-build -a -D language='nl' -b html /var/www/sphinx/sphinx/nitrokey-documentation/ /var/www/sphinx/www/docs.nitrokey.com_nl_temp
rm -r  /var/www/sphinx/www/static/nl
mv /var/www/sphinx/www/docs.nitrokey.com_nl_temp /var/www/sphinx/www/static/nl
echo "$(date) [apply_translated_content.sh] Dutch DONE." >> /var/www/sphinx/logs_sphinx/webhook.log

# building Italian version
sphinx-build -a -D language='it' -b html /var/www/sphinx/sphinx/nitrokey-documentation/ /var/www/sphinx/www/docs.nitrokey.com_it_temp
rm -r  /var/www/sphinx/www/static/it
mv /var/www/sphinx/www/docs.nitrokey.com_it_temp /var/www/sphinx/www/static/it
echo "$(date) [apply_translated_content.sh] Italian DONE." >> /var/www/sphinx/logs_sphinx/webhook.log

# building Japanese version
sphinx-build -a -D language='ja' -b html /var/www/sphinx/sphinx/nitrokey-documentation/ /var/www/sphinx/www/docs.nitrokey.com_ja_temp
rm -r  /var/www/sphinx/www/static/ja
mv /var/www/sphinx/www/docs.nitrokey.com_ja_temp /var/www/sphinx/www/static/ja
echo "$(date) [apply_translated_content.sh] Japanese DONE." >> /var/www/sphinx/logs_sphinx/webhook.log

# building Russian version
sphinx-build -a -D language='ru' -b html /var/www/sphinx/sphinx/nitrokey-documentation/ /var/www/sphinx/www/docs.nitrokey.com_ru_temp
rm -r  /var/www/sphinx/www/static/ru
mv /var/www/sphinx/www/docs.nitrokey.com_ru_temp /var/www/sphinx/www/static/ru
echo "$(date) [apply_translated_content.sh] Russian DONE." >> /var/www/sphinx/logs_sphinx/webhook.log

# building Chinese version
sphinx-build -a -D language='zh_CN' -b html /var/www/sphinx/sphinx/nitrokey-documentation/ /var/www/sphinx/www/docs.nitrokey.com_zh_CN_temp
rm -r  /var/www/sphinx/www/static/zh_CN
mv /var/www/sphinx/www/docs.nitrokey.com_zh_CN_temp /var/www/sphinx/www/static/zh_CN
echo "$(date) [apply_translated_content.sh] Chinese DONE." >> /var/www/sphinx/logs_sphinx/webhook.log

# building Greek version
sphinx-build -a -D language='el' -b html /var/www/sphinx/sphinx/nitrokey-documentation/ /var/www/sphinx/www/docs.nitrokey.com_el_temp
rm -r  /var/www/sphinx/www/static/el
mv /var/www/sphinx/www/docs.nitrokey.com_el_temp /var/www/sphinx/www/static/el
echo "$(date) [apply_translated_content.sh] Greek DONE." >> /var/www/sphinx/logs_sphinx/webhook.log

