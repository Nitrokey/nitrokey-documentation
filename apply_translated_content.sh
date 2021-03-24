echo "$(date) webhook Weblate triggered." >> /var/www/sphinx/logs/webhook.log

# building German version
sphinx-build -a -D language='de' -b html /var/www/sphinx/sphinx/nitrokey-documentation/ /var/www/sphinx/www/static/de/

# building french version
#sphinx-build -a -D language='fr' -b html /var/www/sphinx/sphinx/nitrokey-documentation/ /var/www/sphinx/www/static/fr/

# building spanish version
#sphinx-build -a -D language='es' -b html /var/www/sphinx/sphinx/nitrokey-documentation/ /var/www/sphinx/www/static/es/

