echo "building German version"
sphinx-build -D language='de' -b html ~/sphinx/nitrokey-documentation/ ~/www/static/de/
echo "building french version"
sphinx-build -D language='fr' -b html ~/sphinx/nitrokey-documentation/ ~/www/static/fr/
echo "building spanish version"
sphinx-build -D language='es' -b html ~/sphinx/nitrokey-documentation/ ~/www/static/es/
