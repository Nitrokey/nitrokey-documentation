# building German version
sphinx-build -D language='de' -b html /var/www/sphinx/sphinx/nitrokey-documentation/ /var/www/sphinx/www/static/de/

# building french version
sphinx-build -D language='fr' -b html /var/www/sphinx/sphinx/nitrokey-documentation/ /var/www/sphinx/www/static/fr/

# building spanish version
sphinx-build -D language='es' -b html /var/www/sphinx/sphinx/nitrokey-documentation/ /var/www/sphinx/www/static/es/

