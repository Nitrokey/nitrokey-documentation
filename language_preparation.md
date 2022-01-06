html_context = {
    "display_github": True, # Integrate GitHub
    "github_user": "Nitrokey", # Username
    "github_repo": "nitrokey-documentation",
    "github_version": "", # Version
    "conf_py_path": "master/", # Path in the checkout to the docs root
    "suffix": ".rst",
    "copyrightlink" : "https://www.nitrokey.com",
    "languages" : {
        'de' : 'Deutsch',
        'en' : 'English',
        'fr' : 'français',
        'es' : 'Español',
        'nl' : 'Nederlands',
        'it' : 'Italiano',
        'ja' : 'やまと',
        'ru' : 'Русский',
        'zh_CN' : '中国',
        'el' : 'Ελληνική',
        },
    "lang_switch_info": {
        'de' : 'Diese Seite ist auf Deutsch verfügbar.',
        'en' : 'This page is available in English.',
        'fr' : 'Cette page est disponible en français',
        'es' : 'Esta página está disponible en español.',
        'nl' : 'Deze pagina is beschikbaar in het Nederlands.',
        'it' : 'Questa pagina è disponibile in italiano.',
        'ja' : 'このページは日本語でご覧いただけます。',
        'ru' : 'Эта страница доступна на русском языке.',
        'zh_CN' : '本页有中文版本。',
        'el' : 'Αυτή η σελίδα είναι διαθέσιμη στα ελληνικά.',
    },
    "lang_switch_label": {
        'de' : 'Auf Deutsch ansehen',
        'en' : 'Switch to English',
        'fr' : 'Passer au français',
        'es' : 'Cambia al español.',
        'nl' : 'Schakel over op Nederlands.',
        'it' : 'Passa all'italiano.',
        'ja' : '日本語に切り替えます。',
        'ru' : 'Переключитесь на русский язык.',
        'zh_CN' : '换成中文。',
        'el' : 'Αλλαγή σε ελληνικά.',
    },
    "dismiss_label": {
        'de' : 'Ausblenden',
        'en' : 'Dismiss',
        'fr' : 'Cacher',
        'es' : 'Ocultar',
        'nl' : 'Verberg',
        'it' : 'Nascondi',
        'ja' : '隠す',
        'ru' : 'Скрыть',
        'zh_CN' : '隐藏',
        'el' : 'Απόκρυψη',
    }

}


https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-internationalization


Niederländisch, Italienisch, Japanisch, Russisch, Chinesisch, Griechisch


https://translate.nitrokey.com/new-lang/nitrokey-documentation/index/
NICHT Pushen, nicht commiten!!!



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

================================================
vim apply_new_content.sh

sphinx-intl update -p ./locales/ -l de -l fr -l es -l nl -l it -l ja -l ru -l zh_CN -l el

	Added Languages: es,nl,it,ja,ru,zh_CN,el

=================================================


Bulgarisch
        'bg' : 'Български',
        'bg' : 'Тази страница е достъпна на български език.',
        'bg' : 'Преминете на български език.',
        'bg' : 'Скрий',

Dänisch
        'da' : 'Dansk',
        'da' : 'Denne side er tilgængelig på dansk.',
        'da' : 'Skift til dansk.',
        'da' : 'Skjul',

Estnisch
        'et' : 'Eesti',
        'et' : 'See lehekülg on saadaval eesti keeles.',
        'et' : 'Vahetage eesti keelele.',
        'et' : 'Peida',

Finnisch
        'fi' : 'Suomalainen',
        'fi' : 'Tämä sivu on saatavilla suomeksi.',
        'fi' : 'Vaihda suomeksi.',
        'fi' : 'Piilota',

Lettisch
        'lv' : 'Latviešu',
        'lv' : 'Šī lapa ir pieejama latviešu valodā.',
        'lv' : 'Pārslēgties uz latviešu valodu.',
        'lv' : 'Paslēpt',

Litauisch
        'lt' : 'Lietuvių kalba',
        'lt' : 'Šis puslapis pateikiamas lietuvių kalba.',
        'lt' : 'Perjunkite į lietuvių kalbą.',
        'lt' : 'Paslėpti',

Polnisch
        'pl' : 'Polski',
        'pl' : 'Ta strona jest dostępna w języku polskim.',
        'pl' : 'Przełącz się na język polski.',
        'pl' : 'Ukryj',

Portugiesisch
        'pt' : 'Português',
        'pt' : 'Esta página está disponível em português.',
        'pt' : 'Mudar para português.',
        'pt' : 'Esconder',

Rumänisch
        'ro' : 'Românesc',
        'ro' : 'Această pagină este disponibilă în limba română.',
        'ro' : 'Treceți la limba română.',
        'ro' : 'Ascundeți',

Schwedisch
        'sv' : 'Svenska',
        'sv' : 'Den här sidan finns på svenska.',
        'sv' : 'Växla till svenska.',
        'sv' : 'Dölj',

Slowakisch
        'sk' : 'Slovenská',
        'sk' : 'Táto stránka je k dispozícii v slovenčine.',
        'sk' : 'Prepnite na slovenčinu.',
        'sk' : 'Skryť',

Slowenisch
        'sl' : 'Slovenski',
        'sl' : 'Ta stran je na voljo v slovenščini.',
        'sl' : 'Preklopite na slovenščino.',
        'sl' : 'Skrij',

Tschechisch
        'cs' : 'Česky',
        'cs' : 'Tato stránka je k dispozici v češtině.',
        'cs' : 'Přepněte na češtinu.',
        'cs' : 'Skrýt',

Ungarisch
        'hu' : 'Magyar',
        'hu' : 'Ez az oldal magyar nyelven érhető el.',
        'hu' : 'Váltson magyarra.',
        'hu' : 'Rejtsd el',
