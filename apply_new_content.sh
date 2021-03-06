echo "$(date) webhook Content change triggered." >> /var/www/sphinx/logs/webhook.log

cd /var/www/sphinx/sphinx/nitrokey-documentation

# pull new content
git pull

# build english version
sphinx-build -a -D language='en' -b html . /var/www/sphinx/www/static/ 

# generate language files and push
sphinx-build -b gettext . ./locales/
sphinx-intl update -p ./locales/ -l de -l fr -l es
git add --all
git commit -m "Language Files generated by Sphinx"
git push
