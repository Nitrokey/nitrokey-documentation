#!/bin/bash
mkdir ~/www/docs.nitrokey.com_en_temp
sphinx-build -a -D language='en' -b html . ~/www/docs.nitrokey.com_en_temp
# -a	If given, always write all output files. The default is to only write output files for new and changed source files. (This may not apply to all builders.)

# move translations into new build
mv ~/www/static/?? ~/www/docs.nitrokey.com_en_temp/
rm ~/www/static -r
mv ~/www/docs.nitrokey.com_en_temp ~/www/static
